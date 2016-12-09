function F = stablecdfseriestail( x, nterms, theta, param ) 

%STABLECDFSERIESTAIL
% Cumulative distribution function of a stable distribution 
%
% F=STABLECDF( X, NTERMS, THETA, PARAM ) 
%
%   Inputs:
%      X      = matrix of points at which to evaluate density
%      THETA  = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM  = code for parameterization to use (defaults to 0)
%      NTERMS = number of terms used in the series.
%
%   Outputs:
%      F     = matrix of cdf values
%
%   See also stablepdfseriestail.

if nargin < 3
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 4
        param = 0;
    end 
    
% Call mex function
[ F, ierr ] = stablemex( 404, x, nterms, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablecdf' )

