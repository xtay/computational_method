function [ x0, x1, x, status ] = BISECTION( a, b, f, E, h )
%本算法按二分法计算f(x) = 0的根可能所在的一个小区间，或者可能的根
%本算法要求函数f(x)为单调函数！
%ref page 201.与课本上的稍有修改，为的是拓展本函数的功能，使得本函数不仅可以求方
%程的根（令参数h=0即可），也可以求方程根的所在区间，以进一步用更高效的算法求根。
%输入:
%   a,b 方程根的两个初始近似（事实上一点都不近似- -）
%   f, 待解方程
%   E, 如果直接求根，则需要的精度
%   h, 如果求区间，则需要的区间长度（<(b-a))，如果需要直接求根，令h=0即可
%输出：
%   x0,x1 方程根可能存在的小区间的上下限
%   x, 如果是求方程的根，那么x存放方程的根
%   status, 求解状况，如果方程无解，返回-1，如果没找到根x，则返回0，否则，返回1

status = 0;
x0 = a;
x1 = b;
f0 = f(x0);
f1 = f(x1);

if f0*f1 > 0
    status = -1;
    fprintf('equation unsolvable!');
    return;
end
if abs(f0) < E
    x = x0;
    status = 1;
    fprintf('BISECTION solve: %f', x0);
    return;
end
if abs(f1) < E
    x = x1;
    status = 1;
    fprintf('BISECTION solve: %f', x1);
    return;
end

while abs(x0 - x1) > h
    x = (x0 + x1) / 2;
    fm = f(x);
    if abs(fm) < E
        status = 1;
        fprintf('BISECTION solve: %f', x);
        return;
    end
    
    if f1*fm < 0
        x0 = x;
        f0 = fm;
    else
        x1 = x;
        f1 = fm;
    end
end
        

end

