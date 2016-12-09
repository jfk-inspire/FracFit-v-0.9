function f = stableqkcdfdiscrete( x, theta, cutoff, param ) 

%STABLEQKCDFDISCRETE     fast approximation to cdf of a 
%                           discrete stable distribution
%
% F = STABLEQKPDFDISCRETESYM( X, THETA, CUTOFF, PARAM )
%
%   Inputs:
%      X      = matrix of points at which to evaluate density 
%               (will be rounded to nearest integer)
%      THETA  = vector of parameters [alpha, beta, gamma, delta]
%	   CUTOFF = vector [a b] giving the low and high cutoff values, 
%               defaults to [-128 127]
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      F      = matrix of cdf values
%
%   See also stableqkpdfdiscretesym, stablecdfdiscrete.

if nargin < 3
  cutoff = [-128 127];
end
if nargin<4
   param=0;
end

[ f, ierr ] = stablemex( 308, x, theta, cutoff, param );
stablechkerror( ierr, 'stableqkcdfdiscrete' )
