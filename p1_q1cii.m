% c) Display the whole image
%   ii) Multiply the first, second and fourth quarter each with
%       different constants having value in the range
%       0.5 to 2.0 (Take care of the overflow).

img = imread('CoreopsisSunrayFlower.jpg');
r = 0.5 + (1.5).*rand(1,1);
for i=1:128
    for j=1:128
        for k=1:3
            
            img(i,j,k)=img(i,j,k)*r;
        end
    end
end
r = 0.5 + (1.5).*rand(1,1);
for i=1:128
    for j=129:256
        for k=1:3
            img(i,j,k)=img(i,j,k)*r;
        end
    end
end
r = 0.5 + (1.5).*rand(1,1);
for i=129:256
    for j=129:256
        for k=1:3
            img(i,j,k)=img(i,j,k)*r;
        end
    end
end
imshow(img)
