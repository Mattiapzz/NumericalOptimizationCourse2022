%
% Function "newton_solver"
% Implementation of a Newton method solver.
% Input arguments:
% - fun      = "pointer" to a function f(x)
% - Dfun     = "pointed to the derivative of the function f'(x)
% - x0       = starting point 
% - tol      = tolerance stopping criteria |f(x)|<= tol -> stop
% - max_iter = maximum number of iterations (avoid infinite loop)
% - verbose  = 'none'  -> no message
%              'iter'  -> print a message at each iteration
%              'final' -> only final residual
% Output values
% - x    = the computed iteration
% - iter = number of iteration done
% - flag = true  -> converged
%          false -> not converged (NaN, max_iter,etc.)

function [x, iter, flag] = newton_solver(fun,Dfun,x0, tol, max_iter, verbose)
  for iter = 1:max_iter
    fx  = feval( fun,x0);
    Dfx = feval(Dfun,x0);
    if Dfx == 0
      fprintf("Found Dfx = 0\n")
      flag = false;
      return
    end
    % perform newton step
    x = x0 - fx/Dfx;
    if verbose == 'iter'
      fprintf("Iter %2d residual | fx = %1.4e | x = %1.4e \n",iter,fx, x)
    end
    % check convergence
    if abs(fx) <= tol
      if verbose == 'iter'
        fprintf("Convergence reached at iter %2d\n",iter)
      end
      flag = true;
      return
    end
    x0 = x;
  end
end