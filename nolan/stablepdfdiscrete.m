function f = stablepdfdiscrete( x, theta, cutoff, param )

%STABLEPDFDISCRETE  Probabilty density function of a discrete stable
%                   distribution.
%
% F = STABLEPDFDISCRETE( X, THETA, CUTOFF, PARAM )
%
%   Inputs:
%      X      = matrix of points at which to evaluate density (will be rounded to nearest integer)
%      THETA  = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%	   CUTOFF = vector [A B] giving the low and high cutoff values, defaults to [-128 127]
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      F     = matrix of pdf values
%
%   See also stablepdf, stablecdfdiscrete.

% Set defaults (if necessary)
    if nargin < 3
       cutoff = [ -128 127 ];
    end

    if nargin < 4
        param = 0;
    end 


% Call mex function
[ f, ierr ] = stablemex( 301, x, theta, cutoff, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablepdfdiscrete' )

