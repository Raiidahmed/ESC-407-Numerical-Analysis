% Raiid Ahmed Homework 3 Problem 1 Newton

function [root,froot,rel_err,iter] = newton(funct,fdiff,init,rel_err_max,max_iter,is_max_iter)
    
    if ~exist('rel_err_max', 'var') || isempty(rel_err_max)    %Check if there is a max error  
        rel_err_max = .0001;
    end
    
    if ~exist('max_iter', 'var') || isempty(max_iter)  %Check if there is a max iteration value 
        max_iter = 20;
    end
    
    if ~exist('is_max_iter', 'var') || isempty(is_max_iter)  %Check if there is a max iteration value 
        is_max_iter = true;
    end
    
    rel_err = inf;
    iter = 0;
    iter_check = 0;
    x0 = init;
    
    while (iter_check < max_iter && rel_err > rel_err_max)
        x = x0 - funct(x0)/fdiff(x0);
        rel_err = abs((x - x0)/x);
        iter = iter + 1;
        if is_max_iter
            iter_check = iter;
        end
        x0 = x;
    end
    
    root = x;
    froot = funct(x);
end
        