close all;
clear all;
format long;

x = -2:0.01:2;
y = zeros(1,length(x));
f = inline('6*x^5 - 45*x^2 + 20', 'x');

for i = 1:length(x)
    y(i) = f(x(i));
end

plot(x, y)
hold on
grid on

[x_low, x_high, x1] = BISECTION(-1, 0, f, 0.0001, 0);
[x_low, x_high, x2] = BISECTION(0, 1, f, 0.0001, 0);
[x_low, x_high, x3] = BISECTION(1.5, 2, f, 0.0001, 0);

x1
x2
x3