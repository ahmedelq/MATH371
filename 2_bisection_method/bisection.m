Nknot = 100; a = 1; b = 2; 
TOL = 10^-4;

f = @(x) x^3 + 4*x^2-10;
fprintf('\n i a b p f(p)\n');
FA = f(a);
for i=1:Nknot
    d = (b-a) / 2;
    p = a + d;
    FP = f(p);
    
    
    fprintf('\n %d | %d %d | %d %d ',i,a,b,p,FP);

    if FP == 0 || d < TOL 
        disp(p)
        msg = ['found after ',  num2str(i), ' iterations'];
        disp(msg)
        break;
        
    elseif i == Nknot 
        disp('Error')
    end
    
    
    if FA * FP > 0
        a = p;
        FA = FP;
    else 
        b = p;
    end
end

 

