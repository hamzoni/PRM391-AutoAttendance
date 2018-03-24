from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import numpy as np
import os
import sys
import tensorflow as tf

import cv2

import argparse
import os
import os.path

import argparse


parser = argparse.ArgumentParser()
parser.add_argument("-i", help="image to be processed")
args = parser.parse_args()


PATH_TO_CKPT = 'ssd_face.pb'


detection_graph = tf.Graph()
with detection_graph.as_default():
	od_graph_def = tf.GraphDef()
	with tf.gfile.GFile(PATH_TO_CKPT, 'rb') as fid:
		serialized_graph = fid.read()
		od_graph_def.ParseFromString(serialized_graph)
		tf.import_graph_def(od_graph_def, name='')



def load_graph(model_file):
	graph = tf.Graph()
	graph_def = tf.GraphDef()

	with open(model_file, "rb") as f:
		graph_def.ParseFromString(f.read())
	with graph.as_default():
		tf.import_graph_def(graph_def)

	return graph


def read_tensor_from_image_file(image, input_height=299, input_width=299, input_mean=0, input_std=255):
	input_name = "file_reader"
	output_name = "normalized"

	float_caster = tf.cast(image, tf.float32)
	dims_expander = tf.expand_dims(float_caster, 0)
	resized = tf.image.resize_bilinear(dims_expander, [input_height, input_width])
	normalized = tf.divide(tf.subtract(resized, [input_mean]), [input_std])
	sess = tf.Session()
	result = sess.run(normalized)

	return result


def load_labels(label_file):
	label = []
	proto_as_ascii_lines = tf.gfile.GFile(label_file).readlines()
	for l in proto_as_ascii_lines:
		label.append(l.rstrip())
	return label


def classify(image) :
	facegraph = './faces.graph'

	graph = load_graph(facegraph)
	t = read_tensor_from_image_file(image, input_height=299, input_width=299, input_mean=128, input_std=128)

	input_name = "import/Mul"
	output_name = "import/final_result"
	input_operation = graph.get_operation_by_name(input_name)
	output_operation = graph.get_operation_by_name(output_name)

	with tf.Session(graph=graph) as sess:
		results = sess.run(output_operation.outputs[0], {
				input_operation.outputs[0]: t
		})
	results = np.squeeze(results)

	top_k = results.argsort()[-5:][::-1]
	labels = load_labels('./names.txt')

	return labels[top_k[0]]


with detection_graph.as_default():
	with tf.Session(graph=detection_graph) as sess:
		image_np = cv2.imread(args.i, 1);
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


		names = []

		for i in range(0, len(bxscr)):
			if bxscr[i] >= 0.7:
				ymin = int(bxcls[i][0]*w)
				xmin = int(bxcls[i][1]*h)
				ymax = int(bxcls[i][2]*w)
				xmax = int(bxcls[i][3]*h)

				crop_img = frame[ymin:ymax, xmin:xmax]
				cv2.imshow("cropped", crop_img)

				name = classify(crop_img)
				if not name in names:
					names.append(name)

		print (names)


