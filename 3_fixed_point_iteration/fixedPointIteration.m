% fixedPointIteration.m
clear all 
format long

pKnot = 2.5; Nknot =100; TOL=10^-10;

g = @(x)  x - ( (x^3 - 25) / (3*x^2) ) ;

for i = 0:Nknot
    p = g(pKnot);
   
     disp(pKnot)
    if abs(p - pKnot) < TOL
        disp(p)
        break;
    end
   
    if (i==Nknot)
        disp('ERROR')
        disp(Nknot)
        disp(TOL)
    end
   
    pKnot = p;

end