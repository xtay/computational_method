clear all;
close all;
format long;



for k = 1:100000
    A(k) = 1/(k^2);
end

S = SUM(A)