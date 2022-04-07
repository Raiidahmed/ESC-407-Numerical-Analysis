%Raiid Ahmed Homework 7 Problem 6

clc
clear

%Allocate data and variables

data = dlmread('raw_data.dat');

x = data(:,1);
y = data(:,2);

srprev = 0;
rel_err = inf;
order = 0;

%Iterate on order until relative error of sr < 1e-5

disp("Current order:")
while rel_err > 1e-5
    order = order + 1;
    [coeff,r2(order)] = polyfit(x,y,order);
    coeff_tot{order} = coeff;
    
    sr = sum((y - polyval(coeff,x)).^2);
    
    rel_err = abs((sr - srprev)/sr);
    
    srprev = sr;
    disp(order)
end

%Find output of polynomial

yp = polyval(coeff,x);

%Plot all solutions on the same graph

figure
    hold on
    scatter(x,y,.1,'k','.')
    for i = 1:order
        yp = polyval(coeff_tot{i},x);
        plot(x,yp)
    end
    title('data with all approximations')
    
%Report final values
    
disp("Final order used: " + order)
disp("Final relative error: " + rel_err)
disp("Final sr: " + sr)

%Plot r^2 vs n

figure
    plot(r2,1:order)
    title('r^2 vs n')
    xlabel('r^2')
    ylabel('n')
    
%Plot final solution
    
figure
    hold on 
    scatter(x,y,.1,'k','.')
    plot(x,yp)
    title('data with final approximation')









