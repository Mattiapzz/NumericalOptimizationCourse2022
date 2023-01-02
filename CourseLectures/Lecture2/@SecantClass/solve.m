function x = solve(this, f, x0, x1)
  this.setup(f);
  this.flag = false;
  this.x_history = [x0,x1];
  for ith = 1:this.max_iter
    fx0 = feval(this.fun ,x0);
    fx1 = feval(this.fun ,x1);
    % check convergence
    if abs(fx0) <= this.tol
      if this.verbose == 'iter'
        fprintf("Convergence reached at iter %2d. x = %+1.4e\n",ith,x0)
      end
      this.flag = true;
      x = x0;
      break
    end
    if abs(fx1) <= this.tol
      if this.verbose == 'iter'
        fprintf("Convergence reached at iter %2d. x = %+1.4e\n",ith,x1)
      end
      this.flag = true;
      x = x1;
      break
    end
    if (x1 - x0) == 0
      fprintf("Found delta x = 0\n")
      this.flag = false;
      break
    end
    Df = (fx1-fx0)/(x1-x0);
    if Df == 0
      fprintf("Found Dfx = 0\n")
      this.flag = false;
      break
    end
    % perform newton step
    x = x1 - fx1/Df;
    if this.verbose == 'iter'
      fprintf("Iter %2d | residual fx = %+1.4e | x = %+1.4e \n",ith,fx1, x1)
    end
    x0 = x1;
    x1 = x;
    this.x_history = [this.x_history,x];
  end
  this.iter = ith;
  this.x_last = x;
end