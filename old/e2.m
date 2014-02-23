close all;
clear all;
format long;

%initialize the matrix A.
for i = 1:20
    for j = 1:20
        if i == j
            A(i,j) = i;
        else
            A(i,j) = min(i,j);
        end
    end
end

fprintf('LDLT');
B = LDLT(A, 20)

fprintf('CHOLESKY');
C = CHOLESKY(A, 20)