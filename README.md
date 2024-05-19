# Image Processing and Compression Using DCT in MATLAB

## Overview
This MATLAB script performs various image processing tasks on an input image, including converting it to grayscale, plotting histograms, and compressing the image using Discrete Cosine Transform (DCT). The script prompts the user to input the image file name and the desired compression quality. The results are displayed using subplots for easy comparison and the compressed image is saved as 'compressed.jpg'.

## Prerequisites
- MATLAB installed on your system.
- Image Processing Toolbox for MATLAB.
- An image file to test the script.

## Usage

1. **Run the Script**
   - Start MATLAB.
   - Open the script file in MATLAB.
   - Run the script by clicking the "Run" button or typing the script name in the command window.

2. **Input Prompts**
   - The script will prompt you to enter the name of the image file (e.g., 'image.jpg'). Ensure that the image file is in the current working directory or provide the full path to the image file.
   - The script will then ask for the compression quality percentage (between 1 and 100). Enter a value within this range.

## Detailed Description of the Script

### Clearing and Setting Up
```matlab
clc;
clear all;
close all;
```
- `clc`: Clears the command window.
- `clear all`: Removes all variables from the workspace.
- `close all`: Closes all figure windows.

### Image Input and Display
```matlab
name=input('enter the image name: ','s');
P=100;
A=imread(name);
subplot(3,2,1);
imshow(A);
title('original image');
```
- Prompts the user to enter the image file name.
- Reads the image using `imread`.
- Displays the original image in the first subplot.

### Converting to Grayscale
```matlab
B=rgb2gray(A);
subplot(3,2,2);
imshow(B);
title('original to gray image');
```
- Converts the original image to grayscale using `rgb2gray`.
- Displays the grayscale image in the second subplot.

### Displaying Grayscale Image
```matlab
b=double(B);
[n1,n2]=size(b);
subplot(3,2,3);
imshow(B);
title('gray image');
```
- Converts the grayscale image to double precision.
- Determines the dimensions of the image.
- Displays the grayscale image in the third subplot.

### Converting Grayscale to Indexed Image
```matlab
C=gray2ind(B);
subplot(3,2,4);
imshow(C);
title(' gray to rgb image');
```
- Converts the grayscale image to an indexed image using `gray2ind`.
- Displays the indexed image in the fourth subplot.

### Histogram of Grayscale Image
```matlab
subplot(3,2,5);
imhist(B);
title('histogram of grayimage');
```
- Plots the histogram of the grayscale image in the fifth subplot.

### Histogram of Indexed Image
```matlab
subplot(3,2,6);
imhist(C);
title('histogram of rgbimage');
```
- Plots the histogram of the indexed image in the sixth subplot.

### Image Compression Using DCT
```matlab
rate=input('compression quality % (1<x<100): ');
original = imread(name);
original = double(original/255);
rate=1000*rate;
for i=1:3
    im=original(:,:,i);
    img_dct=dct2(im);
    img_pow=(img_dct).^2;
    img_pow=img_pow(:);
    [B,index]=sort(img_pow);
    B=flipud(B);
    index=flipud(index);
    compressed_dct=zeros(size(im));
    for k=1:rate
        compressed_dct(index(k))=img_dct(index(k));
    end
    img_dct=idct2(compressed_dct);
    RGB(:,:,i)=img_dct;
end
```
- Prompts the user to enter the compression quality percentage.
- Reads and normalizes the original image.
- Sets the compression rate.
- Applies DCT to each color channel (R, G, B) of the image.
- Compresses the DCT coefficients based on the specified quality rate.
- Performs inverse DCT to obtain the compressed image.

### Displaying Original and Compressed Images
```matlab
subplot(2,2,1);
imshow(A);
title('Original Image');
subplot(2,2,2);
imshow(RGB);
title('DCT compressed image');
imwrite(RGB,'compressed.jpg');
```
- Displays the original image in a subplot.
- Displays the DCT compressed image in another subplot.
- Saves the compressed image as 'compressed.jpg'.

## Conclusion
This script provides a comprehensive workflow for reading an image, converting it to grayscale, plotting its histograms, and compressing it using DCT. The results are visually compared using subplots, and the compressed image is saved for further use. Make sure to test the script with different images and compression rates to understand its functionality better.
