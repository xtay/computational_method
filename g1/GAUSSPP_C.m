function [ x ] = GAUSSPP_C( A, h, b )
%GAUSSPP 列主元Gauss消去法解线性方程组，Compressed matrix version!
%ref page 33.
%输入：
%   A, the coefficent matrix
%   h, the header of the matrix file
%   b, the array on the right side of the '='
%输出：
%   x, the answer

%get basic info from header
n = h.n;
p = h.p;
q = h.q;

%slightly expand the A, p more rows, so that the process below could be excuted inside A
A(:,p+q+2:p+q+1+p) = zeros(n,p);
h.q = p+q;  %so that INDEX_G2C could get correct state.

%GAUSSPP begin...
fprintf('ellimination...\n');

for k = 1:n-1
    %find the max element in the current column
    i = k;
    maxIndex = k;

    [ ci, ck, state ] = INDEX_G2C(h, i, k);
    
    maxVal = A(ci,ck);  %knowing that diag elements must have been stored, state is not checked
    
    for i = k+1:k+p
        [ ci, ck, state ] = INDEX_G2C(h, i, k); 
        if i <= n && abs(A(ci,ck)) > abs(maxVal) % another 2 BUGS!!!, this should be &&, NOT ||, and abs should always be here...
            maxVal = A(ci,ck);
            maxIndex = i;
        end
    end
    
    %this column is all zero? this could be an error.
    if abs(maxVal) < 10e-9
        fprintf('error, maxVal:%f\n', maxVal);
        return;
    end
    
    %exchange the whole row between row k and the row with the maxVal
    if maxIndex ~= k
        for j = k:k+q+p
            [ ck1, cj1, state ] = INDEX_G2C(h, k, j);
            tmp = A(ck1,cj1);
        
            [ cmaxIndex2, cj2, state ] = INDEX_G2C(h, maxIndex, j);
            A(ck1,cj1) = A(cmaxIndex2,cj2);
        
            A(cmaxIndex2,cj2) = tmp;
        end
    
        tmp = b(k);
        b(k) = b(maxIndex);
        b(maxIndex) = tmp;
    end
    
    %the elimination
    for i = k+1:k+p
        if i <= n   %mark... last BUG comes from here ,loss of "="
            [ ci, ck, state ] = INDEX_G2C(h, i, k);
            [ ck1, ck2, state ] = INDEX_G2C(h, k, k);
            A(ci,ck) = A(ci,ck) / A(ck1,ck2);
            
            if A(ci,ck) ~= 0
                for j = k+1:k+q+p
                    [ ci0, cj0, state ] = INDEX_G2C(h, i, j);
                    [ ci1, ck1, state ] = INDEX_G2C(h, i, k);
                    [ ck2, cj2, state ] = INDEX_G2C(h, k, j);
                    A(ci0,cj0) = A(ci0,cj0) - A(ci1,ck1)*A(ck2,cj2);

                end
        
                [ ci, ck, state ] = INDEX_G2C(h, i, k);
                b(i) = b(i) - A(ci,ck)*b(k);
            end
            
        end
    end
    %fprintf('eliminate:%d\n',k);
    
end

%back substitution
fprintf('back substitution...\n');
x = zeros(n,1);

[ cn1, cn2, state ] = INDEX_G2C(h, n, n);
x(n) = b(n)/A(cn1,cn2);

for k = n-1:-1:1       
    %calc the sum
    sum = 0;
    for j = k+1:k+q+p
        if j <= n
            [ ck, cj, state ] = INDEX_G2C(h, k, j);
            sum = sum + A(ck,cj)*x(j);
        end
    end
    %sum = SUM( A(k,k+1:n).*(x(k+1:n))', n-k );
    [ ck1, ck2, state ] = INDEX_G2C(h, k, k);
    x(k) = (b(k) -sum) / A(ck1,ck2);
    
end

end

