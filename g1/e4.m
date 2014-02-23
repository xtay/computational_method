clear all;
close all;
format long;

%generate the points from original data
y = [75.995; 91.972; 105.711;
    123.203; 131.699; 150.697;
    179.323; 203.212; 226.505;
    251.525; 291.854; 325.433;];
x = 1900:10:2010;
n = 11;     %number of intervals
plot(x,y,'Bo')
hold on

%compute the coef things
yd = DD(x, y, n);
M = SPLINEM(x, y, n);

%calculate the interpolated curve
xx = 1900:1:2015; %years to be interpolated
%preallocation
yN = zeros(length(xx),1);
yS = zeros(length(xx),1);
%calculation
for i = 1:length(xx)
    yN(i) = NI(x, y, n, xx(i), yd);%by Newton interpolation
    yS(i) = EVASPLINE(x, y, n, xx(i), M);%by Spline Interpolation
end

plot(xx,yN,'r--')
hold on

plot(xx,yS,'b-.')
legend('Points','Newton','Spline')
grid on;

fprintf('Newton in 2005: %f\n',NI(x, y, n, 2005, yd)); 
fprintf('Newton in 2015: %f\n',NI(x, y, n, 2015, yd)); 

fprintf('SPLINM in 2005: %f\n', EVASPLINE(x, y, n, 2005, M));
fprintf('SPLINM in 2015: %f\n', EVASPLINE(x, y, n, 2015, M));
