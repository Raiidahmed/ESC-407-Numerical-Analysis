% Raiid Ahmed Homework 3 Problem 4 Newton

function [root,rel_err,iter] = newton_sys(functs,Jacobian,inits,rel_err_max,max_iter)
    
    if ~exist('rel_err_max', 'var') || isempty(rel_err_max)    %Check if there is a max error  
        rel_err_max = .0001;
    end
    
    if ~exist('max_iter', 'var') || isempty(max_iter)  %Check if there is a max iteration value 
        max_iter = 20;
    end
    
    iter = 0;
    x = inits;
    rel_err = inf;
    
    while (iter < max_iter && rel_err > rel_err_max)
        xprev = x;
        x = xprev - Jacobian(x)\functs(x);
        iter = iter + 1;
        rel_err = sqrt(((x(1) - xprev(1))^2) + ((x(2) - xprev(2))^2));
    end
    
    root = x;
end
        