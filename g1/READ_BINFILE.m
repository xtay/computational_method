function [ h,A,b ] = READ_BINFILE( filename )
%依照题目要求，对二进制数据文件进行读取，并根据要求选择压缩方式存储矩阵
%输入：
%   filename: 文件的完整路径及文件名
%输出：
%   h: 文件头，非压缩存储矩阵包含有3个整型变量(id,ver,n)，压缩矩阵包含2个额外整型变量(p,q)
%   A: 从文件中读取获得的矩阵，可能是压缩矩阵，也可能不是，看h中的矩阵类型了
%   b: 从文件中读取获得的右端向量

fip = fopen(filename, 'rb');

%get the header
h.id  = fread(fip, 1, 'uint32');
h.ver = fread(fip, 1, 'uint32');
h.n   = fread(fip, 1, 'uint32');
%check if the file contains compressed matrix
if h.ver == hex2dec('201')
    %get the extra header
    h.p = fread(fip,1,'uint32');
    h.q = fread(fip,1,'uint32');
end

%分情况读取矩阵。。。
if h.ver == hex2dec('201')   %Compressed matrix
    %get basic info from header
    n = h.n;
    p = h.p;
    q = h.q;
    %preallocation
    A = zeros(n,p+1+q); %lower band and diag and upper band
    
    %read in the matrix
    for i = 1:n
        A(i,:) = fread(fip, p+1+q, 'single');
    end
    
    %read in the vector
    b = fread(fip,n,'single');
    
else                        %Normal matrix
    %get basic info from header
    n = h.n;
    %preallocation
    A = zeros(n,n);

    %read in the matrix
    for i = 1:n
        A(i,:) = fread(fip,n,'single');
    end

    %read in the vector
    b = fread(fip,n,'single');
    
end


end

