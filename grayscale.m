% amalhot5, grayscale.m, Arnav Malhotra
% Reads image, displays it and converts it to grayscale
% Number 1
clear all

hopkins1 = imread('hopkins1.bmp');
figure;
imshow(hopkins1)
title('Hopkins1.bmp RGB');
R = hopkins1(:,:,1);
G = hopkins1(:,:,2);
B = hopkins1(:,:,3);
gray = 0.2989 * R + 0.5870 * G + 0.1140 * B;
figure;
imshow(gray)
title('Hopkins1.bme Grayscale');