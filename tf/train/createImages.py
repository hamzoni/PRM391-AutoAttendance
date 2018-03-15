import numpy as np
import cv2

import argparse
import os
import os.path


parser = argparse.ArgumentParser()

parser.add_argument('-f', help='student ID')

args = parser.parse_args()

path = './faces/' + args.f + '/'

if not os.path.exists(path): os.mkdir(path)

cap = cv2.VideoCapture(0)

i = 0;
while(True):
	ret, frame = cap.read()

	cv2.waitKey(100);
	cv2.imshow('frame', frame)

	cv2.imwrite(path + str(i) + '.jpg', frame)
	
	if cv2.waitKey(1) & 0xFF == ord('q'): break
	i = i + 1

cap.release()
cv2.destroyAllWindows()


# crop images
data = '/home/taquy/Projects/python/prm/PRM391-AutoAttendance/tf/train/faces/' + args.f + '/';
os.system('python3 /home/taquy/Projects/python/prm/PRM391-AutoAttendance/tf/face_crop/cropimg.py -f ' + data);
