% reference : http://www.cs.ucf.edu/~mali/haar/

%/** A Modified version of 1D Haar Transform, used by the 2D Haar Transform function **/
%void haar1(float *vec, int n, int w)
%function [output_parameter_list] = function_name(input_parameter_list)
function vec = haar1(vec,n,w)
i=0;
for i=1:n
    vecp(i) = 0;
end

w=w/2;
for i=0:w-1
    vecp(i+1) = (vec(2*i+1) + vec(2*i+1+1))/sqrt(2.0);
    vecp(i+1+w) = (vec(2*i+1) - vec(2*i+1+1))/sqrt(2.0);
end
    
for i=1:(w*2)
    vec(i) = vecp(i);
end
        

