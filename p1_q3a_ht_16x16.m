% 3. On sample artificial, 16X16 image, take the HT.
% Print the image & transform matrix side by side 

clc
f = zeros(16);
f(5:7,4:7)=250;
f(2:3,2:3)=120;
f(8:12,11:14)=150;
F=haar2(f);
screen_size = get(0, 'ScreenSize');
fig=figure(1);
set(fig, 'Position', [0 0 screen_size(3) screen_size(4) ] );
subplot(1,2,1),imshow(f),title('16 X 16 Matrix');
subplot(1,2,2),imshow(F),title('HT Transformed Matrix');
