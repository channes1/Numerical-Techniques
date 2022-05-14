%Bisection method
clc
clear all
format short
f = @(x) x*log10(x)-1.2;
a = 2; %first guess
b = 3; %second guess

n = 6; %number of decimal places
epsi= 5*10^(-n-1); %Max olerance error uptp 'n' decimal accuracy
iterate_max = 80; %Maxno. of iterations to be performed 

x0 = (a+b)/2; %Compute new point by mid point
error = abs(f(x0));
iterate = 1;
%To print the output in the form of a table
values = {'Iter', 'a', 'b', 'x0', 'f_x0', 'Error'};
H = [iterate a b x0 f(x0) error];


if f(a)*f(b)>0
    disp('Wrong choice of first and second guess');
else
    while (iterate<=iterate_max && error>=epsi)
    if f(a)*f(x0)<0 %Check intermediate mean value property
        b=x0; % Update the value of b
    else
        a=x0; %Update the value of a
    end
    x0=(a+b)/2; %Compute new root using mid point
    error = abs(f(x0));
    H=[H;iterate a b x0 f(x0) error];
    iterate = iterate+1; %Update the iteration counter
    end
end

disp('Output table');
Res = array2table(H);
Res.Properties.VariableNames(1:size(H,2)) = values;

x0=x0-rem(x0,10^-n); % rem is remainder; Converts to n decimal places

fprintf('The converged solution after %d iterations\n', iterate);
fprintf('Root is %f \n',x0);

% The converged solution after 16 iterations
% Root is 2.740646

