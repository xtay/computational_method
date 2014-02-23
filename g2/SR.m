function [ I ] = SR( f, a, b, e )
%参考P144页，稍作修改
%输入：
%   f, 待积函数
%   a,b, 积分下上限
%   e, 允许的误差
%输出：
%   I, 积分结果

h0 = b-a;

TMP0 = f((a+b)/2);

S0 = ( f(a) + 4*TMP0 + f(b) ) * h0 / 6;

EMAX = 1;
n = 1;

while EMAX > e
    n = n*2;
    h1 = (b-a)/n;

    TMP1 = 0;
    x = h1/2;
    
    while x < b
        TMP1 = TMP1 + f(x);
        x = x + h1;
    end

    S1 = S0/2 + (4*TMP1 - 2*TMP0) * h1/6;
    
    EMAX = abs(S1 - S0);
    
    S0 = S1;
    TMP0 = TMP1;
    h0 = h1;
end

h1 = (b-a)/n
I = S0;

end

