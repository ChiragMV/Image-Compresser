clc;
clear all;
close all;
name=input('enter the image name: ','s');
%Reading and displaying of original image
P=100;
A=imread(name);
subplot(3,2,1);
imshow(A);
title('original image');
%Converting original jpg image into gray image and plotting it
B=rgb2gray(A);
subplot(3,2,2);
imshow(B);
title('original to gray image');
%n1,n2 shows the resolution of image
b=double(B);
[n1,n2]=size(b);
% plotting of gray image
subplot(3,2,3);
imshow(B);
title('gray image');
%Converting Grayimage to original image and plotting it
C=gray2ind(B);
subplot(3,2,4);
imshow(C);
title(' gray to rgb image');
% plotting histogram of gray image
subplot(3,2,5);
imhist(B);
title('histogram of grayimage');
%plotting histogram of original image
subplot(3,2,6);
imhist(C);
title('histogram of rgbimage');
%Compression of jpg image
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
%plotting original image
subplot(2,2,1);
imshow(A);
title('Original Image');
%plotting of Compressed jpg image
subplot(2,2,2);
imshow(RGB);
title('DCT compressed image');
imwrite(RGB,'compressed.jpg');