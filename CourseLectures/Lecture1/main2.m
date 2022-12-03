%% main1.m 01-12-2022
% ----------------------------------------
%% Clear env
clc;
clear;
close all;
% ----------------------------------------
%% Core
fun   = @(x) x.*exp(-x.*x)+sin(x);
Dfun  = @(x) exp(-x.*x) -2*x^2.*exp(-x.*x) + cos(x);
DDfun = @(x) (4*x^3 - 6*x ).*exp(-x.*x) - sin(x);
x0  = -3;
verbose = 'iter';
max_iter = 100;
tol = 10^-10;
% Class method
fprintf("\n")
fprintf("Class Newton Solver\n")
NS = NewtonClass(tol,max_iter,verbose);
xN = NS.solve(fun,Dfun,x0);
% Halley method
fprintf("\n")
fprintf("Class Halley Solver\n")
HS = HalleyClass(tol,max_iter,verbose);
xH=HS.solve(fun,Dfun,DDfun,x0);
% Compare
fprintf("\n")
fprintf("Difference between Newton and Halley solvers:\n")
fprintf("|XN-XH| = %e\n",abs(xN-xH))
fprintf("|F(XN)-F(XH)| = %e\n",abs(fun(xN)-fun(xH)))

% ----------------------------------------
% eof