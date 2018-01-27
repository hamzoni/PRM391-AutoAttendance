import numpy as np
import cv2
from PIL import Image
import glob
import os

img_dir = '../Image/quy'
img_src = []
for file in os.listdir(img_dir):
    if file.endswith('.jpg'):
        img_src.append(os.path.join(img_dir, file))

face_cascade = cv2.CascadeClassifier('face.xml')

# start detecting faces

img_trg = './images/quy/'
i = 0
for img in img_src:

    img = cv2.imread(img)

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    faces = face_cascade.detectMultiScale(gray, 1.3, 5)
    for (x,y,w,h) in faces:
        cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
        roi_gray = gray[y:y+h, x:x+w]
        roi_color = img[y:y+h, x:x+w]
    cv2.imwrite(img_trg + 'quy' + str(i) + '.jpg', img)
    i = i + 1


