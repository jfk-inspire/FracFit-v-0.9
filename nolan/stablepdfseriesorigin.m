function f = stablepdfseriesorigin( x, nterms, theta, param ) 

%STABLEPDFSERIESORIGIN     Density of a stable distribution
%
% F = STABLEPDFSERIESORIGIN( X, NTERMS, THETA, PARAM ) 
%
%   Inputs:
%      X      = matrix of points at which to evaluate density
%      THETA  = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM  = code for parameterization to use (defaults to 0)
%      NTERMS = number of terms used in the series
%
%   Outputs:
%      F     = matrix of pdf values
%
%   See also stablecdfseriesorigin

if nargin < 3
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 4
        param = 0;
    end 

% Call mex function
[ f, ierr ] = stablemex( 401, x, nterms, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablepdf' )

