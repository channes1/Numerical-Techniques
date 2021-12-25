clear all; clc;
%https://in.mathworks.com/matlabcentral/answers/23155-summation-with-looping
p = 0.9;
N = 100;
a = 0;
b = 1; 
x = a + (b-a).*rand(N,1);

f = zeros(N,1);                 %preallocation of the storage

for n = 1:N
    for i = 1:N
    f(n) = 1/(x(i)-x(i)^2)^p;
    end
end
S = sum(f)*1/N;

% When p = 0.1
%For N = 10000, S = 1.3967
%For N = 1000, S = 1.1614
%For N = 100, S = 1.1557

% When p = 0.9
%For N = 10000, S = 3.6906
%For N = 1000, S = 3.8421
%For N = 100, S = 6.289

