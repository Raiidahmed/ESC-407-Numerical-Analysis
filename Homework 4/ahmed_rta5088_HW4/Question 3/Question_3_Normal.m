%Raiid Ahmed Homework 4 Question 3 Normal Data

format long
clc
clear

load('projectile_data.csv')

projectile = projectile_data;
x = projectile(:,2).';
y = projectile(:,3).';
time = projectile(:,1).';

h = x(2) - x(1);

figure(1)
    plot(x,y)
        xlabel('x position')
        ylabel('y position')
        title('trajectory')

xdot = zeros(1,length(x));
xddot = zeros(1,length(x));
ydot = zeros(1,length(y));
yddot = zeros(1,length(y));

%forward difference

forward = @(x,i) (-1*x(i+2) + 4*x(i+1) - 3*x(i))/(2*h);
forwardd = @(x,i) (-1*x(i+3) + 4*x(i+2) - 5*x(i+1) + 2*x(i))/(h^2);

for i = 1:2
    xdot(i) = forward(x,i);
    ydot(i) = forward(y,i);
    xddot(i) = forwardd(x,i);
    yddot(i) = forwardd(y,i);
end

%center difference

center = @(x,i) (-1*x(i+2) + 8*x(i+1) - 8*x(i-1) + x(i-2))/(12*h);
centerd = @(x,i) (-1*x(i+2) + 16*x(i+1) - 30*x(i) + 16*x(i-1) - x(i-2))/(12*(h^2));

for i = 3:(length(x)-2)
    xdot(i) = center(x,i);
    ydot(i) = center(y,i);
    xddot(i) = centerd(x,i);
    yddot(i) = centerd(y,i);
end

backward = @(x,i) (3*x(i) - 4*x(i-1) + x(i-2))/(2*h);
backwardd = @(x,i) (2*x(i) - 5*x(i-1) + 4*x(i-2) - x(i-3))/(h^2);

for i = (length(x)-1):(length(x))
    xdot(i) = backward(x,i);
    ydot(i) = backward(y,i);
    xddot(i) = backwardd(x,i);
    yddot(i) = backwardd(y,i);
end

disp("Mean of x acceleration: " + mean(xddot))
disp("Mean of y acceleration: " + mean(yddot))

figure(2)
    hold on
    plot(time,xdot)
    plot(time,ydot)
        xlabel('time')
        ylabel('velocity')
        title('velocity vs. time')
        legend('X','Y')
    hold off
    
figure(3)
    hold on
    plot(time,xddot)
    plot(time,yddot)
        xlabel('time')
        ylabel('acceleration')
        title('acceleration vs. time')
        legend('X','Y')
    hold off





