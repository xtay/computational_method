clear all;
close all;
format long;

f = inline('sqrt(1 + (cos(x))^2)','x');

Tres = TR(f, 0, 10, 0.0001)

Sres = SR(f, 0, 10, 0.0001)