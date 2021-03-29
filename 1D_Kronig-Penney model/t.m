clc;
clear all;
close all;

L = 20; %str2duble(a1);
n =  2 ; %strdouble(a2);

k = n*pi/L;
x = 0:0.1:L;

for m=1:n
  for mm=1:length(x) %Loop to find the probability function
  psi(mm) = sqrt(2/L)*sin(m*pi*x(mm)/L);
  psi2(mm) = psi(mm)^2;
  end
  
  figure(1),plot(x,psi,'linewidth',2); hold on;
  ylabel('\psi(x)','fontsize',20);
  set(gca,'ystick,[]')
  xlabel('Position');
  legend('First mode','Second mode','Third mode','Best');

  figure(2),plot(x,psi2,'linewidth',2); hold on;
  ylabel('\psi^2(x)','fontsize',20);
  set(gca,'ystick,[]')
  xlabel('Position');
  legend('First mode','Second mode','Third mode','Best');
  
end
