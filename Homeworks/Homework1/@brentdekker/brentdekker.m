%
% Class "brentdekker"
% Implementation of a brentdekker method solver.

classdef brentdekker < handle
  % ------------------------------------
  properties (Access = private, Hidden = true)
    fun
    tol
    max_iter
    verbose
    iter
    flag
    x_last
    x_iter = [];
  end
  % ------------------------------------
  methods
    % ------------------------------------
    % Constructor
    % obj = brentdekker()
    % obj = brentdekker(tol)  
    % obj = brentdekker(tol,max_iter)
    % obj = brentdekker(yo, max_iter,verbose) 
    function this = brentdekker(varargin)
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
    function setup(this, f)
      this.fun   = f;
    end
    %
    function iter = get_iter(this)
      iter = this.iter;
    end
    %
    function X = get_x_iter(this)
      X = this.x_iter;
    end
    %
    x = solve(this, f,a,b);
  end
  % ------------------------------------
end
  