function x = solve(this, f, Df, DDf, x0)
  this.setup(f,Df,DDf);
  this.flag = false;
  x = x0;
  for ith = 1:this.max_iter
    fx   = feval(this.fun  ,x0);
    Dfx  = feval(this.Dfun ,x0);
    DDfx = feval(this.DDfun,x0);
    top = 2*fx*Dfx;
    bot = 2*Dfx^2-fx*DDfx;
    if bot == 0
      fprintf("Found 2*f'(x)^2-f(x)*f''(x) = 0\n")
      this.flag = false;
      break
    end
    % perform halley step

    x = x0 - top/bot;    
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