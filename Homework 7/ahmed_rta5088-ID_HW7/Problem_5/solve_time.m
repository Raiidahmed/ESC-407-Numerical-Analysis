%Raiid Ahmed Homework 7 Problem 5

clc
clear

%Allocate size of matrix

runs = 500;

%Allocate vector to store times

time = zeros(1,runs);

%Allocate random numbers

A = rand(runs);
B = rand(runs,1);

%I'm not sure whether it is due to an error in my code
%or just a quirk of my computer, but I only seem to get time 
%vectors that satisfy the relative error requirement once in a while.
%Uncomment the following line and comment out lines 29 through 44 to see
%a working configuration.

% load('working_config.mat')

%Run solver and collect times

disp("Current N:")
for n = 1:runs
  
    a = A(1:n,1:n);
    b = B(1:n);
    
    tic
    gaussepp(a,b);
    time(n) = toc;
    
    %Report when n becomes a multiple of 100
    
    if mod(n,100) == 0
        disp(n)
    end
end

%Plot n vs time

n = 1:runs;
figure
    hold on
    plot(n,time)
        title('n vs time')
        xlabel('size n')
        ylabel('time (s)')

%Fit polynomials until relative error of sr < 1e-5

srprev = 0;
rel_err = inf;
order = 1;

disp("Current order: ")
while rel_err > 1e-5
    coeff = polyfit(n,time,order);
    
    sr = sum((time - polyval(coeff,n)).^2);
    
    rel_err = abs((sr - srprev)/sr);
    rel_err_store(order) = rel_err;
    
    srprev = sr;
    disp(order)
    order = order+1;
end

%display results

if isnan(sr)
    disp('A relative error of less than 1e-5 was never reached.')
    [min,ordermin] = min(rel_err_store);
    disp("Minimum relative error: " + min)
    disp("Order at minimum relative error: " + ordermin)
    coeff = polyfit(n,time,ordermin);
else
    disp("Minimum relative error: " + rel_err)
    disp("Order at best approx: " + (order-1));
    coeff = polyfit(n,time,(order-1));
end
    

%plot final approximation on graph

plot(n,polyval(coeff,n))
    legend('actual values','best approximation')

%plot relative error for diagnostic

figure
plot(1:order-1,rel_err_store)
    title('order vs approx relative error')
        xlabel('order')
        ylabel('approx relative error')






    

    

