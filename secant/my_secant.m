clc
clear all
f=@(x) x*log10(x)-1.2;

a=2;
b=3;
%a and b are first and second guess values.
n=4; %To find the root of the equation upto n decimal places

values = {'iterate', 'a', 'b', 'x0', 'f_x0', 'error'};

iterate = 1; %Iteration counter
x0 = (a*f(b)-b*f(a))/(f(b)-f(a)); % To compute new root
error= abs(f(x0)); %Error is not negative
epsi = 5*10^(-n-1); %Max tolerance error upto n decimal accuracy
iterate_max = 70;

if f(a)*f(b)>0
    disp('Wrong values for a and b. Enter new values!');
else
    while(iterate<=iterate_max && error>epsi)
    a=b; %Update the value of a
    b=x0; %Update the value of b
    x0 = (a*f(b)-b*f(a))/(f(b)-f(a)); %Compute new root
    error= abs(f(x0)); %Compute error
    iterate = iterate +1;
    end
end
    
x0=x0-rem(x0,10^-n); %Convert to n decimal places; rem = remainder

fprintf('Converged solution after %d iterations \n', iterate);
fprintf('Root is %f \n', x0);

%Converged solution after 3 iterations 
%Root is 2.740600 
