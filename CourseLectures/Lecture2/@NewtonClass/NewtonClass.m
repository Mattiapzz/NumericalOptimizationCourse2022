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
    x_history
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
    function iter = get_history(this)
      iter = this.x_history;
    end
    %
    x = solve(this, f, Df, x0)
  end
  % ------------------------------------
end
  