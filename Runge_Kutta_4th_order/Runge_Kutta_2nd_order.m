clc
clear all
clf

x0=1; 
y0=2;
xf=2.8;
h=0.02; %step size

x(1) = x0; %store value of x0 in first element of array x
y(1) = y0; %store value of x0 in first element of array y


n = (xf-x0)/h; 

%To perform calculations for n number of iterations
for i = 1:n
    x(i+1) = x(i) + h;
    k1=h*rk(x(i),y(i));
    k2=h*rk(x(i)+h,y(i)+k1);
    k3=h*rk(x(i)+h/2,y(i)+k2*0.5);
    k4=h*rk(x(i)+h,y(i)+k3);
   y(i+1) = y(i) + (k1+k2)/2;
%    y(i+1) = y(i) + (k1+2*k2+2*k3+k4)/6;
end

z = [x,y];

disp(z);
hold on;

yexact = x.*log(x)+2*x;
xlabel('x');
ylabel('y');
title('Runge Kutta 2nd order plot for step size = 0.02')
plot(x,y,'r',x,yexact,'b--o')
legend('Estimated value','Exact value');

error = yexact-y;
hold off;
z1=[x y yexact error];

disp(z1);