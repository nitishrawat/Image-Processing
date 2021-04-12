% 3. On sample artificial, 8X8 image, take the DCT.
% Print the image & transform matrix side by side 

clc
f = zeros(8);
f(5:7,4:7)=250;
f(2:3,2:3)=120;
[M,N]=size(f);
sum=0;
j=sqrt(-1);
F=zeros(8);
for u=0:M-1
    for v=0:N-1
        for x=0:M-1
            for y=0:N-1
                if u==0
                    alphau=sqrt(1/N);
                else
                    alphau=sqrt(2/N);
                end
                if v==0
                    alphav=sqrt(1/N);
                else
                    alphav=sqrt(2/N);
                end
                r=alphau*alphav*cos(((2*x+1)*u*pi/(2*N)))*cos(((2*y+1)*v*pi/(2*N)));
                F(u+1,v+1)=F(u+1,v+1)+f(x+1,y+1)*r;
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
imshow(F),title('DCT Matrix');