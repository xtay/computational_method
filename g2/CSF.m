function [ F ] = CSF( f, a, b, n )
%Compound Simpson formula, 复化的Simpson公式
%参考P140
%输入：
%   f, 待积函数
%   a,b, 积分下/上限
%   n, 区间中采样点数
%输出：
%   F, 积分结果

h = (b - a)/n;

sum1 = 0;
sum2 = 0;

for k = 1:(n-1)
    xk = a + k*h;
    sum1 = sum1 + f(xk);
    sum2 = sum2 + f(xk - h/2);
end

sum2 = sum2 + f(b - h/2);

F = h/6 * ( f(a) + 2 * sum1 + 4 * sum2 + f(b) );

end

