% amalhot5, thresholding.m, Arnav Malhotra
% worked on by myself, used matlab documentation, for displaying binary
% image used http://www.osmanoglu.org/supplement/unpublishedWork/DigitalImageProcessing_SegmentationAlgorithms.pdf
% Note: I only used that to figure out how to use imagesc properly not for
% the creation of the binary image
% Create a threshold for the image and segment it based on that threshold
% Number 3
clear all

%% Read Image, Convert to Grayscale, Display Histogram
SimpleImage = imread('SimpleImage.bmp');
R = SimpleImage(:,:,1);
G = SimpleImage(:,:,2);
B = SimpleImage(:,:,3);
gray = 0.2989 * R + 0.5870 * G + 0.1140 * B;
blankimage = zeros(500);
figure;
colormap('gray'); 
imagesc(blankimage);
title('Blank Image');
figure;
subplot(2,1,1);
imhist(gray)
title('Histogram of SimpleImage.bmp')
subplot(2,1,2);
imhist(blankimage)
title('Histogram of Blank Image');
threshold = 150
%% Segment Image Based on Threshold
s=size(gray);
for i=[1:s(1,1)]
    for j = [1:s(1,2)]
        if gray(i,j)>=threshold
            gray(i,j)=0;
        else
            gray(i,j)=1;
        end
    end
end
figure;
colormap('gray'); 
imagesc(gray);
title('SimpleImage.bmp Binary');