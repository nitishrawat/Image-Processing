% 2. Display the 3-d plot of 2-d functions using perspective projections:
% sin(ux+vy) for all x,y and different values of u & v.

[X,Y] = meshgrid(-5:.1:5);
U = 2;
V = 5;
Z = sin(U*X+V*Y);
surf(X,Y,Z,'FaceColor','interp',...
    'EdgeColor','none',...
    'FaceLighting','phong')
daspect([5 5 1])
axis tight
view(-50,30)
camlight left
%mesh(X,Y,Z)