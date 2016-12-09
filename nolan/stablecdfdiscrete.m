function F = stablecdfdiscrete( x, theta, cutoff, param )

%STABLECDFDISCRETE      Cumulative distribution function of a discrete
%                       stable distribution
%
% F = STABLECDFDISCRETE( X, THETA, CUTOFF, PARAM )
%
%   Inputs:
%      X      = matrix of points at which to evaluate density (will be rounded to nearest integer)
%      THETA  = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%	   CUTOFF = vector [A B] giving the low and high cutoff values, defaults to [-128 127]
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      F     = matrix of cdf values
%
%   See also stablepdfdiscrete, stablecdf, stableqkcdf.

% Set defaults (if necessary)
    if nargin < 3
       cutoff = [ -128 127 ];
    end

    if nargin < 4
        param = 0;
    end 

% Call mex function
[ F, ierr ] = stablemex( 302, x, theta, cutoff, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablecdfdiscrete' )

