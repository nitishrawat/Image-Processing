% 3.b) On real, 256X256 image, take the HT.
% Display the transform coefficients as 8-bit 
% intensity images along with the original images.

clc
img = imread('CoreopsisSunrayFlower.jpg');
[M,N,O]=size(img);
for i=1:O
    F(:,:,i)=haar2(img(:,:,i));
end
screen_size = get(0, 'ScreenSize');
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4) ] );
subplot(1,2,1)
imshow(img),title('256 X 256 Real Image Matrix');
subplot(1,2,2)
imshow(F),title('HT Matrix');