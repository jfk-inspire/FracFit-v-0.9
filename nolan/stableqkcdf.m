function F = stableqkcdf( x, theta, param ) 

%STABLEQKCDF      spline approximation to cumulative distribution function 
%                 of a stable distribution
%
% F=STABLEQKCDF( X, THETA, PARAM ) 
%
%   Inputs:
%      X     = matrix of points at which to evaluate density
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      F     = matrix of cdf values
%
%   See also stableqkpdf, stablecdf, stablecdfdiscrete.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 
    
% Call mex function
[ F, ierr ] = stablemex( 12, x, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stableqkcdf' )

