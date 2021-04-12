function matrix = haar2(matrix)
%/** The 2D Haar Transform **/
%void haar2(float **matrix, int rows, int cols)
i=0;j=0;
[rows,cols]=size(matrix);
w = cols; h=rows;
while w>1 | h>1
    if w>1
        for i=1:h
            for j=1:cols
                temp_row(j) = matrix(i,j);
            end
            temp_row=haar1(temp_row,cols,w);
            for j=1:cols
                matrix(i,j) = temp_row(j);
            end
        end
    end
    if h>1
        for i=1:w
            for j=1:rows
                temp_col(j) = matrix(j,i);
            end
            temp_col=haar1(temp_col, rows, h);
            for j=1:rows
                matrix(j,i) = temp_col(j);
            end
        end
    end
    if w>1
        w=w/2;
    end
    if h>1
        h=h/2;
    end        
end
    