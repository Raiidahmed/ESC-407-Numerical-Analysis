%Raiid Ahmed HW5 Problem 2

function integ = csr(f,a,b,n)
    
    %check if n is even
        
    if mod(n,2) ~= 0
        error('n is not even')
    end
    
    %run simpsons algorithm at step size h
    
    h = (b-a)/n;
    sum1 = f(a) + f(b);
    sum2 = 0;
    sum3 = 0;
    for j = 1:n-1
        x = a + j*h;
        if mod(j,2) == 0
            sum3 = sum3 + f(x);
        else
            sum2 = sum2 + f(x);
        end
    end
    integ = (h/3)*(sum1 + 2*sum3 + 4*sum2);
end