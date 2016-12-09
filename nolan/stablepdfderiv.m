function f = stablepdfderiv( x, theta, param ) 

%STABLEPDFDERIV      Derivative of the density of a stable distribution
%
% F = STABLEPDFDERIV( X, THETA, PARAM ) 
%
%   Inputs:
%      X     = matrix of points at which to evaluate derivative of the density
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%   Outputs:
%      F     = matrix of f'(x) values
%
%   See also stablepdf, stableqkpdf, stablecdf, stablepdfdiscrete.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 

% Call mex function
[ f, ierr ] = stablemex( 16, x, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablepdfderiv' )

