function [ I ] = TR( f, a, b, e )
%参考P144页，稍作修改
%输入：
%   f, 待积函数
%   a,b, 积分下上限
%   e, 允许的误差
%输出：
%   I, 积分结果

h0 = b-a;
T0 = ( f(a) + f(b) ) * h0 / 2;
n = 1;
EMAX = 1;

while EMAX > e
    n = n * 2;
    
    h1 = (b-a)/n;
    
    S = 0;
    x = a + h1;
    
    while x < b
        S = S + f(x);
        x = x + h0;
    end
    
    T1 = (T0 + h0*S) / 2;
    
    EMAX = abs(T1 - T0);
    
    T0 = T1;
    h0 = h1;
end
 
I = T1;
h1

end

