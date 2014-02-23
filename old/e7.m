clear all;
close all;
format long;

%in order to call the standard ROMBERG function, we let the lower bound 
%'a' to be a very small value instead of a real zero.
a = 0;
b = 1;
E = 1e-5;
Nmax = 20;

R = ROMBERG(a, b, E, @e7_F, Nmax)