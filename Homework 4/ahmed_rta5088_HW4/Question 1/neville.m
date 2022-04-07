%Raiid Ahmed Homework 4 Question 1

function[Q] = neville(xin, yin, xe)

    x = xin;
    y = yin;
    input = xe;
    n = length(x) - 1;
    Q = zeros(n+1,n+1);
    Q(:,1) = y;

    for i = 1:n
        for j = 1:i
            Q(i+1,j+1) = ((input-x(i-j+1))*Q(i+1,j) - (input-x(i+1))*Q(i,j));
            Q(i+1,j+1) = Q(i+1,j+1)/(x(i+1)-x(i-j+1));
        end
    end
end






