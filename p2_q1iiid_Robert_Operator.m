% Filtering Operations on images
% Robert Operator

img=imread('download.jpg');
C=double(img);
B=img;
for i=1:size(C,1)-1
    for j=1:size(C,2)-1
        %Robert mask for x-direction:
        Gx=C(i+1,j+1)-C(i,j);
        %Robert mask for y-direction:
        Gy=C(i+1,j)-C(i,j+1);
       
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j)=sqrt(Gx.^2+Gy.^2);
       
    end
end

screen_size = get(0, 'ScreenSize');
f1=figure(1);
subplot(1,2,1)
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );
imshow(img),title('256 X 256 Image');
subplot(1,2,2)
imshow(B,[0 255]),title('Robert Operator');
