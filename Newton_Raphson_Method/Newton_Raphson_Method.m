%Newton-Raphson_method

syms x  %symbolic x

f= @(x) x*log10(x)-1.2;
df = diff(f,x); %To find the derivative
dfx = inline(df);
x0 = 1.5; %Initial guess
n=6; %Correct upto 6 decimal places

iterate = 1; % Initial counter
error = abs(f(x0)); %positive value of error

epsi = 5*10^(-n-1); %Max tolerance error upto 'n' decimal accuracy

iterate_max = 80;

if dfx(x0)<10^(-10) % The derivative should be a non-zero value
    disp('Wrong choice for initial guess. Take a new number!');
else
    while (iterate<=iterate_max && error>epsi)
           x1 = x0-f(x0)/dfx(x0); %find new root
           error = abs(f(x0)); %Find initial error
           iterate = iterate + 1; %updates the iteration counter
           x0 = x1; %update initial guess
    end
end

x0 = x0-rem(x0,10^-n); %rem is to find the remainder 
                       %this step converts to n decimal places
                       
%Print Output
fprintf('Converged solution after %d iterations \n',iterate);
fprintf('Root is %f \n',x0);

%Converged solution after 1 iterations is 
%Root is 1.500000 
