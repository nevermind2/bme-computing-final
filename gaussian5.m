% amalhot5, gaussian5.m, Arnav Malhotra
% Worked on by myself
% Number 4
clear all
%% Read Image, Add Gaussian Noise, Display Histogram
SimpleImage = imread('SimpleImage.bmp');
noise = imnoise(SimpleImage, 'gaussian');
figure;
imagesc(noise)
title('Noisy Image')
R = noise(:,:,1);
G = noise(:,:,2);
B = noise(:,:,3);
gray = 0.2989 * R + 0.5870 * G + 0.1140 * B;
figure;
imhist(gray)
title('Histogram of the Noisy Image');
threshold = 150;
new_threshold = 0;

%% Find Ideal Threshold
[pixelCount, intensity] = imhist(gray);
count = 0;
while threshold ~= new_threshold
    background = pixelCount(1:threshold);
    foreground = pixelCount(threshold+1:256);
    g_b = fit(intensity(1:threshold),background,'gauss1');
    g_f = fit(intensity(threshold+1:256),foreground,'gauss2');
    y1 = transpose(feval(g_b,0:255));
    y2 = transpose(feval(g_f,0:255));
    x = transpose(intensity);
    z = abs(y1-y2); % to find the intersection (matlab can't process 'cfit' object to find the intersect)
    intersect = find(z == min(z)); % Since it doesn't intersect at an integer usually, instead of finding the zero, I found the minimum value
    if intersect < 100 % Found error, sometimes it finds the intersect to be 1 so in order to correct that
        threshold = 150; % anytime it is less than zero, we restart
    elseif intersect == threshold
        new_threshold = intersect;
        break
    else
        threshold = intersect;
    end
    count = count + 1;
    if count == 11 % Another error: sometimes it oscillates between two numbers
        threshold = intersect;
        break
    end
end
threshold
figure;
imhist(gray)
hold on
plot(g_f,'c')
plot(g_b)
hold off
title('Histogram of Noisy Image with the Ideal Fitted Curves')
%% Threshold Image Based on Found Threshold
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