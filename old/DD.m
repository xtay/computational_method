function [ yd ] = DD( x, y, n )
%给定插值数据点，本算法计算Newton插值多项式中的系数
%ref page 91
%输入：
%   x,y, 数据点的向量，其中每对数据(xi,yi)表示待插值的一个点
%   n, 分段数目，即可用的插值点的数量为n+1个
%输出：
%   yd, Newton插值多项式的系数
yd = y;
for k = 1:n
    for i = n+1:-1:k+1
        yd(i) = (yd(i) - yd(i-1)) / (x(i) - x(i-k));
    end
end

end

