clear all;
close all;
format long;

%积分方程的真解
r = inline('1/(x+1)^2','x');

%积分方程的一些参数（第二类Fredholm线性积分方程）
K = inline('1/(1+t) - x','x','t');
F = inline('(4*x^3+5*x^2-2*x+5)/(8*(x+1)^2)','x');
a = 0;
b = 1;
n = 4;

[ x, y ] = SIMPSONSOLVE(K, F, a, b, n)
plot(x,y,'o')
hold on

M = SPLINEM(x, y, 2*n);

xx = a:0.01:b;

for i = 1:101
    yR(i) = r(xx(i));
    yS(i) = EVASPLINE(x, y, 2*n, xx(i), M);
end

plot(xx, yR, 'r')
hold on
plot(xx, yS, 'b:')
legend('Points','Real', 'SimpsonSpline')