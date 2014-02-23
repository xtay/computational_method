function [ x ] = SECANT1( a, b, f, E, Nmax )
%本算法用割线法求f(x) = 0的根
%ref page 199.
%输入：
%   a,b 方程根的初始近似
%   f, 待解的方程
%   E, 精度
%   Nmax, 允许的最大迭代次数。
%输出：
%   x, 方程的根

x0 = a;
x1 = b;
f0 = f(x0);
f1 = f(x1);

if abs(f1) > abs(f0)
    tmp = x0; x0 = x1; x1 = tmp;
    tmp = f0; f0 = f1; f1 = tmp;
end

for k = 1:Nmax
    if abs(f1) < E
        x = x1;
        return;
    end
    s = f1/f0;
    x = x1 - ((x0-x1)*s)/(1-s);
    fm = f(x);
    if abs(x1 - x) < E*x
        return;
    end
    
    if abs(fm) > abs(f1)
        x0 = x;
        f0 = fm;
    else
        x0 = x1;
        x0 = f1;
        x1 = x;
        f1 = fm;
    end
end
fprintf('%d times of iteration does not make sense');

end

