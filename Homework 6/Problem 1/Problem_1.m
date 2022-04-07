% Homework 6 Problem 1 Raiid Ahmed

clc
clear

%Allocate vector function and parameters

funct = @(t,y) [y(2); cos(3*t) - sin(y(1))];
tspan = [0 40];
y0 = [0,1];
h = .4;

%Calculate solutions using heun and rk4

[t1,y1] = heun(funct,tspan,y0,h);
[t2,y2] = rk4(funct,tspan,y0,h);

%Allocate parameters for rk45

tol = 1e-3;
hmin = .4;
hmax = 2;

%Calculate solutions using rk45

[t3,y3,h] = rk45(funct,tspan,y0,tol,hmax,hmin);

%Plotting solutions

figure
hold on
   plot(t2,y2(1,:))
   plot(t1,y1(1,:),'--')
   plot(t3,y3(1,:),':')
        title('Position')
        xlabel('t')
        ylabel('position')
        legend('rk4','heun','rk45')

figure
hold on
    plot(t2,y2(2,:))
    plot(t1,y1(2,:),'--')
    plot(t3,y3(2,:),':')
        title('Velocity')
        xlabel('t')
        ylabel('velocity')
        legend('rk4','heun','rk45')

 


