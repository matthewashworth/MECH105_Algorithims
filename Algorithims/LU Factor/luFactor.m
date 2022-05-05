function [L,U,P] = luFactor(A)
%Function will preform Gauss emlimination with piviting based on series A
%   Imput(A): Where a is and m x n matrix 
%             m must equal n (ie 3x3, 4x4 matrixs)
%   Output 1(L): Matrix containing coefficients used during elemination
%   Output 2(U): Upper Triangular Matrix resulting from decomposition of A
%   Output 3(P): Final Piviot Matrix
B=size(A);
m=B(1);
n=B(2);
if m~=n
    error('Matrix A has wrong dimensions. Must bet an m x n matrix where m and n are equal')
end
P=eye(m);
L=zeros(m);
U=A;
i=1;
j=1;
inc=1;
iter=0;
while j<m
    J=U(i:m,j);
    k=abs(J');
    Max=max(k);
    K=find(k==Max);
    MaxJ=J(K);
    if U(i,j)~=MaxJ
        b=U(i,:);
        U(i,:)=U(K+iter,:);
        U(K+iter,:)=b;
        p=P(i,:);
        P(i,:)=P(K+iter,:);
        P(K+iter,:)=p;
        l=L(i,:);
        L(i,:)=L(K+iter,:);
        L(K+iter,:)=l;
    end
    while inc+i<m+1
        c=U(i+inc,j)/U(i,j);
        Gauss=c*U(i,:);
        U(i+inc,:)=U(i+inc,:)-Gauss;
        L(i+inc,j)=c;
        inc=inc+1;
    end
    inc=1;
    j=j+1;
    i=j;
    iter=iter+1;
end
L=L+eye(m);
LU=L*U
PA=P*A
end