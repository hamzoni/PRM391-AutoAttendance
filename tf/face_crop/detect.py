import numpy as np
import os
import sys
import tensorflow as tf

import cv2

import argparse
import os
import os.path

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import argparse



parser = argparse.ArgumentParser()

parser.add_argument('-f', help='student ID')

args = parser.parse_args()

#create folder to store train data

path = '../train/faces/' + args.f + '/'

if not os.path.exists(path): os.mkdir(path)

cap = cv2.VideoCapture(0)


PATH_TO_CKPT = 'ssd_face.pb'


detection_graph = tf.Graph()
with detection_graph.as_default():
	od_graph_def = tf.GraphDef()
	with tf.gfile.GFile(PATH_TO_CKPT, 'rb') as fid:
		serialized_graph = fid.read()
		od_graph_def.ParseFromString(serialized_graph)
		tf.import_graph_def(od_graph_def, name='')



with detection_graph.as_default():
	with tf.Session(graph=detection_graph) as sess:
		j = 0
		while True:
			ret, image_np = cap.read()
			frame = image_np.copy()

			image_np_expanded = np.expand_dims(image_np, axis=0)
			image_tensor = detection_graph.get_tensor_by_name('image_tensor:0')
			boxes = detection_graph.get_tensor_by_name('detection_boxes:0')
			scores = detection_graph.get_tensor_by_name('detection_scores:0')
			classes = detection_graph.get_tensor_by_name('detection_classes:0')
			num_detections = detection_graph.get_tensor_by_name('num_detections:0')
			
			(boxes, scores, classes, num_detections) = sess.run(
					[boxes, scores, classes, num_detections],
					feed_dict={image_tensor: image_np_expanded})


			w, h = frame.shape[:2]
			
			bxcls = boxes[0]
			bxscr = scores[0]

			for i in range(0, len(bxscr)):
				if bxscr[i] >= 0.7:
					ymin = int(bxcls[i][0]*w)
					xmin = int(bxcls[i][1]*h)
					ymax = int(bxcls[i][2]*w)
					xmax = int(bxcls[i][3]*h)

					crop_img = frame[ymin:ymax, xmin:xmax]
					cv2.imshow("cropped", crop_img)

					cv2.imwrite(path + str(j) + '.jpg', crop_img)

					cv2.rectangle(frame,(xmin,ymin),(xmax,ymax),(0,255,0),3)
					
					j = j + 1

					cv2.waitKey(75)

			cv2.imshow('frame', frame)

			if cv2.waitKey(25) & 0xFF == ord('q'):
				cv2.destroyAllWindows()
				break




