#!/bin/bash
python retrain.py --model_dir imagenet --image_dir faces --output_graph faces.graph --how_many_training_steps $1

