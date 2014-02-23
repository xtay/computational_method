function [ x ] = TSS( a, b, c, d, n )
%解三对角线性方程组
%ref page 49.
%输入：
%   a,b,c,三个系数向量
%   d,等号右端向量
%   n,矩阵或者向量的大小
%输出：
%   x,显然。。。这是方程组的解向量

u(1) = b(1);
y(1) = d(1);
for k = 2:n
    l(k) = a(k) / u(k-1);
    u(k) = b(k) - l(k)*c(k-1);
    y(k) = d(k) - l(k)*y(k-1);
end
x(n) = y(n)/u(n);
for k = n-1:-1:1
    x(k) = (y(k) - c(k)*x(k+1))/u(k);
end

end

