% 3.b) On real, 256X256 image, take the DFT.
% Display the transform coefficients as 8-bit 
% intensity images along with the original images.

clc
f = imread('CoreopsisSunrayFlower.jpg');
[M,N,O]=size(f);
sum=0;
j=sqrt(-1);
F=zeros(M,N,O);
basis=zeros(M,N);
for u=1:M
    for x=1:M
        basis(x,u)=exp(-(j*2*pi*((u-1)*(x-1)/M)));
    end
end
for w=1:O
    F(:,:,w)=basis*double(f(:,:,w))*basis.';
end
F2=ifft2(F/256);
F3=fft2(f);
screen_size = get(0, 'ScreenSize');
fig=figure(1);
set(fig, 'Position', [0 0 screen_size(3) screen_size(4) ] );
subplot(2,2,1),imshow(f),title('256 X 256 Real Image');
subplot(2,2,2),imshow(F),title('FFT Transformed Matrix');
subplot(2,2,3),imshow(F3),title('FFT Transformed Matrix by Matlab function');
subplot(2,2,4),imshow(F2),title('Inverse FFT Transformed Matrix by Matlab function');

