close all;
clear all;
format long;

A = [ 1e-8, 2, 3; -1, 3.712, 4.623; -2, 1.072, 5.643 ];
b = [ 1, 2, 3];
[x]= GAUSSPP(A, 3, b)