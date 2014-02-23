function [ R ] = ROMBERG( a, b, E, f, Nmax)
%使用Romberg方法求函数的积分
%ref page 152 图4-1，书上的算法中使用了goto语句，这在编程中很不科学，本函数将尝
%试根据算法的思想将其用顺序、分支、循环的方式改写。
%输入：
%   a,b 积分区间的上下界
%   E, 精度
%   f, 待积函数（要求在区间[a, b]上有定义）
%   Nmax, 允许的最大计算行数
%输出：
%   R, f在区间[a,b]上的积分值。

%每行数据只会用到上面一行的数据，故只需要有两行来保存即可
%    [T, S, C, R]
T1 = [0, 0, 0, 0];
T2 = [0, 0, 0, 0];

T1(1) = (b - a)*(f(a) + f(b))/2;

for n = 1:Nmax
    h = (b - a) / 2^n;
    x = a:h:b;
    sum = 0;
    for i = 1:2^n
        sum = sum + (f(x(i)) + f(x(i+1)))*h/2;
    end
    T2(1) = sum;
    for i = 2:min(n+1, 4)
        T2(i) = (4^(i-1)*T2(i-1)-T2(i-1))/(4^(i-1)-1);
    end
    if (n > 3) && (abs(T1(4) - T2(4)) < E)
        break;
    end
    T1 = T2;
end

R = T2(4);


    


end

