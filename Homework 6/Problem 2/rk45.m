%Homework 6 Problem 1 Raiid Ahmed

function [t, y, h] = rk45(f,tspan,y0,tol,hmax,hmin)

    a = tspan(1);
    b = tspan(2);
    t(1) = a;
    y(:,1) = y0;
    h(1) = hmax;
    flag = 1;
    i = 1;
    
    while flag == 1
        k1 = h(i)*f(t(i),y(:,i));
        k2 = h(i)*f(t(i) + (1/4)*h(i),y(:,i) + (1/4)*k1);
        k3 = h(i)*f(t(i) + (3/8)*h(i),y(:,i) + (3/32)*k1 + (9/32)*k2);
        k4 = h(i)*f(t(i) + (12/13)*h(i),y(:,i) + (1932/2197)*k1 - (7200/2197)*k2 + (7296/2197)*k3);
        k5 = h(i)*f(t(i) + h(i),y(:,i) + (439/216)*k1 - 8*k2 + (3680/513)*k3 - (845/4104)*k4);
        k6 = h(i)*f(t(i) + (1/2)*h(i),y(:,i) - (8/27)*k1 + 2*k2 - (3544/2565)*k3 + (1859/4104)*k4 - (11/40)*k5);
        
        e = min((1/h(i))*abs((1/360)*k1 - (128/4275)*k3 - (2197/75240)*k4 + (1/50)*k5 + (2/55)*k6));
        
        if e <= tol
            i = i + 1;
            h(i) = h(i-1);
            t(i) = t(i-1) + h(i);
            y(:,i) = y(:,i-1) + (25/216)*k1 + (1408/2565)*k3 + (2197/4104)*k4 - (1/5)*k5;
        end
        
        d = .84*(tol/e)^.25;
        
        if d <= .1
            h(i) = .1*h(i);
        elseif d >= 4
            h(i) = 4*h(i);
        else
            h(i) = d*h(i);
        end
        
        if h(i) > hmax
            h(i) = hmax;
        end
        
        if t(i) >= b
            flag = 0;
        elseif t(i) + h(i) > b
            h(i) = b - t(i);
        elseif h(i) < hmin
            flag = 0;
            disp('min h exceeded')
        end
    end
end
        