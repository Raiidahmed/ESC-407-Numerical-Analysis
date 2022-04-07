% Raiid Ahmed Homework 2 Problem 2

% The ancient Babylonians (2000 B.C.) used an iterative method for computing the
% square root of a number 𝑎 that worked as follows.
% [formula]
% The idea is that you start with a guess for 𝑥, plug that guess into the right-hand side,
% and then this will generate a number on the left which will be your next guess for 𝑥,that is,
% [formula]
% This is sometimes called the divide and average method for estimating a square root.
% Write a Matlab function called approx_sqr that approximates the square root of
% a given number 𝑎 to within a user-specified relative error. The inputs to the function
% should be 𝑎, the relative error stopping criterion, and the maximum allowable number
% of iterations. The outputs should be the approximate value of √𝑎, the relative error
% at the end of the computation, and the required number of iterations to reach that
% error. For example, it might look something like this. If stop_err is omitted, then
% function should assign the default value stop_err = 0.0001. If max_it is omitted, it
% should assign the default value max_it = 50. Note that the function could be called
% as follows [sqa, rel_err, iter] = approx_sqr(23893243)
% or as [sqa, rel_err, iter] = approx_sqr(23893243, [], 0.0001)
% so you will also have to check for empty values of those two input variables (this
% command should help https://bit.ly/2O1cULQ).
% When computing the relative error in an iterative calculation like this, you determine it using
% 𝑅𝑥 = (present approx − previous approx)/present approx

function [root_a, rel_err, num_iter] = approx_sqr(a, err_stop_val, max_iter)  %Find a square root approximation with the babylonian method
    
    if ~exist('err_stop_val', 'var') || isempty(err_stop_val)    %Check if there is a max error  
        err_stop_val = .0001;
    end
    
    if ~exist('max_iter', 'var')  %Check if there is a max iteration value 
        max_iter = 50;
    end
    
    rel_err = inf;    %Allocating variables
    root_a = 0;
    root_a_old = 1;
    iter = 0;
    
        while rel_err > err_stop_val && iter < max_iter      %Continue babylon formula until rel error is below max value
            root_a = (root_a_old + a/root_a_old)/2;
            rel_err = abs((root_a - root_a_old)/root_a);
            root_a_old = root_a;
            iter = iter + 1;
        end
        
    num_iter = iter;
end
        

  
        
        
        
        
        
        
        