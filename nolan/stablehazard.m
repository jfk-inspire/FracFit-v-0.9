function h = stablehazard( x, theta, param ) 

%STABLEHAZARD       Hazard function of a stable distribution
%                   h(x)=f(x)/(1-F(x))
%
% H = STABLEHAZARD( X, THETA, PARAM )
%
%   Inputs:
%      X     = matrix of points at which to evaluate hazard function
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      H     = matrix of hazard function values
%
%   See also stablepdf, stablecdf, stableqkhazard.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 

% Call mex function
[ h, ierr ] = stablemex( 4, x, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablehazard' )

