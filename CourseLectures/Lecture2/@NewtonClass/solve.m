function x = solve(this, f, Df, x0)
  this.setup(f,Df);
  this.flag = false;
  x = x0;
  this.x_history = x0;
  for ith = 1:this.max_iter
    fx  = feval(this.fun ,x0);
    % check convergence
    if abs(fx) <= this.tol
      if this.verbose == 'iter'
        fprintf("Convergence reached at iter %2d. x = %+1.4e\n",ith,x0)
      end
      this.flag = true;
      break
    end
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
    x0 = x;
    this.x_history = [this.x_history,x];
  end
  this.iter = ith;
  this.x_last = x;
end