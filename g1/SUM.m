function [ S ] = SUM( A )
%SUM4算法求数组和，将数按符号分为两组，按绝对值从小到大排序，分别求和，最后再归到一起。
%参考 P21
%输入：
%   A, 数组
%输出：
%   S, 最终结果

%Initialization
i = 1;
j = 1;
B(1) = 0;
C(1) = 0;
n = length(A);
%将原数组按符号分为两组
for k = 1:n
    if A(i) >= 0
        B(i) = A(k);
        i = i+1;
    else
        C(j) = A(k);
        j = j+1;
    end
end
i = i-1;
j = j-1;

%排序
D = sort(B);
E = sort(C);

%求部分和
sum_pos = 0;
for k = 1:i
    sum_pos = sum_pos + D(k);
end
%从绝对值小的开始加
sum_neg = 0;
for k = j:-1:1
    sum_neg = sum_neg + E(k);
end

%得到最终结果
S = sum_pos + sum_neg;


end

