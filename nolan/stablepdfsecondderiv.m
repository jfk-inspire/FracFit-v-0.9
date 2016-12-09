function f = stablepdfsecondderiv( x, theta, param ) 

%STABLEPDFSECONDDERIV      Second derivative of the density of a stable distribution
%
% F = STABLEPDFSECONDDERIV( X, THETA, PARAM ) 
%
%   Inputs:
%      X     = matrix of points at which to evaluate second derivative of the density
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%   Outputs:
%      F     = matrix of f'(x) values
%
%   See also stablepdf, stableqkpdf, stablecdf, stablepdfdiscrete, stablepdfderiv.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 

% Call mex function
[ f, ierr ] = stablemex( 17, x, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablepdfsecondderiv' )

