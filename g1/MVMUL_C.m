function [ b ] = MVMUL_C( A, h, x )
%求压缩矩阵与某一向量的积，用于检验方程组求解的结果
%输入：
%   A, 矩阵压缩存储的地方 
%   h, 文件头
%   x, 待乖向量
%输出：
%   b, 结果向量

n = h.n;
p = h.p;
q = h.q;

b = zeros(n,1);

for i = 1:n
    sum = 0;
    for j = i-p:i+q
        if j >= 1 && j <= n
            [ ci, cj, state ] = INDEX_G2C( h, i, j );
            sum = sum + A(ci, cj)*x(j);
        end
    end
    b(i) = sum;
end

end

