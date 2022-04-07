% Raiid Ahmed Homework 1 Problem 4 ode_run
%
% Write a Matlab function called ode_solve that implements Euler’s method of solving ordinary
% differential equations. It should take as input arguments the anonymous function odes
% containing the differential equations, a vector containing the initial conditions on the dependent
% variables, the number of days for which you want the solution, and the step size Δ𝑡 . If
% Δ𝑡 is not specified, it should use 0.1 days as the default. The output arguments should be the
% vector containing the solution 𝑣 at every time step and the execution time for the solution.
% Make sure that your function has comments at the top of your function so that it is well documented
% for future use and so that Matlab’s help command will provide useful information
% (see https://bit.ly/2MmTWTh). Use preallocation of vectors and arrays where you can.
% Write a Matlab script called ode_run that solves the differential equations using Δ𝑡 = 1,
% 𝑁 = 1,000,000, 𝜏 = 5, 𝜀 = 10, 𝛼 = 0.05, and 𝜇 = 12. Use 𝑁𝑖 = 50 for the number of people initially
% infected. Vary 𝑅o from 2 to 10 in steps of 2 to see how the infectiousness of the disease affects
% how it plays out. You will need to vary the number of days that you solve the equations to see
% this. This will require a small amount of trial and error. For each of the five solutions, plot all
% five dependent variables versus time and comment (as comments in your the
% code) on how 𝑅o affects the dynamics of the disease. Your script should contain all five calls to ode_solve after
% you have refined the amount of time used for each solution. Each of your five plots should have
% a title, legend, and the axes should be labeled. You can increase the font size on Matlab plots
% using the command figure(’DefaultAxesFontSize’,14), where 14 is the font size in points.

clear   %clear workspace for testing
    
tdelt = 1;        %Desired time step 
N = 1000000;      %Population to be analyzed
Ni = 50;          %Initial population that is infected
time = 300;       %Maximum value for the time range

tau = 5;           %days from exposed to infected
epsilon = 10;      %days with the disease until recovery 
alpha = .05;       %probability of death
mu = 12;           %days to die

gamma = 1/epsilon;  %Rate of recovery
delta = 1/tau;      %Rate of exposed to infectious
rho = 1/mu;         %Rate of death

init = [((N-Ni)/N) 0 (Ni/N) 0 0];  %Initial populations for each population category

sol = zeros(time, 5); %Pre allocate matrix to hold solutions

for index = 1:5  %Iterate through 5 different reproduction numbers
    
    Ro = index * 2;     %Basic reproduction number
    beta = Ro/epsilon;  %Number of people a person infects in a day

    sdelt = @(input_matrix) (-beta * input_matrix(1,3) * input_matrix(1,1));                                                           %Equation to find the population that is susceptible to the disease
    edelt = @(input_matrix) (beta * input_matrix(1,3) * input_matrix(1,1) - delta * input_matrix(1,2));                                %Equation to find the population that is exposed
    idelt = @(input_matrix) (delta * input_matrix(1,2) - gamma * (1 - alpha) * input_matrix(1,3) - alpha * rho * input_matrix(1,3));   %Equation to find the population that is infected
    rdelt = @(input_matrix) (gamma * (1 - alpha) * input_matrix(1,3));                                                                 %Equation to find the population that has recovered
    ddelt = @(input_matrix) (alpha * rho * input_matrix(1,3));                                                                         %Equation to find the population that has died
 
    odes = @(input_matrix) [sdelt(input_matrix), edelt(input_matrix), idelt(input_matrix), rdelt(input_matrix), ddelt(input_matrix)];  %Organizing the differential equations into a single anonymous function that can be passed to ode_solve

    [sol, executionTime] = ode_solve(odes, init, time, tdelt);  %Solve the differential equations with ode_solve, that returns approximations for each time step using eulers method
    
    subplot(5,1,index)               
        plot(1:tdelt:time, sol)   %Plot solutions at every time step for every possible basic reproduction number
            title(strcat('Disease Progression vs Time using R=', string(Ro)));
            legend('Susceptible', 'exposed', 'infected', 'recovered', 'dead')
            xlabel('Elapsed Time (Days)')
            ylabel('Fraction of the Population')
           
    disp(strcat(string(executionTime),' seconds'));   %Display execution times for each run of ode_solve
end
















