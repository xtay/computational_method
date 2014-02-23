function [ M ] = SPLINEM( x, y, n )
%本算法计算三次样条的参数向量M
%ref page 110. 这里的实现使用了第三类边界条件ref page 109 (3-53)式，故相比于
%提供的标准算法省略了若干边界条件的参数，而通过公式在本函数中将边界条件计算出来
%输入：
%   x,y, 输入的若干点
%   n, 分段的数目
%输出：
%   M, 用于样条插值计算的一个向量

diff = y;
for k = 1:2
    for i = n+1:-1:k+1
        diff(i) = (diff(i) - diff(i-1)) / (x(i) - x(i-k));
    end
end

h(2) = x(2) - x(1);
for i = 2:n
    h(i+1) = x(i+1) - x(i);
    c(i) = h(i+1) / (h(i)+h(i+1));
    a(i) = 1 - c(i);
    b(i) = 2;
    M(i) = 6*diff(i+1);
end

%below are boundry conditions
M(1) = -12*h(2)*(diff(4) - diff(3))/(x(4) - x(1));
M(n+1) = 12*h(n+1)*(diff(n+1) - diff(n))/(x(n+1) - x(n-2));

a(1) = 0;
a(n+1) = -2;
b(1) = 2;
b(n+1) = 2;
c(1) = -2;
c(n+1) = 0;

%call the TSS function to solve out M
M = TSS(a,b,c,M,n+1);

end

