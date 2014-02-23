clear all;
close all;
format long;

m = 25; %数据的数量
n = 5;  %4个系数，1个常数

%for poly func
t = 0:24;
C = [15; 14; 14; 14; 14; 15; 16; 18; 20; 20; 23; 25; 28;
    31; 32; 41; 29; 27; 25; 24; 22; 20; 18; 17; 16];
plot(t,C,'Bo')
hold on

G = zeros(m, n+1);
G(:,1) = ones(m,1);
G(:,2) = t;
G(:,3) = t.^2;
G(:,4) = t.^3;
G(:,5) = t.^4;
G(:,6) = C;


x = 0:0.1:24;
y = zeros(length(x),1);

%4-order
[ a, e ] = LSS( G, m, 5 );

sum = 0;
for i = 1:length(x)
    y(i) = EVALPOLY(x(i), a, 4 );
    sum = sum + y(i);
end
plot(x,y,'r')
hold on

fprintf('4-order average: %f\n', sum/length(x));

%3-order
[ a, e ] = LSS( G(:,[1,2,3,4,6]), m, 4 );
sum = 0;
for i = 1:length(x)
    y(i) = EVALPOLY(x(i), a, 3);
    sum = sum + y(i);
end
plot(x,y,'g')
hold on
fprintf('3-order average: %f\n', sum/length(x));

%2-order
[ a, e ] = LSS( G(:,[1,2,3,6]), m, 3 );
sum = 0;
for i = 1:length(x)
    y(i) = EVALPOLY(x(i), a, 2);
    sum = sum + y(i);
end
plot(x,y,'b')
hold on
fprintf('2-order average: %f\n', sum/length(x));

%for exp func
lnC = zeros(25,1);
for i = 1:25
    lnC(i) = log(C(i));
end
%replace the y value
G(:,6) = lnC;
%log of the exp form seems like a 2-order poly form
[ a, e ] = LSS( G(:,[1,2,3,6]), m, 3 );
sum = 0;
for i = 1:length(x)
    y(i) = exp(EVALPOLY(x(i), a, 2));
    sum = sum + y(i);
end
plot(x,y,'k--')
fprintf('2-order-exp average: %f\n', sum/length(x));

legend('Points','4-order-poly','3-order-poly','2-order-poly','2-order-exp')

grid on