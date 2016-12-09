function f = stableqklogpdf( x, theta, param ) 

%STABLEQKLOGPDF    spline approximation to log of the density of a stable distribution
%
% F = STABLEQKLOGPDF( X, THETA, PARAM ) 
%
%   Inputs:
%      X     = matrix of points at which to evaluate log of density
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%   Outputs:
%      F     = matrix of pdf values
%
%   See also stablepdf, stableqkcdf, stablepdfdiscrete, stableqkpdf.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 

% Call mex function
[ f, ierr ] = stablemex( 18, x, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stableqklogpdf' )

