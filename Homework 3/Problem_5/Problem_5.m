% Raiid Ahmed Homework 3 Problem 5 Script
clc
clear

F = @(x) [((x(1)^2)/(186^2)) - ((x(2)^2)/((300^2) - (186^2))) - 1;
          (-1*(((x(1) - 300)^2)/((500^2) - (279^2)))) + (((x(2) - 500)^2)/(279^2)) - 1];
         
J = @(x) [((2*x(1))/(186^2)),((-2*x(2))/((300^2)-(186^2)));
          ((-2*(x(1) - 300))/((500^2) - (279^2))),((2*(x(2) - 500))/(279^2))];
    
x0 = [1;
      1];
  
disp('Root 1')
[a,b,c] = newton_sys(F,J,x0,10^(-8),20);
disp("Root Approx: " + num2str([a(1) a(2)]) + " Final Relative Error: " + num2str(b) + " Iterations to Convergence: " + num2str(c))

x0 = [10;
      10];

disp('Root 2')
[d,e,f] = newton_sys(F,J,x0,10^(-8),20);
disp("Root Approx: " + num2str([d(1) d(2)]) + " Final Relative Error: " + num2str(e) + " Iterations to Convergence: " + num2str(f))

x0 = [-20;
      -20];
  
disp('Root 3')
[g,h,i] = newton_sys(F,J,x0,10^(-8),20);
disp("Root Approx: " + num2str([g(1) g(2)]) + " Final Relative Error: " + num2str(h) + " Iterations to Convergence: " + num2str(i))

x0 = [-1000;
       1000];

disp('Root 4')
[j,k,l] = newton_sys(F,J,x0,10^(-8),20);
disp("Root Approx: " + num2str([j(1) j(2)]) + " Final Relative Error: " + num2str(k) + " Iterations to Convergence: " + num2str(l))


