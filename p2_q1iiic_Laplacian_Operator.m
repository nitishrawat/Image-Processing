% Filtering Operations on images
% Laplacian Operator

img=imread('download.jpg');
C=double(img);
B=img;
for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %laplacian mask 
        Gx=(C(i,j)+C(i,j+1)+C(i,j+2)+C(i+1,j)+C(i+1,j+2)+C(i+2,j)+C(i+2,j+1)+C(i+2,j+2))-(8*C(i+1,j+1));
        
        B(i,j)=Gx;
       
    end
end
screen_size = get(0, 'ScreenSize');
f1=figure(1);
subplot(1,2,1)
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );
imshow(img),title('256 X 256 Image');
subplot(1,2,2)
imshow(B,[0 255]),title('Laplacian Operator');
