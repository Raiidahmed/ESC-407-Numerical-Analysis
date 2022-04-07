% Raiid Ahmed Homework 3 Problem 1 Bisect

function [root,froot,rel_err,iter] = bisect(funct,bracket,rel_err_max,max_iter)
    
    rel_err = inf;
    iter = 0;
    a = bracket(1);
    b = bracket(2);
    prevc = 0;
    
    while iter < max_iter && rel_err > rel_err_max
        c = (a + b)/2;
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
   