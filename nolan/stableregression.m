function fit = stableregression( x, y, trimprob, symmetric, param )

%STABLEREGRESSION   computes coefficients for the linear regression problem
%                     y(i) = theta(1)*x(i,1) + theta(2)*x(i,2) + ... + theta(k)*x(i,k) + e(i),
%                   where the error term e(i) has a stable distribution, i=1,...,n
%
% FIT = STABLEREGRESSION( X, Y, TRIMPROB, SYMMETRIC, PARAM )
%
%   Inputs:
%      X         = (n x k) matrix of known data points
%      Y         = vector of length k of observed y values 
%      TRIMPROB  = upper and lower fraction of data trimmed in initial OLS regression
%                  (defaults to [0.1 0.9])
%      SYMMETRIC = boolean to tell the algorithm to restrict to symmetric
%                  error case or not: SYMMETRIC=1 means force symmetric (beta=0), 
%                  SYMMETRIC=0 means allow asymmetry.  (defaults to 0)
%      PARAM     = parameterization to use. (defaults to 2-parameterization;
%                  this is to make the regression line go through them mode - 
%                  see the user manual for more information)
%
%   Outputs:
%      FIT      = structure with the following fields
%                   theta       Coefficients from stable regression using maximum likelihood (vector of length k)
%                   theta_ols   Coefficients from ordinary least squares (vector of length k)
%                   theta_trim  Coefficients from trimmed ordinary least squares (vector of length k)
%                   psi         Stable parameters [alpha beta gamma]
%                   param       Parameterization used
%                   symmetric   force symmetry/allow asymmetry
%
%   Note: To get a constant term in the regression, you must explicitly set
%   a column of X to be ones.  

if nargin < 1
    error( 'x argument is undefined' );
end
if nargin < 2
    error( 'y argument is undefined' );
end
if nargin < 3
    trimprob = [ 0.1 0.9];
end
if nargin < 4
    symmetric = 0;
end
if nargin < 5
    param = 2;
end

[n k] = size(x);
if length(y) ~= n
   error( 'the number of rows of x must equal the length of y' );
end

% Call mex function
[ out, ierr ] = stablemex( 212, x, y, trimprob, symmetric, param );

if length(out) ~= (3*k+5) 
   error( 'output length is not correct' );
end

% fill in fit structure with output values, which are packed into
% the vector out, which is of length 3*k+5.
fit.theta = out(1:k);
fit.theta_ols = out((k+1):(2*k));
fit.theta_trim = out((2*k+1):(3*k));
fit.psi   = out((3*k+1):(3*k+4));
fit.param = param;
fit.symmetric = symmetric;

% Check for errors or report warnings
stablechkerror( ierr, 'stableregression' )
