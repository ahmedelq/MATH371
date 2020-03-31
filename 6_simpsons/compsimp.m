clc; format long;
%%%%%%%%%
a =3; b=5; 
n=8; 
%%%%%%%%%
h = (b - a) / n ;
X = zeros(3, 1);
f = @(x) 1 / sqrt(x^2 - 4);

X(1) =  f(a) + f(b);
    
for i=1:n-1
   x =  a + i*h;
   if ~ mod(i,2) X(3) = X(3) + f(x); else X(2) = X(2) + f(x); end
end

XI = (h/3) * ( X(1) + 2*X(3) + 4*X(2) )