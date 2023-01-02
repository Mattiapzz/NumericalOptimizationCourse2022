%% main_check_order.m 05-12-2022
% ----------------------------------------
%% Clear env
clc;
clear;
close all;
% ----------------------------------------
%% Core
fun   = @(x) (x-1).*(cos(x)+1+exp(-x));
Dfun  = @(x) exp(-x)*(2 + exp(x) - x) + cos(x) - (-1 + x)* sin(x);
DDfun = @(x) -3 * exp(-x) + exp(-x)* x + cos(x) - x * cos(x) - 2 * sin(x);
x0  = -1;
x1  = -1.1;
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
%
% Halley method
fprintf("\n")
fprintf("Class Halley Solver\n")
SS = SecantClass(tol,max_iter,verbose);
xS=SS.solve(fun,x0,x1);
%
xh = NS.get_history();
sol = 1;
err = abs(xh-sol);
p = log( err(3:end)./err(2:end-1)) ./ log( err(2:end-1)./err(1:end-2));
p
%
xh = HS.get_history();
sol = 1;
err = abs(xh-sol);
p = log( err(3:end)./err(2:end-1)) ./ log( err(2:end-1)./err(1:end-2));
p
%
xh = SS.get_history();
sol = 1;
err = abs(xh-sol);
p = log( err(3:end)./err(2:end-1)) ./ log( err(2:end-1)./err(1:end-2));
p
% ----------------------------------------
% eof