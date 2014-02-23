function [ yS ] = EVASPLINE( x, y, n, xS, M )
%求三次样条插值，对应某一点xN的值
%ref page 111, 为避免重复求解三次样条插值的向量，这里直接引用三次样条的插值结果
%亦即要求用户在调用本函数时，必须先自行调用SPLINEM函数，生成三次样条插值向量M
%输入：
%   x,y 待插值的数据点
%   n, 分段数目，插值数据点总共有n+1个
%   xN, 待求解的坐标点
%   M, 调用SPLINEM函数生成的三次样条插值的向量
%输出：
%   yN, 对应于xN的三次样条插值近似值。

%FINDK, 这里我没有如书上那样将这一过程单独写为一个函数

for k = 2:n+1
    if xS <= x(k)
        break;
    end
end
k = k-1;
h = x(k+1) - x(k);
xl = xS - x(k);
xr = x(k+1) - xS;

yS = (M(k)*(xr^3)/6 + M(k+1)*(xl^3)/6 + (y(k) - M(k)*(h^2)/6)*xr + (y(k+1) - M(k+1)*(h^2)/6)*xl)/h;

end

