%Raiid Ahmed Homework 7 Problem 1

function [X,Adet] = gaussepp(A,B)
        
    %Allocate parameters and augmented matrix

    n = length(A(1,:));
    X = zeros(size(B));
    A = [A B];
    swap = 0;
    
    %Solve using pseudocode algorithm
    
    for i = 1:n-1
         
         [y,p] = max(abs(A(i:n,i)));
         p = p+i-1;
         
         if A(p,i) == 0
             error('No unique solution exists.')
         end

         if p ~= i
            A([i p],:) = A([p i],:);
            swap = swap + 1;
         end
         
         xMultiplier = A(i+1:n,i) / A(i,i);
         A(i+1:n,:) = A(i+1:n,:) - xMultiplier * A(i,:);
         
    end 
    
    if A(n,n) == 0
        error('No unique solution exists.')
    end
    
    X(n,:) = A(n,n+1:length(A(1,:))) / A(n,n);
    
    for i = n-1:-1:1
        X(i, :) = (A(i,n+1:length(A(1,:))) - A(i,i+1:n) * X(i+1:n,:)) / A(i,i);
    end
    
    %Compute Determinant based on row swaps 
    
    if mod(swap,2) == 1
        Adet = -1;
    else
        Adet = 1;
    end
    
    for i = 1:n
        Adet = Adet * A(i,i);
    end
end
