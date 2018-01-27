#!/bin/bash
python label_image.py --graph=../train/faces.graph --labels=../train/names.txt --input_layer=Mul --output_layer=final_result --input_mean=128 --input_std=128 --image=$1

