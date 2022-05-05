function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem
% statement where the first number of first row is the collum number and
% the first collum is the row number
% Inputs n is the number of rows, and m the number of columns
if nargin~=2
    error('Function must have two inputs')
end
A=zeros(n,m);
i=1:n;
j=1:m;
A(:,1)=i;
A(1,:)=j;
c=2;
for r=2:n 
    while c<=m
        A(r,c)= A(r-1,c)+A(r,c-1);
        c=c+1;
    end
    c=2;
end
end