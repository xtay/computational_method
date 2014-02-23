function [ x ] = GAUSSPP( A, n, b )
%GAUSSPP 列主元Gauss消去法解线性方程组
%ref page 33.
%   x, the answer
%   A, the coefficent matrix
%   b, the array on the right side of the '='
%   n, the size of the array
for k = 1:n-1
    %find the max element in the current column
    i = k;
    maxIndex = k;
    maxVal = A(i,k);
    for i = k+1:n
        if abs(A(i,k)) > maxVal
            maxVal = A(i,k);
            maxIndex = i;
        end
    end
    %this column is all zero? this could be an error.
    if maxVal == 0
        fprintf('error 1\n');
        exit;
    end
    %exchange the whole row between row k and the row with the maxVal
    for j = 1:n
        tmp = A(k,j);
        A(k,j) = A(maxIndex,j);
        A(maxIndex,j) = tmp;
    end
    tmp = b(k);
    b(k) = b(maxIndex);
    b(maxIndex) = tmp;
    %the elimination
    for i = k+1:n
        A(i,k) = A(i,k) / A(k,k);
        for j = k+1:n
            A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
        b(i) = b(i) - A(i,k)*b(k);
    end
    %back substitution
    x(n) = b(n)/A(n,n);
    for k = n-1:-1:1
        %calc the sum
        sum = 0;
        for j = k+1:n
            sum = sum + A(k,j)*x(j);
        end
        x(k) = (b(k) -sum) / A(k,k);
    end

end

