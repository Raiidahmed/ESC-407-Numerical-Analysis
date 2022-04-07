% Raiid Ahmed Homework 1 Problem 2 days_test
%
% Generate a sequence in the following manner. Start with any positive integer 𝑛. If 𝑛 is even,
% then divide it by two to generate the next term in the sequence, if 𝑛 is odd, then generate the
% next term using 3𝑛 + 1. Keep performing the same operations for each new term generated in
% the sequence. The German mathematician Lothar Collatz conjectured in 1937 that the sequence
% will always reach 1. I want you to write a script that proves that the Collatz conjecture is true
% for every integer up to and including 𝑛 = 5000000.*
% Your script should
%
% • use Matlab’s tic and toc functions to time how long it takes to do the main part of the
%   script (see https://bit.ly/2MydsLS),
% • store the final value of the sequence for each 𝑛,
% • store the number of steps in the sequence for each 𝑛,
% • store the starting integer for each 𝑛 that does not reach 1,
% • report if all sequences reach 1,
% • report all starting integers whose sequences do not reach 1.
%
% If you use a while loop, the script should check if a sequence becomes longer than 10,000 steps,
% and if it does, break out of the loop. Finally, your script should plot the number of steps in each
% sequence for each 𝑛. The plot should look like this
% Make sure you preallocate all arrays

n = 5000000;    %Maximum n term that we want to test
results = zeros(1,n);   %Pre allocation for the huge arays
resultsSteps = zeros(1,n); %Holding steps to get a result
resultsNot1 = zeros(1,n);  %Holding results that don't converge to one

steps = 0;   %Step counter
next = 0;    %Holds the next value in the sequence
maxSteps = 10000;  %Threshold before we break the loops

tic %Start timer
for i = 1:n
    steps = 0;   %Reset the step counter   
    next = i;    %Assign beginning term with the current n    
        while next ~= 1 && steps <= maxSteps
            if mod(next,2) == 0     %Sequence in writing
                next = next/2;   
            else
                next = 3 * next + 1;
            end
            steps = steps + 1;  %Iterate steps
        end
     if next ~= 1
         resultsNot1 = next;    %Add non one convergers to the list
     end
     results(i) = next;         %Add result term to the list
     resultsSteps(i) = steps;   %Add steps to the list
end
elapsed_time = toc; %stop timer

disp(elapsed_time); %display execution time
scatter(1:n, resultsSteps, '.')  %Display how steps varies with n terms
    title('N vs Steps to Convergence')
    xlabel('N')
    ylabel('Steps')

