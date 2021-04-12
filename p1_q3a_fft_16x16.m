% 3. On sample artificial, 16X16 image, take the DFT.
% Print the image & transform matrix side by side 

clc
f = zeros(16);
f(5:7,4:7)=250;
f(2:3,2:3)=120;
f(8:12,11:14)=150;
[M,N]=size(f);
j=sqrt(-1);
F=zeros(16);
for u=1:M
    for v=1:N
        for x=1:M
            for y=1:N
                F(u,v)=F(u,v)+f(x,y)*exp(-(j*2*pi*(((u-1)*(x-1)/M)+((v-1)*(y-1)/N))));
            end
        end
    end
end
screen_size = get(0, 'ScreenSize');
fig=figure(1);
set(fig, 'Position', [0 0 screen_size(3) screen_size(4) ] );
subplot(1,2,1),imshow(f),title('16 X 16 Matrix');
subplot(1,2,2),imshow(F),title('FFT Transformed Matrix');
