%Raiid Ahmed Homework 2 Question 2

function[n, array] = diff_limit(funct, x0, rel_err_max, iter_max, h)
    
    if ~exist('rel_err_max', 'var') || isempty(rel_err_max)    %Check if there is a max error  
        rel_err_max = .0001;
    end
    
    if ~exist('iter_max', 'var') || isempty(iter_max)  %Check if there is a max iteration value 
        iter_max = 50;
    end
    
    if ~exist('h', 'var') || isempty(rel_err_max)    %Check if there is an initial step size  
        h = 1;
    end

    k = 1;
    Dprev = (funct(x0 + h/(10^k)) - funct(x0 - h/(10^k)))/(2*(h/(10^k)));
    rel_err = inf;
    array = [h/(10^k), Dprev, 0];
    
    while rel_err > rel_err_max && k < iter_max
        k = k + 1;
        step = h/(10^k);
        D = (funct(x0 + step) - funct(x0 - step))/(2*(step));
        
        rel_err = abs((D - Dprev)/D);
        array(k,1) = step;
        array(k,2) = D;
        array(k,3) = rel_err;
        Dprev = D;
    end
    n = k;
    
    disp("The approximation required " + n + " iterations")
    disp("Steps used: " + array(:,1))
    disp("Approximations: " + array(:,2))
    disp("Relative Errors: " + array(:,3))
end

        
