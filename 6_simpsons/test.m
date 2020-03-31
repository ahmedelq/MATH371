clc;
%%%%%%%%%
a = 0; b=4  ; 
n=8; 
%%%%%%%%%
h = (b - a) / n ;
X = zeros(3, 1);    
f = @(x) exp(x);

X(1) =  f(b) + f(a);
    
for i=1:n
   x =  a + i*h;
   if ~ mod(i,2) X(3) = X(3) + f(x); else X(2) = X(2) + f(x); end
end

XI = (h/3) * (X(1) + 2*X(3) + 4*X(2) )