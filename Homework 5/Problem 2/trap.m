%Raiid Ahmed HW5 Problem 2

function int_y = trap(x,y,yi)

    %check for same length x and y

    if length(x) ~= length(y)
        error("Vectors are not the same length")
    end
    
    %cumulative sum of trapezoids under the curve with n spacing
    
    n = length(x);
    int_y = zeros(n,1);
    trap = yi;
    int_y(1) = yi;
    for i = 2:n
        trap = trap + (x(i) - x(i-1))*(y(i-1) + y(i))*(1/2);
        int_y(i) = trap;
    end
end