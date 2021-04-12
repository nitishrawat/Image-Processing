img = imread('download.jpg');
img2=zeros(256);
for i=1:256
    for j=1:256
        if (img(i,j) < 128)
            img2(i,j)=0;
        else
            img2(i,j)=255;
        end
    end
end
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );
subplot(1,2,1)
imshow(img),title('256 X 256 Image');
subplot(1,2,2)
imshow(img2),title('Image Thresholding');
