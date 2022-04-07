%Raiid Ahmed Homework 7 Problem 4

function [coeff,r2,r] = polyfit(x,y,n)
    
    %Make sure x and y are horizontal
    
    x = reshape(x,[1,length(x)]);
    y = reshape(y,[1,length(y)]);

    m = length(x);

    %Check if n is positive
    
    if n <= 0
        error('n must be a positive integer')
    end
    
    %Check if x and y are the same length
    
    if m ~= length(y)
        error('x and y must be the same length.')
    end
    
    %Check if n < m - 1
    
    if n >= m - 1
        error('n must be less than m - 1')
    end
    
    %Create and solve linear equations
    
    j = 0:n;
    k = 0:n;
    jplusk = j.'+k;
    jplusk = reshape(jplusk,[1,numel(jplusk)]);

    a = sum(x.'.^jplusk);
    a = reshape(a,[n+1,n+1]);
    b = sum(y.'.*((x.'.^j))).';

    coeff = flip(gaussepp(a,b).');
    
    %Find r and r2
    
    sr = sum((y - polyval(coeff,x)).^2);
    st = sum((y-(1/m)*sum(y)).^2);

    r2 = (st-sr)/st;
    r = sqrt(r2);
end
    
    
    
    
    
    
    
    
    
    
    