% amalhot5, DispHistogram.m, Arnav Malhotra
% Reads image, displays it, and displays its histogram
% Number 2
clear all

SimpleImage = imread('SimpleImage.bmp');
figure;
image(SimpleImage)
title('SimpleImage.bmp');
R = SimpleImage(:,:,1);
G = SimpleImage(:,:,2);
B = SimpleImage(:,:,3);
gray = 0.2989 * R + 0.5870 * G + 0.1140 * B;
figure;
imhist(gray)
title('SimpleImage.bmp Histogram');