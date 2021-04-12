% 3. Image reconstruction from projections:
% b) Reconstruct the above image
% from 1, 2, 4, 8, 16, 32, 64 and 128 projections using
% filtered back-projections algorithms.
% Display the reconstructed image along with the
% original for different cases

clc
close all
clear all
img=imread('download.jpg');

q=[1, 2, 4, 8, 16, 32, 64, 128];
screen_size = get(0, 'ScreenSize');
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );

subplot(3,3,1),imshow(img),title('256 X 256 image');
for i=1:length(q)
    theta=[0:180/q(i):180];
    [R,xp]=radon(img,theta);
    I=iradon(R,theta);
    
    

    
    text=sprintf('backprojection with %d intervals',q(i));
    subplot(3,3,i+1),imshow(I,[0 255]),title(text);
end
