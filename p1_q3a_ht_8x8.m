% 3. On sample artificial, 8X8 image, take the HT.
% Print the image & transform matrix side by side 

clc
f = zeros(8);
f(5:7,4:7)=250;
f(2:3,2:3)=120;
F=haar2(f);screen_size = get(0, 'ScreenSize');
f1=figure(1);
set(f1, 'Position', [0 0 screen_size(3) screen_size(4) ] );
subplot(1,2,1)
imshow(f),title('8 X 8 Matrix');
subplot(1,2,2)
imshow(F),title('HT Matrix');