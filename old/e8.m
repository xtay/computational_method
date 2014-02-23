clear all;
close all;
format long;

%f为等号左边的待解式
%能够证明，f为关于x的单调递减函数，这是下面使用区间法的基础！
f = inline('e8_INTF(x)/pi', 'x');

a = 2;
b = 3;
E = 1e-5;
h = 0.1;

[ a, b, x, status ] = BISECTION(a, b, f, E, h);

if status ~= 0
    exit;
end

Nmax = 20;

x = SECANT1(a, b, f, E, Nmax)