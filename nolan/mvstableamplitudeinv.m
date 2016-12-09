function r = mvstableamplitudeinv( p, alpha, gamma0, dim ) 

%MVSTABLEAMPLITUDEINV   inverse cdf of the amplitude of a multivariate 
%                       isotropic stable distribution.
%
% R = MVSTABLEAMPLITUDEINV( P, ALPHA, GAMMA0, DIM ) 
%
%   Inputs:
%      P      = matrix of p values to find the inverse of
%      ALPHA  = index of stability
%      GAMMA0 = scale
%      DIM    = dimension, should be an integer 1,2,3,...
%
%   Outputs:
%      R      = matrix of r values
%
%   See also mvstableamplitudepdf, mvstableamplitudecdf.

if nargin < 3
   gamma0 = 1.0;
end
if nargin < 4
   dim = 2;
end

[ r, ierr ] = stablemex( 1304, p, alpha, gamma0, dim );
stablechkerror(ierr,'mvstableamplitudeinv')
