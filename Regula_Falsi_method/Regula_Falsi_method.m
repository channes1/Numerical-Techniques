%Regula-Falsi method
clc
clear all;

format short
f=@(x) x*log10(x)-1.2;

a = 2; %First initial guess
b = 3; %Second initial guess
n = 6; %No. of decimal places

epsi= 5*10^(-n-1); %Max olerance error uptp 'n' decimal accuracy
iterate_max = 80; %Maxno. of iterations to be performed 

x0 = (a*f(b)-b*f(a))/(f(b)-f(a)); %Compute new root

error = abs(f(x0)); %Find initial error

iterate = 1;

if f(a)*f(b)>0
    disp('Wrong choice of first and second guess');
else
    while (iterate<=iterate_max && error>=epsi)
       if f(a)*f(x0)<0 %To check intermediate mean value property
        b=x0; % Update the value of b
    else
        a=x0; %Update the value of a
       end
    x0 = (a*f(b)-b*f(a))/(f(b)-f(a)); %Compute new root
    error = abs(f(x0));   
    iterate = iterate+1; %Update the iteration counter
    end
end

x0=x0-rem(x0,10^-n); % rem is remainder; Converts to n decimal places

fprintf('The converged solution after %d iterations\n', iterate);
fprintf('Root is %f \n',x0); %Final root

%The converged solution after 4 iterations
%Root is 2.740645 