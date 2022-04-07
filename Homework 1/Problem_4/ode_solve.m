% Raiid Ahmed Homework 1 Problem 4 ode_solve
%
% ode_solve(odes, init, time, tdelt)
% 
% ode_solve outputs values for a set of ordinary differential equations using
% Euler's method of approximating solutions. This function is tailored to a set
% of ordinary differential equations representing the behavior of a variable
% (in this case population) over time.
% 
% Inputs:
% 
% odes: A matrix of anonymous functions representing ordinary differential equations
% init: A vector containing initial conditions for the equation in odes
% time: The maximum value for the time range that is desired
% tdelt: The desired time step for each iteration (will be set to .1 if no step is specified)
% 
% Outputs:
% 
% output: A matrix containing the solutions of the equations in odes approximated using euler's method
% at every time step from 1 to the value specified in the time parameter.
% executionTime: the time in seconds that it took to compute the solutions to the 
% equations in odes.

function [output, executionTime] = ode_solve(odes, init, time, tdelt)

    if isempty(tdelt) == 1  %Setting time step to .1 if an empty value is passed
        tdelt = .1;
    end
    
    t = 1:tdelt:time;   %Allocate t with values from 1 to time with the specified time step
    output = zeros(length(t), length(odes(init)));  %Pre allocate the output matrix
    output(1,:) = init; %Store the initial condition vector in the output matrix
    
    tic     %Start timer
    for i = 1:(length(t) - 1) %Iterate for loop for each position in time. Subtracted 1 from the length to allow for proper indexing
        output(i + 1,:) = output(i,:) + odes(output(i,:)) * tdelt;  %Compute solution using eulers method
    end
    executionTime = toc;    %Stop timer
end
    
 
    
        