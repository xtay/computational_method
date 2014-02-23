function [ G ] = CHOLESKY( A, n )
%对给定带宽为p的对称正定矩阵A计算其Cholesky矩阵G，其元存放于A的相的位置
%ref page 44.
%输入：
%   A,对称正定矩阵
%   n,矩阵大小
%输出：
%   G,cholesky矩阵（仅下三角）

%preserve the matrix A!
G = A;
%do what we should do now...
G(1,1) = G(1,1)^0.5;
for i = 2:n
    for j = 1:i-1
        %sum
        sum = 0;
        for p = 1:j-1
            sum = sum + G(i,p)*G(j,p);
        end
        G(i,j) = (G(i,j) - sum) / G(j,j);
    end
    %sum
    sum = 0;
    for p = 1:i-1
        sum = sum + G(i,p)^2;
    end
    G(i,i) = (G(i,i) - sum)^0.5;
end

end

