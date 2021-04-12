% 3. Image reconstruction from projections:
% a) get the projection of a 256 x 256 x 8 bit image for 
% angles from 0 to 180 with increments 5 degrees.

clc
close all
clear all
img=imread('download.jpg');
[R,xp]=radon(img,[0:5:180]);
screen_size = get(0, 'ScreenSize');
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );
subplot(1,2,1)
imshow(img),title('256 X 256 Image');
subplot(1,2,2)
plot(xp,R);title('Projections');
