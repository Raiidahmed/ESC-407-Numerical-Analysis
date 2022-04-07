% Raiid Ahmed Homework 3 Problem 1 Secant

function [root,froot,rel_err,iter] = secant(funct,bracket,rel_err_max,max_iter)
    
    if ~exist('rel_err_max', 'var') || isempty(rel_err_max)    %Check if there is a max error  
        rel_err_max = .0001;
    end
    
    if ~exist('max_iter', 'var') || isempty(max_iter)  %Check if there is a max iteration value 
        max_iter = 20;
    end

    rel_err = inf;
    iter = 0;
    x0 = bracket(1);
    x1 = bracket(2);
    
    while iter < max_iter && rel_err > rel_err_max
        x = x1 - (funct(x1) * (x1 - x0))/(funct(x1) - funct(x0));
        rel_err = abs((x - x1)/x);
        iter = iter + 1;
        x0 = x1;
        x1 = x;
    end
    
    root = x;
    froot = funct(x);
end
        
    
    
    
    