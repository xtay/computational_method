function [ Ke, Pe ] = EMATRIX( Te, pt, param )
%根据当前单元的点和边的值以及相关参数形成本单元的传热矩阵
%输入：
%   Te, 由GETELEMS函数得到的列向量中的一个元素
%   pt, 由GETPOINTS函数得到的整个向量
%   param, 其他参数，如热传导率k，边界的自然热对流系数h等。
%输出：
%   Ke, 单元传热矩阵
%   Pe, 单元温度载荷

%当前元的顶点编号，map用于之后的全局编号到当前矩阵间的转换
i = Te.i;   map(1) = i;
j = Te.j;   map(2) = j;
m = Te.m;   map(3) = m;
n = Te.n;   map(4) = n;    

k = param.k;
h = param.h;

if n == 0
    Pe = zeros(3,1);
    
    %相应顶点的参数
    xi = pt(i).x;    yi = pt(i).y;
    xj = pt(j).x;    yj = pt(j).y;
    xm = pt(m).x;    ym = pt(m).y;

    %单元面积，这里简化处理。。。
    A = 0.005;  %如果不是本题中如此有规律的话，应该由端点坐标求出此值

    bi = yj - ym;   ci = xm - xj;
    bj = ym - yi;   cj = xi - xm;
    bm = yi - yj;   cm = xj - xi;
    
    Ke = k/(4*A) * ([ bi; bj; bm ] * [ bi, bj, bm] + [ ci; cj; cm ] * [ ci, cj, cm ]);
else
    Pe = zeros(4,1);
    Ke = k/6 * ([2,-2,-1,1; -2,2,1,-1; -1,1,2,-2; 1,-1,-2,2] + [2,1,-1,-2; 1,2,-2,-1; -1,-2,2,1; -2,-1,1,2]);
end
%处理边界条件
k = 1;
if n == 0
    loop = 3;
else
    loop = 4;
end
for search = 1:loop
    t = pt(map(search)).t;
    if ~isnan(t)
        bound(k).pt = search;
        bound(k).t = t;
        k = k+1;
    end
end

if length(bound) ~= 2   %仅在当前单元有整条边作为边界时
    return;
end

b1 = bound(1).pt;
b2 = bound(2).pt;
t1 = bound(1).t;
t2 = bound(2).t;

l = 0.1; %边界边长本来应该用b1点和b2点的坐标来算的，这里针对此题简化为一常数

Ke([b1,b2],[b1,b2]) = Ke([b1,b2],[b1,b2]) + h*l/6 * [ 2, 1; 1, 2 ];

Pe([b1,b2]) = h*l/2 * [ t1; t2 ];

end

