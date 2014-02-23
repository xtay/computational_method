function [ x, e ] = LSS( G, m, n )
%本算法用正交化方法求数据的最小二乘近似
%ref P123(书上算法写的有点小错误，1.2.2与1.2.3行应该再缩进一格)
%输入：
%   G: 由近似函数得到的矩阵，以及最后一列y值
%   m: 数据点的数目
%   n: 近似函数的分量数，(对于多项式函数，该值为多项式次数+1)
%输出：
%   x: 多项式系数，第一个分量为常系数，第二个分量为一次项系数，类推

omega = zeros(m,1);

for k = 1:n
    %form the Matrix Q_k
    sigma = -sign(G(k,k)) * norm(G(k:m, k));
    omega(k) = G(k,k) - sigma;
    for j = k+1:m
        omega(j) = G(j,k);
    end
    beta = sigma * omega(k);
    
    %from G_k-1 to G_k
    G(k,k) = sigma;
    for j = k+1:n+1
        sum = SUM( omega(k:m).*G(k:m,j) );
        t = sum/beta;
    
        for i = k:m
            G(i,j) = G(i,j) + t*omega(i);
        end
    end
end

%solving equation Rx=h_1
x(n) = G(n,n+1)/G(n,n);
for i = n-1:-1:1
    sum = SUM( G(i,i+1:n).*x(i+1:n) );
    x(i) = (G(i,n+1) - sum)/G(i,i);
end

e = SUM( G(n+1:m,n+1).*G(n+1:m,n+1) );

end

