function [ x ] = JACOBI( A, b, n, Nmax, E, x0 )
%本算法用Jacobi迭代求线性方程组的解
%ref page 74.
%输入：
%   A,b,系数矩阵和右端向量
%   n, 未知量个数
%   Nmax, 允许的最大迭代次数
%   E,精度（一个很小很小很小的正数）
%   x0, 初始化向量
%输出：
%   x, 方程的解向量

for k = 1:Nmax
    for i = 1:n
        %sum
        sum = 0;
        for j = 1:n
            sum = sum + A(i,j)*x0(j);
        end
        sum = sum - A(i,i)*x0(i);
        
        x(i) = (b(i) - sum) / A(i,i);
    end
    e = max(abs(x-x0));
        
    if e<E
        break;
    end
        
    x0 = x;
end
%the fprintf command below is not a standard routin, if u want to use this 
%function for some other uses, make it a comment with %
fprintf('times of JACOBI iteration: %d', k);
end

