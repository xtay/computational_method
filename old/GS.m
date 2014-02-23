function [ x ] = GS( A, b, n, Nmax, E, x0 )
%本算法用Gauss-Seidel迭代解线性方程组
%ref page 75.
%输入：
%   A,b, 系数矩阵与右端向量
%   n, 未知量个数
%   Nmax, 允许的最大迭代次数
%   E, 精度
%   x0, 迭代的初始向量
%输出：
%   x, 线性方程组Ax=b的解向量

x = x0;
for k = 1:Nmax
    for i = 1:n
        %sum
        sum = 0;
        for j = 1:n
            sum = sum + A(i,j)*x(j);
        end
        sum = sum - A(i,i)*x(i);
        
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
fprintf('times of GS iteration: %d', k);

end

