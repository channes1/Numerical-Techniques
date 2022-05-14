clf
clear all
clc

x=(-1:0.01:1);
for n=0:5
  grid on
  axis([-1 1 -1 1.3]);
  hold on
  plot(x, leg(n,x));
  legend('p0(x)', 'p1(x)', 'p2(x)', 'p3(x)', 'p4(x)', 'p5(x)');
hold off
end