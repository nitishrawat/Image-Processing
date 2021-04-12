% Compress an image file (256 x 256 x 8 image) using DCT.
% Display the resulting image after decompression along with
% the originals, for 8 different compression ratios.

clc
close all
clear all

img = imread('download.jpg');
q=[64,128,256,512];
img1 = img;

size(img1)
img1 = round(dct2(double(img1)));

disp('DCT completed');
size(img1)

qimg1 = round(img1 / q(1));
qimg2 = round(img1 / q(2));
qimg3 = round(img1 / q(3));
qimg4 = round(img1 / q(4));

disp('Huffman Encoding...');
[eimg1,dict1]=huffenco(qimg1);
[eimg2,dict2]=huffenco(qimg2);
[eimg3,dict3]=huffenco(qimg3);
[eimg4,dict4]=huffenco(qimg4);

disp('Huffman finished...');
size(eimg1)
disp('decoding...image 1');
dimg1=huffmandeco(eimg1,dict1);
disp('decoding...image 2');
dimg2=huffmandeco(eimg2,dict2);
disp('decoding...image 3');
dimg3=huffmandeco(eimg3,dict3);
disp('decoding...image 4');
dimg4=huffmandeco(eimg4,dict4);
disp('decoding finished');
size(dimg1)
dimg1 = dimg1 * q(1);
dimg2 = dimg2 * q(2);
dimg3 = dimg3 * q(3);
dimg4 = dimg4 * q(4);
dimg1 = reshape(dimg1, size(img1, 1), size(img1, 2));
dimg2 = reshape(dimg2, size(img1, 1), size(img1, 2));
dimg3 = reshape(dimg3, size(img1, 1), size(img1, 2));
dimg4 = reshape(dimg4, size(img1, 1), size(img1, 2));
deco_image1 = round(idct2(dimg1));
deco_image2 = round(idct2(dimg2));
deco_image3 = round(idct2(dimg3));
deco_image4 = round(idct2(dimg4));

screen_size = get(0, 'ScreenSize');
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );
subplot(2,3,1),imshow(img),title('Image');
subplot(2,3,2),imshow(deco_image1,[0 255]),title('Compressed 1');
subplot(2,3,3),imshow(deco_image2,[0 255]),title('Compressed 2');
subplot(2,3,4),imshow(deco_image3,[0 255]),title('Compressed 3');
subplot(2,3,5),imshow(deco_image4,[0 255]),title('Compressed 4');
