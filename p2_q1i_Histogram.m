% Write a program that compute the histogram of a Gray scale image.
% Also plot the histogram of the three components of a color
% image when represented in RGB.

clc
img = imread('download.jpg');
f1=figure(1);
screen_size = get(0, 'ScreenSize');
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );
subplot(1,2,1)
imshow(img);
%subplot(1,3,2)
%imhist(img);
hist_value = zeros(1,256);
for i=1:256
    for j=1:256
        hist_value(img(i,j)) = hist_value(img(i,j)) + 1;
    end
end
subplot(1,2,2)
bar(hist_value),title('Histogram');