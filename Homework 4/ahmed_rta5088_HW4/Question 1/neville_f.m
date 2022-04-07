%Raiid Ahmed Homework 4 Question 1

function[approx, rel_err, iter] = neville_f(funct, xe, interval, rel_err_max, max_iter)

    if ~exist('rel_err_max', 'var') || isempty(rel_err_max)    %Check if there is a max error  
        rel_err_max = .0001;
    end
    
    if ~exist('max_iter', 'var') || isempty(max_iter)    %Check if there is a max iteration 
        max_iter = 50;
    end
    
    n = 1;
    iter = 1;
    rel_err = inf;
    a = interval(1);
    b = interval(2);

    while rel_err > rel_err_max && iter < max_iter
        x = a:(b-a)/n:b;
        y = funct(x);
        Q = neville(x,y,xe);

        rel_err = abs((Q(n+1,n+1)-Q(n,n))/Q(n+1,n+1));
        n = n + 1;
        iter = iter + 1;
    end

    if iter >= max_iter
        iter = "You reached the max # of iterations";
    end

    approx = Q(n,n);
end

