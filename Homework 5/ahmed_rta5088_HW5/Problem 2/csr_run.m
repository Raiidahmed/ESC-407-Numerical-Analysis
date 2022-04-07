%Raiid Ahmed HW5 Problem 2

format long
clc
clear

%allocate data for example calculation

funct = @(x) sin(x);
a = 0;
b = pi;
n = 10;

%integrate sin(x) with csr

integ = csr(funct,a,b,n);
disp('Integrating sin(x) with csr:')
disp("integral approximation is " + integ)

%allocate and integrate function with csr

funct = @(x) (x.^4).*exp(-x).*(cos(x).^2).*sin(x);
a = 0;
b = 2*pi;
n = 2;
rel_err = inf;
integold = csr(funct,a,b,n);

while rel_err > 1e-9
    n = n + 2;
    integ = csr(funct,a,b,n);
    rel_err = abs((integ - integold)/integ);
    integold = integ;
end

%calculate true integral and relative error

trueinteg = integral(funct,a,b);
true_rel_err = (integ - trueinteg)/trueinteg;

%display data

disp(' ')
disp('Integrating (x.^4).*exp(-x).*(cos(x).^2).*sin(x) with csr:')
disp("number of subintervals required is " + n)
disp("estimate of the integral " + integ)
disp("approximate relative error " + rel_err)
disp("true relative error is " + true_rel_err)

%allocate and integrate function with trap at 246 intervals

step = (b-a)/n;
x = a:step:b;
y = funct(x);

trapinteg = trap(x(2:length(x)),y(2:length(y)),y(1));
trapinteg = trapinteg(length(trapinteg));
trap_true_err = abs((trapinteg - trueinteg)/trueinteg);

%display results

disp(' ')
disp('Integrating (x.^4).*exp(-x).*(cos(x).^2).*sin(x) with trap and 246 intervals:')
disp("trap estimate of the integral with " + n + " intervals is")
disp(trapinteg)
disp("true relative error is " + trap_true_err);

%allocate and integrate function with trap

rel_err = inf;
n = 1;
trapintegold = trap(x(2:length(x)),y(2:length(y)),y(1));
trapintegold = trapintegold(length(trapintegold));

while rel_err > 1e-9
    n = n + 1;
    step = (b-a)/n;
    x = a:step:b;
    y = funct(x);
    trapinteg = trap(x(2:length(x)),y(2:length(y)),y(1));
    trapinteg = trapinteg(length(trapinteg));
    rel_err = abs((trapinteg - trapintegold)/trapinteg);
    trapintegold = trapinteg;
end

true_rel_err = abs((trapinteg - trueinteg)/trueinteg);

%display results

disp(' ')
disp('Integrating (x.^4).*exp(-x).*(cos(x).^2).*sin(x) with trap:')
disp("number of subintervals required is " + n)
disp("estimate of the integral is " + trapinteg)
disp("approximate relative error is " + rel_err)
disp("true relative error is " + true_rel_err)







