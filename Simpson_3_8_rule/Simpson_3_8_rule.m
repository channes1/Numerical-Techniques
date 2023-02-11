%Simpson's 3/8 rule
format short
f = @(x) exp(x)./(1+x); %Function
a=input('Enter lower limit for a: ');
b=input('Enter lower limit for b: ');
n = input('Enter the no. of subinterval: ');

h=(b-a)/n;
if rem(n,3)==0
   fprintf('\n This is not a valid value of n');
else
   fprintf('\n Enter a valid value of n');
   n=input('\n The value of n should be a multiple of 3');
k = 1:1:n-1;
S = f(a+k.*h);
I = 3:3:n-1;
S3= sum(S(3:3:n-1));
S(I) = []; %Delete the values at I position
So = sum(S); % Compute sum

%Simpson's 1/3 formula
 o = (3*h/8).*(f(a)+f(b)+3.*So+2.*S3);
 fprintf('The value of integration is %f \n', o);
end

% Enter lower limit for a: 1
% Enter lower limit for b: 2
% Enter the no. of subinterval: 23

% Enter a valid value of n
% The value of n should be a multiple of 312
% The value of integration is 0.829504
