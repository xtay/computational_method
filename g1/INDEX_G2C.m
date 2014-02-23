function [ ci, cj, state ] = INDEX_G2C( h, gi, gj )
%将非压缩矩阵的下标映射到压缩矩阵中去
%输入：
%   h: 文件头，详见READ_BINFILE函数
%   gi,gj: 待取元素在完整矩阵(解压缩后的矩阵)中的下标
%输出：
%   ci,cj: 元素压缩存储后的位置
%   state: 全局坐标下的相应元素是否被压缩存储了，1：有，其它值：越界的列坐标。

%get basic info from header
n = h.n;

%different ways to deal with different storage
if h.ver == 513
    
    p = h.p;    %lower bandwidth
    q = h.q;

    ci = gi;
    cj = gj-gi+p+1;
    
    if cj<1 || cj>(p+q+1);  %check if the element is stored or not
        state = cj;
    else
        state = 1;
    end
    
else
    
    ci = gi;
    cj = gj;
    
end

end

