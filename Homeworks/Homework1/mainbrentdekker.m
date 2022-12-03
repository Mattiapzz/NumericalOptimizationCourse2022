%% mainbrentdekker.m 03-12-2022
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
% Plot
x_space = linspace(-2,5,100);
figure()
hold on
grid on
plot(x_space,fun(x_space))
% Initial values
x0  = 4;
verbose = 'iter';
max_iter = 100;
tol = 10^-10;
a = 0.01;
b = 5;
% Class method
fprintf("\n")
fprintf("Class Newton Solver\n")
NS = NewtonClass(tol,max_iter,verbose);
xN = NS.solve(fun,Dfun,x0);
%
% Brent-Dekker method
fprintf("\n")
fprintf("Class brentdekker\n")
BD = brentdekker(tol,max_iter,verbose);
xB = BD.solve(fun,a,b);
XB = BD.get_x_iter();
plot(XB,fun(XB),'ro','MarkerSize',6 )
% ----------------------------------------
% eof