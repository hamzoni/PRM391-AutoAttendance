import sys
sys.path
sys.path.insert(0, './object_detection')

import numpy as np
import os
import six.moves.urllib as urllib

import tarfile
import tensorflow as tf
import zipfile

from collections import defaultdict
from io import StringIO
from matplotlib import pyplot as plt
from PIL import Image

import cv2

from utils import label_map_util
from utils import visualization_utils as vis_util




sys.path.append("..")

MODEL_NAME = 'ssd_face'

PATH_TO_CKPT = MODEL_NAME + '/graph.pb'

PATH_TO_LABELS = os.path.join('data', 'mscoco_label_map.pbtxt')

NUM_CLASSES = 90

detection_graph = tf.Graph()
with detection_graph.as_default():
  od_graph_def = tf.GraphDef()
  with tf.gfile.GFile(PATH_TO_CKPT, 'rb') as fid:
    serialized_graph = fid.read()
    od_graph_def.ParseFromString(serialized_graph)
    tf.import_graph_def(od_graph_def, name='')


# ## Loading label map
# In[7]:

label_map = label_map_util.load_labelmap(PATH_TO_LABELS)
categories = label_map_util.convert_label_map_to_categories(label_map, max_num_classes=NUM_CLASSES, use_display_name=True)
category_index = label_map_util.create_category_index(categories)


# ## Helper code

# In[8]:

def load_image_into_numpy_array(image):
  (im_width, im_height) = image.size
  return np.array(image.getdata()).reshape(
      (im_height, im_width, 3)).astype(np.uint8)


# # Detection
img_dir = 'test_images'
img_src = []
for file in os.listdir(img_dir):
    if file.endswith('.jpg'):
        img_src.append(os.path.join(img_dir, file))

i = 0
j = 0
with detection_graph.as_default():
  with tf.Session(graph=detection_graph) as sess:
    for img in img_src:
      image_np = cv2.imread(img)
      image = image_np.copy()

      image_np_expanded = np.expand_dims(image_np, axis=0)
      image_tensor = detection_graph.get_tensor_by_name('image_tensor:0')
      boxes = detection_graph.get_tensor_by_name('detection_boxes:0')
      scores = detection_graph.get_tensor_by_name('detection_scores:0')
      classes = detection_graph.get_tensor_by_name('detection_classes:0')
      num_detections = detection_graph.get_tensor_by_name('num_detections:0')
      
      # Actual detection.
      (boxes, scores, classes, num_detections) = sess.run(
          [boxes, scores, classes, num_detections],
          feed_dict={image_tensor: image_np_expanded})

      vis_util.visualize_boxes_and_labels_on_image_array(
          image_np,
          np.squeeze(boxes),
          np.squeeze(classes).astype(np.int32),
          np.squeeze(scores),
          category_index,
          use_normalized_coordinates=True,
          line_thickness=1)

      crop_imgs = []
      width, height, channels = image_np.shape

      # cv2.imshow('img', image)

      for box in boxes[0]:
        ymin = int(box[0]*height)
        xmin = int(box[1]*width)
        ymax = int(box[2]*height)
        xmax = int(box[3]*width)

        crop_img = image[ymin:ymax, xmin:xmax]

        cv2.imshow('image_np' + str(i), image)
        i = i + 1
        if i == 2 : break

        # crop_imgs.append(crop_img)

      # for img in crop_imgs:
      #   # print img
        # cv2.imshow('image_np' + str(i), img)
        # i = i + 1
      j = j + 1
      if j == 3: break
cv2.waitKey(0)