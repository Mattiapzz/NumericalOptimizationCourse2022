classdef  FibonacciSearch < handle

properties (SetAccess = private, Hidden = true)
  tau      % golden section ratio 
  tol      % tolerance for |b-a|
  max_iter % maximum number of admitted iterate for FibonacciSearch
  history  % 2xn matrix with the hystory of the computed intervals
end

methods
  %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  %
  % Construcot method called when object is instantiated
  %
  % GS = FibonacciSearch();
  %
  function self = FibonacciSearch()
    self.tau      = 1;
    self.tol      = 1e-4;
    self.max_iter = 8;
    self.history  = [];
  end
  %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  plot( self, y0, dy );
  %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  set_max_iteration( self, max_iter );
  %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  set_tolerance( self, tol )
  %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  [a,b] = minimize( self, fun, a_in, b_in );
  %- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
end
  
end