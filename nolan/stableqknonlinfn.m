function g = stableqknonlinfn( x, theta, method, param ) 

%STABLEQKNONLINFN     Nonlinear/score function of a stable distribution
%                   g(x)=-f'(x)/f(x)
%
% G = STABLEQKNONLINFN( X, THETA, METHOD, PARAM )
%
%   Inputs:
%      X     = matrix of points at which to evaluate nonlinear function
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      METHOD = method: 1, 2 or 3 (3 is fastest, but only works for
%               symmetric case beta=0)
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      G     = matrix of function values
%
%   See also stablenonlinfn.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
if nargin<3
  method = 1;
end
if nargin < 4
   param=0;
end

% Call mex function
[ g, ierr ] = stablemex( 15, x, theta, method, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stableqknonlinfn' )

