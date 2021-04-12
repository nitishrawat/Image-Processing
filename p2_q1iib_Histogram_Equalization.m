% Image Contrast Enhancement Histogram Equalization

clc
img = imread('download.jpg');
freq=double(zeros(256,1));
probf=zeros(256,1);
for i=1:256
    for j=1:256
        val=img(i,j);
        freq(val+1)=freq(val+1)+1;
        probf(val+1)=freq(val+1)/(256*256);
    end
end
%figure(),bar(freq),title('freq');

sum=0;
no_bin=255;
cum=zeros(256,1);
probc=zeros(256,1);
output=zeros(256,1);

for i=1:256
    sum=sum+freq(i);
    cum(i)=sum;
    probc(i)=cum(i)/(256*256);
    output(i)=round(probc(i)*no_bin);
end
%figure(),bar(cum),title('cum');
%figure(),bar(probc),title('probc');
%figure(),bar(output),title('output');
HEq=zeros(256);

for i=1:256
    for j=1:256
        HEq(i,j)=output(img(i,j)+1);
    end
end

screen_size = get(0, 'ScreenSize');
f1=figure();
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );
%subplot(1,2,1)
%imshow(img),title('256 X 256 Image');
%subplot(1,2,2)
%imshow(HEq),title('Histogram Equalization');

hist_value = zeros(1,256);
for i=1:256
    for j=1:256
        hist_value(img(i,j)+1) = hist_value(img(i,j)+1) + 1;
    end
end
subplot(1,2,1),bar(hist_value),title('Image Histogram');


hist_value = zeros(1,256);
for i=1:256
    for j=1:256
        hist_value(HEq(i,j)+1) = hist_value(HEq(i,j)+1) + 1;
    end
end
subplot(1,2,2),bar(hist_value),title('Histogram Equalization');

