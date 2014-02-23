function [ K, P ] = OMATRIX( gd )
%将分散的各单元传热矩阵组装成总传热矩阵
%输入：
%   gd, global descripter, 一组描述各个单元的向量，每个元素包含的内容有某单元的传热矩阵，温度载荷及顶点信息
%输出：
%   K, 总传热矩阵
%   P, 总温度载荷

%以下初始化的矩阵维数仅针对本题。
K = zeros(9);
P = zeros(9,1);

for k = 1:length(gd)
    Ke = gd(k).Ke;
    Pe = gd(k).Pe;
    Te = gd(k).Te;
    
    i = Te.i;
    j = Te.j;
    m = Te.m;
    n = Te.n;
    
    if n == 0
        K([i,j,m],[i,j,m]) = K([i,j,m],[i,j,m]) + Ke;
        P([i,j,m]) = P([i,j,m]) + Pe;
    else
        K([i,j,m,n],[i,j,m,n]) = K([i,j,m,n],[i,j,m,n]) + Ke;
        P([i,j,m,n]) = P([i,j,m,n]) + Pe;
    end
end

%在1,2点应用常温边界条件
K(1:2,:) = zeros(2,9);
K(1,1) = 1;
K(2,2) = 1;
P(1) = 100;
P(2) = 100;

end

