function f = stableqkpdfdiscrete( x, theta, cutoff, param )

%STABLEQKPDFDISCRETE     fast approximation to pdf of a 
%                           discrete stable distribution
%
% F = STABLEQKPDFDISCRETE( X, THETA, CUTOFF, PARAM )
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
%      F      = matrix of pdf values
%
%   See also stableqkcdfdiscretesym, stablepdfdiscrete.

if nargin < 3
  cutoff = [-128 127];
end
if nargin<4
   param=0;
end

[ f, ierr ] = stablemex( 307, x, theta, cutoff, param );
stablechkerror( ierr, 'stableqkpdfdiscrete' )
