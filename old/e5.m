clear all;
close all;
format long;

f = inline(vectorize('1/(1+25*x^2)'), 'x');

n = 5;

%generate the points from a real function
step = 2/n;
x = -1:step:1;
y = f(x);
plot(x,y,'Bo')
hold on

yd = DD(x, y, n)
M = SPLINEM(x, y, n)

xx = -1:0.01:1;
yR = f(xx);%the real value
for i = 1:201
    yN(i) = NI(x, y, n, xx(i), yd);%by Newton interpolation
    yS(i) = EVASPLINE(x, y, n, xx(i), M);%by Spline Interpolation
end

plot(xx,yR,'r')
hold on

plot(xx,yN,'g--')
hold on

plot(xx,yS,'b:')
legend('Points','Real','Newton','Spline')