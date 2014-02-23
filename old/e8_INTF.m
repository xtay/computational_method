function [ v ] = e8_INTF( t )
%此函数仅针对exercise 8！！
%给定x,对变量t在[0,pi]上求积分。 
%输入：
%   x, 为全局变量，不会出现在函数参数列表中
%   t, 为被积变量
%输出：
%   v, 积分结果
    global x;
    x = t;
    
    E = 0.00001;
    Nmax = 20;
    
    v = ROMBERG(0, pi, E, @e8_FUNC, Nmax);

end

