function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Matthew Ashworth
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
if size(x)~= size(y)
    error('Each X value must have a coresponing Y and each Y must have a corresping X')
end
n=size(x);
n=n(2);
% sort values
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
% quartiles
Q11=floor((n+1)/4);
Q33=floor((3*n+3)/4);
Q1=sortedY(Q11);
Q3=sortedY(Q33);
IQR=Q3-Q1;
Ymin=Q1-(1.5*IQR);
Ymax=Q3+(1.5*IQR);
%Remove outliers
iter=1;
fY=sortedY;
fX=sortedX;
while iter<=n
    if fY(iter)<Ymin||fY(iter)>Ymax
        fY(:,iter)=[];
        fX(:,iter)=[];
        iter=iter-1;
        n=n-1;
    end
    iter=iter+1;
end 
fX=fX
fY=fY
% Linear regression
ybar=mean(fY);
xbar=mean(fX);
SX=sum(fX);
SY=sum(fY);
SXY=sum(fX.*fY);
Sx2=sum(fX.^2);
SxS=SX^2;
slope=(n*SXY-(SX*SY))/(n*Sx2-SxS)
intercept=ybar-(slope*xbar)
%Rsquared
St=sum((fY-ybar).^2);
Sr=sum((fY-intercept-(slope.*fX)).^2);
Rsquared=(St-Sr)/St
end