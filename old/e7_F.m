function [ y ] = e7_F( x )
%第七题中的被积函数
if x == 0
    y = 1;
else
    y = sin(x)/x;
end 

end

