function x = stableinv( p, theta, param ) 

%STABLEINV      Inverse of stablecdf
%
% X = STABLEINV( P, THETA, PARAM )
%
%   Inputs:
%      P     = matrix of points at which to evaluate inverse
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      X     = matrix of quantiles
%
%   See also stablecdf, stableqkinv.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 

% Call mex function
[ x, ierr ] = stablemex( 3, p, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stableinv' )
