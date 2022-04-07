%Raiid Ahmed Homework 7 Problem 3

clc
clear
format short

%Define symbolic variables

syms Ax Ay Ab Ac Cb Bd Cd Ce Ed Df Dg Eg Gf Fh Gh Hy

%Define correct order for reported values

vars = [Ax, Ay, Ab, Ac, Cb, Bd, Cd, Ce, Ed, Df, Dg, Eg, Gf, Fh, Gh, Hy];

%Allocate symbolic equations from truss
%Calculations shown in pdf

eqns = [Ax + Ac*cosd(30) + Ab == -300
        Ay + Ac*sind(30) == 1500
        -Ac*cosd(30) + Cd*cosd(30) + Ce*cosd(30) == -500
        -Ac*sind(30) - Cb - Cd*sind(30) + Ce*sind(30) == 3000
        -Ab + Bd == 0
        Cb == 2000
        -Ce*cosd(30) + Eg*cosd(30) == -300
        -Ed - Eg*sind(30) - Ce*sind(30) == 3000
        -Bd - Cd*cosd(30) + Dg*cosd(30) + Df == 0
        Cd*sind(30) + Ed + Dg*sind(30) == 1500
        -Eg*cosd(30) - Dg*cosd(30) + Gh*cosd(30) == 0
        Eg*sind(30) - Dg*sind(30) - Gf - Gh*sind(30) == 4000
        -Df + Fh == 0
        Gf == 1000
        -Fh - Gh*cosd(30) == 0
        Hy + Gh*sind(30) == 2000];
    
%Convert symbolic equations to a matrix of coefficients
    
[A,b] = equationsToMatrix(eqns,vars);

%Make sure matrices are matrices of doubles

A = double(A);
b = double(b);

%Plot sparsity pattern

spy(A);

%Calculate loads with gaussepp and Matlab's solver

Loads_Gauss = gaussepp(A,b);
Report_Loads_Gauss = arrayfun(@char, vars.', 'uniform', 0);
Report_Loads_Gauss = table(Loads_Gauss, 'VariableNames', {'Loads'}, 'RowNames', Report_Loads_Gauss);
Loads_Matlab = A\b;

%Display all loads 

disp("Loads as solved with Gaussepp:")
disp(Report_Loads_Gauss)

%Find Elucidean norm of difference between gauss and matlab solutions

diff_loads = Loads_Gauss - Loads_Matlab;
Elucid_norm_Loads = sqrt(sum(diff_loads.^2));
disp("Elucidean norm of difference between Matlab and Gaussepp solvers:")
disp(Elucid_norm_Loads)

%Calculate inverse and loads with inverse

Ainv = gaussepp(A,eye(16));
Loads_Ainv = Ainv*b;
Report_Loads_Ainv = arrayfun(@char, vars.', 'uniform', 0);
Report_Loads_Ainv = table(Loads_Ainv, 'VariableNames', {'Loads'}, 'RowNames', Report_Loads_Ainv);
disp("Loads as solved with the inverse:")
disp(Report_Loads_Ainv)

%Find Elucidean norm of difference between gauss and inverse solutions

diff_inv = Loads_Gauss - Loads_Ainv;
disp("Elucidean norm of difference between Matlab and inverse solvers:")
Elucid_norm_inv = sqrt(sum(diff_inv.^2));
disp(Elucid_norm_inv)










                            