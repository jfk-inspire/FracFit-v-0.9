function F = stablecdf( x, theta, param ) 

%STABLECDF      Cumulative distribution function of a stable distribution
%
% F=STABLECDF( X, THETA, PARAM ) 
%
%   Inputs:
%      X     = matrix of points at which to evaluate density
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      F     = matrix of cdf values
%
%   See also stablepdf, stableqkcdf, stablecdfdiscrete.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 
    
% Call mex function
[ F, ierr ] = stablemex( 2, x, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablecdf' )

