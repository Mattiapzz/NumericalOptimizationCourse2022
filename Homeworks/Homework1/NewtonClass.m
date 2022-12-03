%
% Class "NewtonClass"
% Implementation of a Newton method solver.

classdef NewtonClass < handle
  % ------------------------------------
  properties
    fun
    Dfun
    tol
    max_iter
    verbose
    iter
    flag
    x_last
  end
  % ------------------------------------
  methods
    % ------------------------------------
    % Constructor
    % obj = NewtonClass()
    % obj = NewtonClass(tol)  
    % obj = NewtonClass(tol,max_iter)
    % obj = NewtonClass(yo, max_iter,verbose) 
    function this = NewtonClass(varargin)
      % default values
      this.tol      = 10^-18;
      this.max_iter = 100;
      this.verbose  = 'iter';
      if nargin > 0
        this.tol      = varargin{1};
      end
      if nargin > 1
        this.max_iter = varargin{2};
      end
      if nargin > 2
        this.verbose  = varargin{3};
      end
    end
    % ------------------------------------
    function set_tolerance(this, new_tol)
      this.tol = new_tol;
    end
    %
    function set_max_iter(this, new_max_iter)
      this.max_iter = new_max_iter;
    end
    %
    function set_verbose(this, new_verbose)
      this.verbose = new_verbose;
    end
    %
    function setup(this, f, Df)
      this.fun  = f;
      this.Dfun = Df;
    end
    %
    function iter = get_iter(this)
      iter = this.iter;
    end
    %
    function x = solve(this, f, Df, x0)
      this.setup(f,Df);
      this.flag = false;
      x = x0;
      for ith = 1:this.max_iter
        fx  = feval(this.fun ,x0);
        Dfx = feval(this.Dfun,x0);
        if Dfx == 0
          fprintf("Found Dfx = 0\n")
          this.flag = false;
          break
        end
        % perform newton step
        x = x0 - fx/Dfx;
        if this.verbose == 'iter'
          fprintf("Iter %2d | residual fx = %+1.4e | x = %+1.4e \n",ith,fx, x)
        end
        % check convergence
        if abs(fx) <= this.tol
          if this.verbose == 'iter'
            fprintf("Convergence reached at iter %2d\n",ith)
          end
          this.flag = true;
          break
        end
        x0 = x;
      end
      this.iter = ith;
      this.x_last = x;
    end
  end
  % ------------------------------------
end
  
% function [x, iter, flag] = newton_solver(fun,Dfun,x0, tol, max_iter, verbose)
%   for iter = 1:max_iter
%     fx  = feval( fun,x0);
%     Dfx = feval(Dfun,x0);
%     if Dfx == 0
%       fprintf("Found Dfx = 0\n")
%       flag = false;
%       return
%     end
%     % perform newton step
%     x = x0 - fx/Dfx;
%     if verbose == 'iter'
%       fprintf("Iter %2d residual \t fx = %g \t x = %g \n",iter,fx, x)
%     end
%     % check convergence
%     if abs(fx) <= tol
%       if verbose == 'iter'
%         fprintf("Convergence reached at iter %2d\n",iter)
%       end
%       flag = true;
%       return
%     end
%     x0 = x;
%   end
% end