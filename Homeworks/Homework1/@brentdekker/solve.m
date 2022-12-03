function x0 = solve(this, f, a, b)
  this.setup(f);
  this.flag = false;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%
  x1 = a;
  f1 = feval(this.fun, x1);
  if f1 == 0
    x0 = x1;
    this.flag = true;
    fprintf("Brent-Dekker: Root at borders [a, b].")
    return
  end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%
  x2 = b;
  f2 = feval(this.fun, x2);
  if f2 == 0
    x0 = x2;
    this.flag = true;
    fprintf("Brent-Dekker: Root at borders [a, b].")
    return
  end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%
  if (f1*f2 > 0.0)
    fprintf("Brent-Dekker: Root is not bracketed in [a, b].")
    x0 = NaN;
    return 
  end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%
  x3 = (x1 + x2) / 2.0;
  for ith = 1:this.max_iter
    f3 = feval(this.fun, x3);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    if abs(f3) < this.tol
      x0 = x3;
      if this.verbose == 'iter'
        fprintf("Convergence reached at iter %2d\n",ith)
      end
      this.flag = true;
      break
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    if f1*f3 < 0.0
      b = x3;
    else
      a = x3;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    if ( (b-a) < this.tol * max(abs(b), 1.0) ) 
	    x0 = (x1 + x2) / 2.0; 
      if this.verbose == 'iter'
        fprintf("Convergence reached at iter %2d\n",ith)
      end
      this.flag = true;
	    break
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    denom = (f2 - f1)*(f3 - f1)*(f2 - f3);
		numer = x3*(f1 - f2)*(f2 - f3 + f1) + f2*x1*(f2 - f3) + f1*x2*(f3 - f1);
	  if (denom == 0)
			dx = b - a;
    else
			dx = f3*numer/denom;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    x = x3 + dx;
    if ((b - x)*(x - a) < 0.0)
			dx = 0.5*(b - a);
			x  = a + dx;
    end
    if this.verbose == 'iter'
      fprintf("Iter %2d | residual fx = %+1.4e | x = %+1.4e \n",ith,feval(this.fun, x), x)
    end
    this.x_iter = [this.x_iter,x];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
	  if (x1 < x3)
			x2 = x3; 
      f2 = f3;
		else
			x1 = x3; 
      f1 = f3;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
	  if (abs(x - x3) < this.tol)
	    x0 = x;
      if this.verbose == 'iter'
        fprintf("Convergence reached at iter %2d\n",ith)
      end
      this.flag = true;
	    break
    end
    x3 = x;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
  end
  this.iter = ith;
  this.x_last = x0;
end
