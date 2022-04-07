%Raiid Ahmed Homework 7 Problem 4

clc
clear
format long

%Allocate table 1

y = [1,1.284,1.6487,2.1170,2.7183];
x = [0,.25,.50,.75,1.00];

%2nd degree polynomial

n = 2;

%Solve polynomial

[coeff,r2,r] = polyfit(x,y,n);
yp = polyval(coeff,x);

%Report coefficients and values

disp("The a2 through a0 coefficients are: ")
disp(coeff)
disp("The coefficient of determination r^2 is: " + r2)
disp("The coefficient of correlation r is: " + r)

%Plot results

figure
hold on
    plot(x,y)
    plot(x,yp)
        title('Table 1 vs Polyfit')
        xlabel('xi')
        ylabel('yi')
        legend('Table 1','Polyfit')
        
        
