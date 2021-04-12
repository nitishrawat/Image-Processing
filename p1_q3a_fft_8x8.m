% 3. On sample artificial, 8X8 image, take the DFT.
% Print the image & transform matrix side by side 

clc
f = zeros(8);
f(5:7,4:7)=250;
f(2:3,2:3)=120;
[M,N]=size(f);
sum=0;
j=sqrt(-1);
F=zeros(8);
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
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4) ] );
subplot(1,2,1)
imshow(f),title('8 X 8 Matrix');
subplot(1,2,2)
imshow(F),title('FFT Matrix');