format long;



X = [-0.5; -0.25; 0.25; 0.5];
Y = [1.93750; 1.33203;  0.800781; 0.687500];
F = zeros(length(X));

F(:,1) = Y;
%%%
x = 2.2; %interpolated value
result = ones(size(X));

for i=2:length(X)
    for j=2:i
        
        
        a = F(i,j-1) - F(i-1, j-1);
        F(i,j) =  ( a )  / ( X(i) - X(i-j+1) ) ;
       
    end
end
disp(F);
result = diag(F);

for i=2:size(X)
    for j=1:i-1
        result(i) = result(i) * ( (x-X(j)) );
    end 
end

%disp(sum(result))


p=@(t) F(1,1) + F(2,2)*(t-X(1)) +F(3,3) * (t-X(1))*(t-X(2))+F(4,4)*(t-X(1))*(t-X(2))*(t-X(3));
f=@(x) x^2 + 2*x -3;

t=linspace(min(X) - abs(min(X))/2, max(X) + abs(max(X))/2 );

y=zeros(100,1);
oy = zeros(100,1);
for i=1:100 

         y(i)=p(t(i));
         oy(i) = f(t(i));

end
hold on;
plot(X,Y,'r*');
plot(t,y);
plot(t,oy);
hold off;
