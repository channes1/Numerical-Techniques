% Function to write Bessel function of first kind 
% J_n(x) = \sum^{\infty}_{m=0} \frac{(-1)^m}{m! \ (n+m)!} \left( \frac{x}{2}\right)^{n+2m}


function jn = jj_bessel(n,x)
 sum = 0.0;
for m = 0:25
  d = factorial(m)*factorial(m+n);
  sum = sum+((-1)^m)*((x/2).^(2*m+n))/d;
end
jn=sum;
 
end
