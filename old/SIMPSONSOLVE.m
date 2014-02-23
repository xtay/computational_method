function [ x, y ] = SIMPSONSOLVE( K, f, a, b, n )
%第二类Fredholm线性积分公式的离散解
%ref 杨小刚.用复化梯形公式外推法求解积分方程
%输入：
%   k,f 两个inline函数，k函数为被积函数的一部分，f为积分号外的那个函数，具体参见ref
%   a,b 积分的上下限
%   n 积分区间分段数
%输出：
%   x,y 积分方程的离散解向量

h = (b-a)/n;    %应用Simpson公式的步长
x = a:(h/2):b;  %获得待离散的点（共2n+1个）。

%利用Simpson公式构造一组线性方程，
%下面生成其右端特向量d
for i = 1:(2*n+1)
    d(i) = -f(x(i));
end
%下面得到其系数矩阵
for i = 1:(2*n+1)
    A(i,1) = h/6*K(x(i), x(1));
    A(i,2*n+1) = h/6*K(x(i), x(2*n+1));
    for k = 2:(2*n)
        if mod(k,2) == 1
            A(i,k) = 2*h/6*K(x(i), x(k));
        else
            A(i,k) = 4*h/6*K(x(i), x(k));
        end
    end
        A(i,i) = A(i,i) - 1;
end

%使用列主元高斯消元法求解线性方程组Ay=d，得到y
y = GAUSSPP(A, 2*n+1, d);

end

