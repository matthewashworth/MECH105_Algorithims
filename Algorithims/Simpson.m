function [I] = Simpson(x,y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
sInd=size(x);
sDep=size(y);
sInd=sInd(2);
sDep=sDep(2);
if sInd~=sDep
    error('Array x and array y must be the same length')
end
c=x(2)-x(1);
C=[x(1):c:x(sInd)];
if x~=C
    error('Array x must contain evenly spaced Numbers')
end
iter=1;
I=0;
while sInd-iter>=2
    Ir=(x(1,iter+2)-x(1,iter)).*(y(1,iter)+4.*y(1,iter+1)+y(1,iter+2))./6;
    if iter==1
        I=Ir;
    else
        I=I+Ir;
    end
    iter=iter+2;
end
if sInd-iter~=0
    Ir=(x(1,sInd)-x(1,sInd-1)).*(y(1,sInd)+y(1,sInd-1))/2;
    I=I+Ir;
    warning('Trapizodal rule was used for remaining intervals')
end
end