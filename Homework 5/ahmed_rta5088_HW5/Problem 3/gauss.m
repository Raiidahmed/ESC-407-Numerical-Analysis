%Raiid Ahmed HW5 Problem 3

function [g_quad,rel_err,n] = gauss(f,a,b,A,W,err)
    n = 2;
    no = n - 1;
    ni = n;
    x = A(no:ni);
    w = W(no:ni);
    integold = ((b-a)/2)*sum(w.*f(((a + b)/2) + ((b - a)/2).*x));
    rel_err = inf;
    
    while rel_err > err
        n = n + 1;
        no = ni + 1;
        ni = no + n - 1;
        x = A(no:ni);
        w = W(no:ni);
        integ = ((b-a)/2)*sum(w.*f(((a + b)/2) + ((b - a)/2).*x));
        rel_err = abs((integ - integold)/integ);
        integold = integ;
    end
    g_quad = integ;
end