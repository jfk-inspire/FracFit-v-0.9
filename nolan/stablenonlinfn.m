function g = stablenonlinfn( x, theta, param ) 

%STABLENONLINFN     Nonlinear/score function of a stable distribution
%                   g(x)=-f'(x)/f(x)
%
% G = STABLENONLINFN( X, THETA, PARAM )
%
%   Inputs:
%      X     = matrix of points at which to evaluate nonlinear function
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      G     = matrix of function values
%
%   See also stableqknonlinfn, stablepdf.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 

% Call mex function
[ g, ierr ] = stablemex( 5, x, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablenonlinfn' )

