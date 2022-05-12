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
    y(i+1) = y(i) + h*eul(x(i),y(i));
end

z = [x,y];

disp(z);
hold on;

yexact = x.*log(x)+2*x;
xlabel('x');
ylabel('y');
title('Eulers plot for step size = 0.02')
plot(x,y,'r',x,yexact,'b--o')
legend('Estimated value','Exact value');

error = yexact-y;
hold off;
z1=[x y yexact error];

disp(z1);