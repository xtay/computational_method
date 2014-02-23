function [ y ] = RK4( f, a, b, ya, N )
%“古典”RK方法解初值问题
%参考，教材P265
%输入：
%   f, 一个函数
%   a,b, 积分区间的下上限
%   ya, 函数在点a的值
%   N, 分段数
%输出：
%   y: 结果

h = (b - a)/N;
t0 = a;
y0 = ya;

for i = 1:N
    
    K1 = h * f(t0, y0);
    K2 = h * f(t0 + h/2, y0 + K1/2);
    K3 = h * f(t0 + h/2, y0 + K2/2);
    K4 = h * f(t0 + h, y0 + K3);
    
    y = y0 + (K1 + 2*K2 + 2*K3 + K4)/6;
    
    y0 = y;
    t0 = t0+h;
    
end

end

