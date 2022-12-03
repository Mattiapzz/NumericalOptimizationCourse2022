%% main1.m 01-12-2022
% ----------------------------------------
%% Clear env
clc;
clear;
close all;
% ----------------------------------------
%% Core
fun   = @(x) x.*exp(-x.*x)-sin(x);
Dfun  = @(x) exp(-x.*x) -2*x^2.*exp(-x.*x) - cos(x);
DDfun = @(x) (4*x^3 - 6*x ).*exp(-x.*x) - sin(x);
x0  = 1;
verbose = 'iter';
max_iter = 100;
tol = 10^-16;
% Function method
fprintf("Function Newton Solver\n")
[x1, iter, flag] = newton_solver(fun,Dfun,x0, tol, max_iter, verbose);
% Class method
fprintf("\n")
fprintf("Class Newton Solver\n")
NS = NewtonClass();
x2 = NS.solve(fun,Dfun,x0);
% Compare
fprintf("\n")
fprintf("Difference between Newton solvers:\n")
fprintf("|X_fun-X_class| = %e\n",abs(x1-x2))
fprintf("|F(X_fun)-F(X_class)| = %e\n",abs(fun(x1)-fun(x2)))
% Halley method
fprintf("\n")
fprintf("Class Halley Solver\n")
HS = HalleyClass();
x3=HS.solve(fun,Dfun,DDfun,x0);
% Compare
fprintf("\n")
fprintf("Difference between Newton and Halley solvers:\n")
fprintf("|X_fun-X_class| = %e\n",abs(x2-x3))
fprintf("|F(X_fun)-F(X_class)| = %e\n",abs(fun(x2)-fun(x3)))

% ----------------------------------------
% eof