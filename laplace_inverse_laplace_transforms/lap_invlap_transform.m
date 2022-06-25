%laplace transform

%where laplace(f, r, o)

%f = function of r
%Output is a function of o

%Ex. 1:
syms t; syms s; 
laplace(t^3, t, s)

% o/p = 6/s^4

%Ex. 2:
syms t; syms b; syms s;
laplace(exp(-b*t),t,s) 

%o/p = 1/(b+s)
 
%Inverse laplace transform
%ilaplace(y,t)
%where y is a function of s
%Result is a function of t

%Ex. 1
syms s;
syms t;

ilaplace(6/s^4, s,t) 
%o/p: t^3

%Ex. 2

syms t; syms b; syms s;
ilaplace(1/(b+t),t,s) 

%o/p: exp(-b*t)