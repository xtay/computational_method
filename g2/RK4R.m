function [ y ] = RK4R( f, a, b, ya, e )
%RK4的变步长版本，其中需要调用RK4函数
%输入：
%   f, 一个函数
%   a,b, 积分区间的下上限
%   ya, 函数在点a的值
%   e, 要求的求解精度
%输出：
%   y: 结果

N = 1;
EMAX = 1;

y0 = 0;

while EMAX > e
    
    N = N*2;
    
    y1 = RK4(f, a, b, ya, N);
    
    EMAX = abs(y1 - y0);
    
    y0 = y1;

end

N
y = y1;

end

