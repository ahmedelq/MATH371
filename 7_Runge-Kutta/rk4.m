a = 0; b = 1;
h = 0.25;
f = @(t,y) exp(t-y);
y = @(t) log(exp(t) + exp(1) -1); % ln(e^t + e - 1)
%%%%%%%%%%%%%%%%%%
N = (b-a) / h;
alfa = 1;
w = alfa;
t = a;
K = zeros(4);
result = zeros(N+1, 4);
result(1, :) = [t,w, y(t), abs(w-y(t)) ];



for i=1:N
    K(1) = h * f(t,w);
    K(2) = h * f(t + h/2, w + K(1)/2);
    K(3) = h * f(t + h/2, w + K(2)/2);
    K(4) = h * f(t + h, w + K(3) );
    
    w = w + ( K(1) + 2*K(2) + 2*K(3) +K(4) ) / 6;
    t = a + i*h;

    result(i+1, :) = [t,w, y(t), w-y(t)];
end

t = array2table(result,...
    'VariableNames',{'t','w','y' ,'Error'})

x = linspace(0,1,4);
yl = y(x);
hold on
plot(x,yl,'linewidth',1,'color','b')
plot(result(:,2) )
hold off
