% 3. On sample artificial, 16X16 image, take the WT.
% Print the image & transform matrix side by side 

clc
f = zeros(16);
f(5:7,4:7)=250;
f(2:3,2:3)=120;
f(8:12,11:14)=150;
[M,N]=size(f);
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
imshow(f),title('16 X 16 Matrix');
subplot(1,3,2)
imshow(F),title('WT Matrix');
subplot(1,3,3)
imshow(basis),title('WT basis Matrix');