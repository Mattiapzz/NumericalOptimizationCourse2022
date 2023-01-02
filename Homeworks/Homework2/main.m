FS  = FibonacciSearch();

TESTS = {
  {  0.5, 1.0, @(x) exp(x)+1./x                 }, ...
  {  0.5, 2.0, @(x) 5./x+x.*x                   }, ...
  {  0.8, 2.0, @(x) -5./(x.*(x-2)+5)            }, ...
  {  0.0, 1.5, @(x) exp(-2*x)+x.*x./2           }, ...
  {  0.0, 1.5, @(x) exp(x-1)+1./x               }, ...
  {  0.0, 1.0, @(x) x.*(x-exp(-x))              }, ...
  {  0.0, 2.5, @(x) 5*x.*x+1./x                 }, ...
  { -3.0, 0.0, @(x) exp(-x)+1./(1-x)            }, ...
  {  0.0, 2.0, @(x) 2+x.*(x-1)                  }, ...
  {  0.0, 3.0, @(x) -x.*exp(-0.5*x)             }, ...
  {  0.0, 3.0, @(x) -(0.2*x+sin(2*x))           }, ...
  {  0.0, 0.5, @(x) (exp(-x)-1./x)              }, ...
  { -1.0, 0.0, @(x) exp(x)+x.*x                 }, ...
  { -1.0, 0.0, @(x) x.*(4+x.*(2+x.*x))          }, ...
  { -1.0, 0.0, @(x) x.*x+sin(x)                 }, ...
  { -1.0, 1.0, @(x) exp(x)+1./(x+2)             }, ...
  { -2.0, 0.0, @(x) 2./(x.*x)                   }, ...
  {  2.0, 6.0, @(x) -5*x*x*exp(-0.5*x)          }, ...
  {  4.0, 9.0, @(x) -(0.1*x+cos(x))             }, ...
  {  4.0, 9.0, @(x) x.*x-cos(1.5*x)./sin(1.5*x) }
};

for kkk=1:16%length(TESTS)
  a   = TESTS{kkk}{1};
  b   = TESTS{kkk}{2};
  fun = TESTS{kkk}{3};
  x   = a:0.001:b;
  y   = fun(x);
  y0  = 0;
  dy  = -0.1;
  subplot(4,4,kkk);
  plot( x, y, '-r' );
  [aa,bb] = FS.minimize( fun, a, b );
  y0 = min(fun(aa),fun(bb))+3*dy;
  FS.plot( y0, dy );
end


