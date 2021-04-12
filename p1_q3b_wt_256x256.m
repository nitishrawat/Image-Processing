% 3.b) On real, 256X256 image, take the WT.
% Display the transform coefficients as 8-bit 
% intensity images along with the original images.

clc;
f = imread('CoreopsisSunrayFlower.jpg');
[M,N,O]=size(f);
sum=0;
F=zeros(M,N,O);
basis=ones(M,M);
n=log2(M)
for u=0:(M-1)
    for x=0:(M-1)
        binx=dec2bin(x,n);
        binu=dec2bin(u,n);
        for i=1:n
            val=(binx(n-i+1)*binu(i));
            basis(x+1,u+1)=basis(x+1,u+1)*((-1)^val);
        end
    end
end
for w=1:3
    F(:,:,w)=basis*double(f(:,:,w))*basis.'/M;
end
screen_size = get(0, 'ScreenSize');
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4) ] );
subplot(1,3,1)
imshow(f),title('256 X 256 Real Image Matrix');
subplot(1,3,2)
imshow(F),title('WT Matrix');
subplot(1,3,3)
imshow(basis),title('WT basis Matrix');