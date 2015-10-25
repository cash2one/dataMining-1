import cv2
backimage = cv2.imread('E:\past&future\image\DSC05498.JPG')
foreimage = cv2.imread('E:\past&future\image\DSC05504.JPG')
import numpy as np
image = foreimage-backimage
fore = cv2.cvtColor(foreimage,cv2.COLOR_BGR2GRAY)
back = cv2.cvtColor(backimage,cv2.COLOR_BGR2GRAY)
imagegr = fore-back
imgblur = cv2.medianBlur(imagegr,5)
#sobelx=cv2.Sobel(image,cv2.CV_64F,1,0,ksize=5)
kernel = np.ones((5,5),np.uint8)
tophat = cv2.morphologyEx(imgblur, cv2.MORPH_TOPHAT, kernel)
blur = cv2.GaussianBlur(imagegr,(5,5),0)
th2 = cv2.adaptiveThreshold(imagegr,255,cv2.ADAPTIVE_THRESH_MEAN_C,\
cv2.THRESH_BINARY,11,2)
th3 = cv2.adaptiveThreshold(imagegr,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,\
cv2.THRESH_BINARY,11,2)
ret1,th1 = cv2.threshold(image,127,255,cv2.THRESH_BINARY)
#ret2,th2 = cv2.threshold(image,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
cv2.namedWindow('img')
cv2.imshow('img',th3)
cv2.waitKey(0)

