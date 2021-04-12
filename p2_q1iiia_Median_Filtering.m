% Filtering Operations on images
% Median Filtering

img = imread('download.jpg');
[Width,Height]=size(img);
img2 = zeros(Width,Height);
for xcoord=1:1:Width
	leftbound=xcoord-2;
	rightbound=xcoord+2;
	if leftbound<1
		leftbound=1;
	end
	if rightbound>Width
		rightbound=Width;
	end
	for ycoord=1:1:Height
		topbound=ycoord-2;
		bottombound=ycoord+2;
		if topbound<1
			topbound=1;
		end
		if bottombound>Height
			bottombound=Height;
		end
		arrsize = (bottombound-topbound+1)*(rightbound-leftbound+1);
		arr = zeros(arrsize,1);
		xindex=leftbound;
		yindex=topbound;
		index=1;
		while index<=arrsize
			arr(index)=img(xindex,yindex);
			xindex=xindex+1;
			if xindex >rightbound
				xindex=leftbound;
				yindex=yindex+1;
			end
			if yindex>bottombound
				break
            end
            index = index +1;
		end
		sortedarr = sort(arr);
		img2(xcoord,ycoord,1)=sortedarr(ceil((arrsize)/2));
	end
end
screen_size = get(0, 'ScreenSize');
f1=figure(1);
subplot(1,2,1)
set(f1, 'Position', [0 0 screen_size(3) screen_size(4)] );
imshow(img),title('256 X 256 Image');
subplot(1,2,2)
imshow(img2,[0 255]),title('Median Filtering');
