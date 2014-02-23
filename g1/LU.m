function [ L,U ] = LU( A,n )
%矩阵的LU分解
%ref P38
%输入：
%   A: 待分解的非奇异矩阵
%   n: 矩阵的维数
%输出：
%   L,U: 分解的结果
%依赖：
%   [ S ] = SUM( A, n )

%preallocation
L = zeros(n,n);
U = zeros(n,n);

%do it
for j = 1:n
    L(j,j) = 1;
    U(1,j) = A(1,j);
end

for k = 2:n
    L(k,1) = A(k,1)/U(1,1);
end

for i = 2:n
    
    for j = i:n
        sum = SUM( L(i,1:i-1).*(U(1:i-1,j))' );
        U(i,j) = A(i,j) - sum;
    end
    
    for k = (i+1):n
        sum = SUM( L(k,1:i-1).*(U(1:i-1,i))' );
        L(k,i) = (A(k,i) - sum)/U(i,i);
    end
    
end


end

