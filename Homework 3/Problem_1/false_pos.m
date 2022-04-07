% Raiid Ahmed Homework 3 Problem 1 False Positive

function [root,froot,rel_err,iter] = false_pos(funct,bracket,rel_err_max,max_iter)

    if ~exist('rel_err_max', 'var') || isempty(rel_err_max)    %Check if there is a max error  
        rel_err_max = .0001;
    end
    
    if ~exist('max_iter', 'var') || isempty(max_iter)  %Check if there is a max iteration value 
        max_iter = 20;
    end

    rel_err = inf;
    iter = 0;
    a = bracket(1);
    b = bracket(2);
    prevc = 0;
    
    if sign(funct(a)) == sign(funct(b))
        err('Bracket does not enclose root.')
    end
    
    while iter < max_iter && rel_err > rel_err_max
        c = (a * funct(b) - b * funct(a))/(funct(b)-funct(a));
        check = funct(c);
        if sign(check) == sign(funct(a))
            a = c;
        elseif sign(check) == sign(funct(b))
            b = c;
        end
        rel_err = abs((c - prevc)/c);
        iter = iter + 1;
        prevc = c;
    end
    
    root = c;
    froot = check;
end
   