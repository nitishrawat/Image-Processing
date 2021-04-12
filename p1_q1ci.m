% c) Display the whole image
%  i) Add a constant to the third quarter of the image
%     (Take care of the overflow).

img = imread('CoreopsisSunrayFlower.jpg');
for i=129:256
    for j=1:128
        for k=1:3
            img(i,j,k)=img(i,j,k)+50*k;
        end
    end
end
imshow(img)
