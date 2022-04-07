%Homework 6 Problem 1 Raiid Ahmed

function [t, y] = rk4(f,tspan,y0,h)
    
    t = tspan(1):h:tspan(2);
    y = zeros(length(y0),length(t));
    
    y(:,1) = y0;
    
    for i = 1:(length(t)-1)
        k1 = f(t(i),y(:,i));
        k2 = f(t(i) + h/2, y(:,i) + (h/2)*k1);
        k3 = f(t(i) + h/2, y(:,i) + (h/2)*k2);
        k4 = f(t(i) + h, y(:,i) + h*k3);
        
        y(:,i+1) = y(:,i)+(k1 + 2*k2 + 2*k3 + k4)*(h/6);
    end
end
    
    
