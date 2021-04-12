% 3.b) On real, 256X256 image, take the DCT.
% Display the transform coefficients as 8-bit 
% intensity images along with the original images.

clc;
f = imread('CoreopsisSunrayFlower.jpg');
[M,N,O]=size(f);
figure(1);imshow(f);
F=zeros(M,N,O);
for u=0:(M-1)
        if u==0
            alphau=sqrt(1/M);
        else
            alphau=sqrt(2/M);
        end
    for x=0:(M-1)
        basis(u+1,x+1)=alphau*cos((2*x+1)*u*pi/(2*M));
    end
end
for w=1:3
    F(:,:,w)=basis*double(f(:,:,w))*basis.';
end
for i=1:3
    z(:,:,i) = dct2(f(:,:,i));
end
for i=1:3
    z2(:,:,i) = idct2(F(:,:,i));
end
screen_size = get(0, 'ScreenSize');
fig=figure(1);
set(fig, 'Position', [0 0 screen_size(3) screen_size(4) ] );
subplot(2,2,1),imshow(f),title('256 X 256 Real Image');
subplot(2,2,2),imshow(F),title('DCT Transformed Matrix');
subplot(2,2,3),imshow(z),title('DCT Transformed Matrix by Matlab function');
subplot(2,2,4),imshow(z2/256),title('Inverse FFT Transformed Matrix');