function [ F ] = CTF( f, a, b, n )
%Compound trapezoid fomula, 复化的梯形公式
%参考P140
%输入：
%   f, 待积函数
%   a,b, 积分下/上限
%   n, 区间中采样点数
%输出：
%   F, 积分结果

h = (b - a)/n;

sum = 0;

for k = 1:(n-1)
    xk = a + k*h;
    sum = sum + f(xk);
end

F = h/2 * ( f(a) + 2 * sum + f(b) );

end

