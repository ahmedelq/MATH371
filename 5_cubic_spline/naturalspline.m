clc; format long;

X = linspace(0, pi, 4);
a = sin(X);
h = pi/3;
n = length(X);

A = zeros(n);
b = zeros(n, 1);
bs =    zeros(n-1, 1); % b0, ... , b(n-1)
ds =    zeros(n-1, 1); % d0, ..., d(n-1)

A(1,1) = 1;
A(n,n) = 1;

for i=2:n-1
    A(i, i-1) = h; %hi-1
    A(i, i) = 2*(h+h);
    A(i, i+1) = h; %hiyy
end


for i=2:n-1
    b(i) = (3/h) * ( a(i+1) - a(i) ) - (3/h) * ( a(i) - a(i-1) );
end
 


c = A\b

for i=1:n-1
    bs(i) = (1/h) * ( a(i+1) - a(i) ) - (h/3) * ( c(i+1) + 2 * c(i) );
end


for i=1:n-1
    ds(i) = (1/3*h) * ( c(i+1) - c(i) );
end

bs
ds