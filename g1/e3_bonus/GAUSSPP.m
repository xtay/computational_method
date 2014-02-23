function [ x ] = GAUSSPP( A, b, n )
%GAUSSPP 列主元Gauss消去法解线性方程组
%ref page 33.
%输入：
%   A, the coefficent matrix
%   n, the size of the array
%   b, the array on the right side of the '='
%输出：
%   x, the answer

fprintf('elimination...\n');
for k = 1:n-1
    %find the max element in the current column
    i = k;
    maxIndex = k;
    maxVal = A(i,k);
    for i = k+1:n
        if abs(A(i,k)) > abs(maxVal)
            maxVal = A(i,k);
            maxIndex = i;
        end
    end
    
    %this column is all zero? this could be an error.
    if abs(maxVal) < 10e-9
        fprintf('error 1\n');
        return;
    end
    
    %exchange the whole row between row k and the row with the maxVal
    if maxIndex ~= k
        for j = 1:n
            tmp = A(k,j);
            A(k,j) = A(maxIndex,j);
            A(maxIndex,j) = tmp;
        end
    
        tmp = b(k);
        b(k) = b(maxIndex);
        b(maxIndex) = tmp;
    end
    
    %the elimination
    for i = k+1:n
        if A(i,k) ~= 0
            A(i,k) = A(i,k) / A(k,k);
            for j = k+1:n
                A(i,j) = A(i,j) - A(i,k)*A(k,j);
            end
            b(i) = b(i) - A(i,k)*b(k);
        end
    end
    
end

%back substitution
fprintf('back substitution...\n');

x = zeros(n,1);
x(n) = b(n)/A(n,n);
    
for k = n-1:-1:1       
    %calc the sum
    sum = 0;
    for j = k+1:n
        sum = sum + A(k,j)*x(j);
    end
    %sum = SUM( A(k,k+1:n).*(x(k+1:n))', n-k );
    x(k) = (b(k) -sum) / A(k,k);
end

end

