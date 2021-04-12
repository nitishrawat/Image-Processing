% 2. Display the 3-d plot of 2-d functions using perspective projections:
% exp(-|ux+vy|) for all x,y and different values of u & v.

[X,Y] = meshgrid(-5:.01:5);
U=1.5;
V=1.5;
Z = exp(-abs(U*X+V*Y));
surf(X,Y,Z,'FaceColor','interp',...
    'EdgeColor','none',...
    'FaceLighting','phong')
axis tight
view(-50,30)
camlight left
rotate3d on