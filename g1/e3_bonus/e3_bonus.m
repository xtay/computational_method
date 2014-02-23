clear all;
close all;

pt = GETPOINTS();
T = GETELEMS();

n = length(T);
param.k = 1.4;
param.h = 20;

%求各单元传热矩阵
for k = 1:n
    [ Ke, Pe ] = EMATRIX(T(k),pt,param);
    gd(k).Ke = Ke;
    gd(k).Pe = Pe;
    gd(k).Te = T(k);
end

[ K, P ] = OMATRIX(gd);

x = GAUSSPP(K, P, 9)