function pl=leg(n,x)
sum=0;
for m=0:n/2
   d = factorial(m)*factorial(n-m)*(2^n)*factorial(n-2*m);
   sum = sum+((-1)^m)*factorial(2*n-2*m)*(x.^(n-2*m))/d;
end
pl=sum;   

end