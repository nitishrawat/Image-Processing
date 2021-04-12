% 3. On sample artificial, 8X8 image, take the WT.
% Print the image & transform matrix side by side 

clc
clear
f = zeros(8);
f(5:7,4:7)=250;
f(2:3,2:3)=120;
[M,N]=size(f);
sum=0;
F=zeros(M,N);
basis=ones(M,M);
n=log2(M);
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
F(:,:)=basis*double(f(:,:))*basis.'/M;
screen_size = get(0, 'ScreenSize');
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4) ] );
subplot(1,3,1)
imshow(f),title('8 X 8 Matrix');
subplot(1,3,2)
imshow(F),title('WT Matrix');
subplot(1,3,3)
imshow(basis),title('WT basis Matrix');
