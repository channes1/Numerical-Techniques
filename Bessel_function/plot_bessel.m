clear all
clc
x=(0:0.1:15);
for n=0:5
hold on
plot(x,jj_bessel(n,x))
grid ON 
title('Plot of Jn(x) when limit, m=25');
xlabel('x');
ylabel('Jn(x)');

legend('j0(x)','j1(x)','j2(x)','j3(x)','j4(x)','j5(x)');
hold off 
end
