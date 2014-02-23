clear all;
close all;
format short;

%读取数据文件，这里以fun003.dat的数据为例
%filename = './data/fun001.dat';
%[ h,A,b ] = READ_BINFILE( filename );
%fprintf('dealing with %s...\n\n', filename);


%本题实现的LU分解目前只适用于没有压缩存储的矩阵,检查文件头，看是否符合分解要求
%ver = h.ver;
%if ver == hex2dec('201')
%    fprintf('Compressed Matrix is not supported!\n');
%    return;
%end

%如果没别的问题，那就开始分解。。。
%n = h.n;

A = [ 1, 1, 0, 3; 2, 1, -1, 1; 3, -1, -1, 2; -1, 2, 3, -1 ]
n = 4;


[ L,U ] = LU( A, n );

L
U

fprintf('the maximum difference between A and L*U is:\n');
max(max(A - L*U))