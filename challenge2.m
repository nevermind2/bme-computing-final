% amalhot5, challenge2.m, Arnav Malhotra
% Worked on by myself
% Segment and find the hidden image
clear all

%% Read Image, Convert to Grayscale, and Display the Histogram
HiddenObject = imread('HiddenObject.bmp');
figure;
imshow(HiddenObject)
R = HiddenObject(:,:,1);
G = HiddenObject(:,:,2);
B = HiddenObject(:,:,3);
gray = 0.2989 * R + 0.5870 * G + 0.1140 * B;
figure;
imhist(gray)
title('Histogram of HiddenObject.bmp');
threshold = 150;
new_threshold = 0;

%% Find Ideal Threshold
[pixelCount, intensity] = imhist(gray);
count = 0;
while threshold ~= new_threshold
    background = pixelCount(1:threshold);
    foreground = pixelCount(threshold+1:256);
    g_b = fit(intensity(1:threshold),background,'gauss1');
    g_f = fit(intensity(threshold+1:256),foreground,'gauss1');
    y1 = transpose(feval(g_b,0:255));
    y2 = transpose(feval(g_f,0:255));
    x = transpose(intensity);
    z = abs(y1-y2);
    intersect = find(z == min(z));
    if intersect < 100
        threshold = 150;
    elseif intersect == threshold
        new_threshold = intersect;
        break
    else
        threshold = intersect;
    end
    count = count + 1;
    if count == 51 % This is because sometimes it oscillates between two numbers
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
title('Histogram of HiddenImage.bmp with Fitted Curves')
%% Segment Image
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