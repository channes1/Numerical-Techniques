format short
f= @(x) cos(x)-log(x)+exp(x);
a=input('Enter lower limit for a: ');
b=input('Enter lower limit for b: ');
n = input('Enter the no. of subinterval: ');

h=(b-a)/n;
if rem(n,2)==1
    fprintf('\n Enter a valid value of n: ');
    n= input('\n Enter an even number for n: ');
    k = 1:1:n-1;
    S = f(a+k.*h);
    Se = sum(S(2:2:n-1)); %Sum of even terms
    So = sum(S(1:2:n-1)); %Sum of odd terms
    
    %Simpson's 1/3 formula
    o = (h/3).*(f(a)+f(b)+2.*So+4.*Se);
    fprintf('The value of integration is %f \n',o);
end


% Enter lower limit for a: 1
% Enter lower limit for b: 2
% Enter the no. of subinterval: 15

% Enter a valid value of n
% Enter an even number for n16
%The value of integration is 4.558346 