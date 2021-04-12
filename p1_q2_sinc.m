% 2. Display the 3-d plot of 2-d functions using perspective projections:
% sinc(x,y) for all x,y.

[X,Y] = meshgrid(-5:.1:5);
[r,c]=size(X);
for i=1:r
    for j=1:c
        if X(i,j) == 0
            sincx =1;
        else
            sincx = sin(pi*X(i,j))/(pi*X(i,j));
        end
        if Y(i,j) == 0
            sincy=1;
        else
            sincy = sin(pi*Y(i,j))/(pi*Y(i,j));
        end
        %Z(i,j)=sinc(X(i,j))*sinc(Y(i,j));
        Z(i,j)=sincx*sincy;
    end
end
surf(X,Y,Z,'FaceColor','interp',...
    'EdgeColor','none',...
    'FaceLighting','phong')
%daspect([5 5 1])
axis tight
view(-50,30)
camlight left
rotate3d on
%mesh(X,Y,Z)