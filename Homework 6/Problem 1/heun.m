%Homework 6 Problem 1 Raiid Ahmed

function [t, y] = heun(f,tspan,y0,h)
    
    t = tspan(1):h:tspan(2);
    y = zeros(2,length(t));
    
    y(1,1) = y0(1);
    y(2,1) = y0(2);
    
    for i = 1:(length(t)-1)
        k1 = f(t(i),y(:,i));
        k2 = f(t(i) + h, y(:,i) + h*k1);
        
        y(:,i+1) = y(:,i)+(.5*k1 + .5*k2)*h;
    end
end
    
    
