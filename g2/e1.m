clear all;
close all;
format long;

f = inline('exp(x^2-y^2)', 'x', 'y');

y = RK4R(f, 0, 1, 1, 0.0001)