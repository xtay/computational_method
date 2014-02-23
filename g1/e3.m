clear all;
close all;
format long;

%读取数据文件，这里以fun003.dat的数据为例
filename = './data/fun005.dat';
[ h,A,b ] = READ_BINFILE(filename);

ver = h.ver;
n = h.n;

fprintf('Solving file %s, dimensions: %d\n', filename, n);
if ver == 513
    p = h.p;
    q = h.q;
    fprintf('this is a compressed matrix, p=%d, q=%d\n',p,q);
end

%choose different solver for different kind of storage of matrix
if ver == 513
    
    x = GAUSSPP_C(A,h,b);
    fprintf('equation solved, check residualNorm\n');
    
    b0 = MVMUL_C( A, h, x );   %compressed version of A*x
    resC = norm(b0 - b)   %check the residual
    
else
    x = GAUSSPP( A, b, n );
    fprintf('equation solved, check residualNorm\n');
   
    res = norm(A*x - b)    %check the residual
    
end