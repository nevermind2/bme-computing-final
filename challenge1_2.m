% amalhot5, challenge1_2.m, Arnav Malhotra
% Worked on by myself
% Challenge 1
clear all

%% Read Image and Convert to Grayscale
SimpleObjects = imread('SimpleObjects.bmp');
R = SimpleObjects(:,:,1);
G = SimpleObjects(:,:,2);
B = SimpleObjects(:,:,3);
gray = 0.2989 * R + 0.5870 * G + 0.1140 * B;

%% Find Peaks in Histogram
[pixelCount, intensity] = imhist(gray);
w = ismember(pixelCount,findpeaks(pixelCount,'MinPeakHeight', 1000));
loc = find(w);

%% Threshold Image Based on Peaks
s=size(gray);
fig1 = gray;
for i=[1:s(1,1)]
    for j = [1:s(1,2)]
        if fig1(i,j)>=loc(1) & fig1(i,j) < loc(2)
            fig1(i,j)=0;
        else
            fig1(i,j)=1;
        end
    end
end
figure;
subplot(2,2,1)
colormap('gray'); 
imagesc(fig1);
title('First Image Binary');
%%
s = size(gray);
fig2 = gray;
for i=[1:s(1,1)]
    for j = [1:s(1,2)]
        if fig2(i,j)>=loc(2) & fig2(i,j) < loc(3)
            fig2(i,j)=0;
        else
            fig2(i,j)=1;
        end
    end
end
subplot(2,2,2)
colormap('gray'); 
imagesc(fig2);
title('Second Image Binary');
%%
s=size(gray);
fig3 = gray;
for i=[1:s(1,1)]
    for j = [1:s(1,2)]
        if fig3(i,j)>=loc(1)-1 & fig3(i,j) <= loc(1)
            fig3(i,j)=0;
        else
            fig3(i,j)=1;
        end
    end
end
subplot(2,2,3)
colormap('gray'); 
imagesc(fig3);
title('Third Image Binary');
%%
s=size(gray);
fig4 = gray;
for i=[1:s(1,1)]
    for j = [1:s(1,2)]
        if fig4(i,j)<=loc(4) & fig4(i,j)>=loc(4)-1
            fig4(i,j)=0;
        else
            fig4(i,j)=1;
        end
    end
end
subplot(2,2,4)
colormap('gray'); 
imagesc(fig4);
title('Fourth Image Binary');