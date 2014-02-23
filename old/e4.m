clear all;
close all;
format long;

A = [0.78, -0.02, -0.12, -0.14;
    -0.02, 0.86, -0.04, 0.06;
    -0.12, -0.04, -0.72, -0.08;
    -0.14, 0.06, -0.08, 0.74];
b = [0.76, 0.08, 1.12, 0.68];

n = 4;
Nmax = 20;
E = 1e-3;
x0 = [0,0,0,0];

xJ = JACOBI(A, b, n, Nmax, E, x0)
xG = GS(A, b, n, Nmax, E, x0)