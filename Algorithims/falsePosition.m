function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
if func(xl)*func(xu)>=0
    if func(xl)==0
        error('xi is a root')
    elseif func(xu)==0
        error('xu is a root')
    else 
        error('f(xi) and f(xu) must have oppsite signs')
    end 
end 
if nargin<5
    if nargin<3
        error('Function requires three imputs (function, lower bound(xl) and upper bound(xu))')
    elseif nargin==3
        es=0.0001;
        maxit=200;
    elseif nargin==4
        maxit=200;
    end
else 
    error('Too many imputs')
end
ea=100;
iter=0;
while (1)
    if maxit==iter
        break
    end
    if ea<=es
        break
    end
    xrnew=xu-((func(xu).*(xl-xu))./(func(xl)-func(xu)));
    if func(xrnew)==0
        ea=0;
        iter=iter+1;
        xrold=xrnew;
        break
    end
    if func(xrnew)>0
        if func(xu)>0
            xu=xrnew;
        else
            xl=xrnew;
        end
    else
        if func(xu)<0
            xu=xrnew;
        else
            xl=xrnew;
        end
    end
    if iter>1
        ea=abs((xrnew-xrold)/xrnew)*100;
    end
    iter=iter+1;
    xrold=xrnew;
end
root=xrold;
fx=func(root);
disp(func)
fprintf('The Root is %8.10f \n',xrold)
fprintf('The estimated error is %8.10f percent \n',ea)
fprintf('The number of iterations is %3.0f',iter)
end