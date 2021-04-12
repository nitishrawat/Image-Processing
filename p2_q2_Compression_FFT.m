% Compress an image file (256 x 256 x 8 image) using DFT.
% Display the resulting image after decompression along 
% with the originals, for 8 different compression ratios

clc
close all
clear all

img = imread('download.jpg');
q=[5120,10240,20480,40960];
img1 = img;

size(img1)
img1 = round(fft2(double(img1)));

disp('DFT completed');
size(img1)

qimg1 = round(img1 / q(1));
qimg2 = round(img1 / q(2));
qimg3 = round(img1 / q(3));
qimg4 = round(img1 / q(4));

real1=real(qimg1);imag1=imag(qimg1);
real2=real(qimg2);imag2=imag(qimg2);
real3=real(qimg3);imag3=imag(qimg3);
real4=real(qimg4);imag4=imag(qimg4);

disp('Huffman Encoding...real 1');
[encoded_real_1,dict_real_1]=huffenco(real1);
disp('Huffman Encoding...real 2');
[encoded_real_2,dict_real_2]=huffenco(real2);
disp('Huffman Encoding...real 3');
[encoded_real_3,dict_real_3]=huffenco(real3);
disp('Huffman Encoding...real 4');
[encoded_real_4,dict_real_4]=huffenco(real4);
disp('Huffman Encoding...imag 1');
[encoded_imag_1,dict_imag_1]=huffenco(imag1);
disp('Huffman Encoding...imag 2');
[encoded_imag_2,dict_imag_2]=huffenco(imag2);
disp('Huffman Encoding...imag 3');
[encoded_imag_3,dict_imag_3]=huffenco(imag3);
disp('Huffman Encoding...imag 4');
[encoded_imag_4,dict_imag_4]=huffenco(imag4);

disp('Huffman finished...');
disp('decoding... real 1');
decoded_real_1=huffmandeco(encoded_real_1,dict_real_1);
disp('decoding... real 2');
decoded_real_2=huffmandeco(encoded_real_2,dict_real_2);
disp('decoding... real 3');
decoded_real_3=huffmandeco(encoded_real_3,dict_real_3);
disp('decoding... real 4');
decoded_real_4=huffmandeco(encoded_real_4,dict_real_4);
disp('decoding... imag 1');
decoded_imag_1=huffmandeco(encoded_imag_1,dict_imag_1);
disp('decoding... imag 2');
decoded_imag_2=huffmandeco(encoded_imag_2,dict_imag_2);
disp('decoding... imag 3');
decoded_imag_3=huffmandeco(encoded_imag_3,dict_imag_3);
disp('decoding... imag 4');
decoded_imag_4=huffmandeco(encoded_imag_4,dict_imag_4);

disp('decoding finished');

decoded1 = decoded_real_1 + decoded_imag_1 * i;
decoded2 = decoded_real_2 + decoded_imag_2 * i;
decoded3 = decoded_real_3 + decoded_imag_3 * i;
decoded4 = decoded_real_4 + decoded_imag_4 * i;

dimg1 = decoded1 * q(1);
dimg2 = decoded2 * q(2);
dimg3 = decoded3 * q(3);
dimg4 = decoded4 * q(4);
dimg1 = reshape(dimg1, size(img1, 1), size(img1, 2));
dimg2 = reshape(dimg2, size(img1, 1), size(img1, 2));
dimg3 = reshape(dimg3, size(img1, 1), size(img1, 2));
dimg4 = reshape(dimg4, size(img1, 1), size(img1, 2));
deco_image1 = round(ifft2(dimg1));
deco_image2 = round(ifft2(dimg2));
deco_image3 = round(ifft2(dimg3));
deco_image4 = round(ifft2(dimg4));

screen_size = get(0, 'ScreenSize');
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );
subplot(2,3,1),imshow(img),title('Image');
subplot(2,3,2),imshow(deco_image1,[0 255]),title('Compressed 1');
subplot(2,3,3),imshow(deco_image2,[0 255]),title('Compressed 2');
subplot(2,3,4),imshow(deco_image3,[0 255]),title('Compressed 3');
subplot(2,3,5),imshow(deco_image4,[0 255]),title('Compressed 4');
