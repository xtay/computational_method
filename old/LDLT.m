function [ B ] = LDLT( A,n )
%求对阵矩阵A的LDL^T分解
%ref page 41.
%输入：
%   A,待分解矩阵，事实上只需要给出A的下三角部分
%   n,矩阵A的大小。
%输出：
%   B,所求出的L存在于B的下三角部分，D存在于B的对角线上。

%preserve A at first!
B = A;
%then do what we should do with B
for k = 1:n
    for p = 1:k-1
        r(p) = B(p,p)*B(k,p);
    end
    %求和
    sum = 0;
    for p = 1:k-1
        sum = sum + B(k,p)*r(p);
    end
    %calc the diag values
    B(k,k) = B(k,k) - sum;
    if B(k,k) == 0
        fprintf('diag has a zero in it!\n');
        exit;
    end
    %求下三角
    for i = k+1:n
        %又是一个sum
        sum = 0;
        for p = 1:k-1
            sum = sum + B(i,p)*r(p);
        end
        B(i,k) = (B(i,k) - sum) / B(k,k);
    end
end

end

