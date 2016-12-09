function f = mvstableamplitudepdf( r, alpha, gamma0, dim ) 

%MVSTABLEAMPLITUDEPDF   computes PDF of the amplitude of a multivariate 
%                       isotropic stable distribution.
%
% f = MVSTABLEAMPLITUDEPDF( R, ALPHA, GAMMA, DIM ) 
%
%   Inputs:
%      R      = vector of points at which to evaluate density
%      ALPHA  = index of stability
%      GAMMA  = scale
%      DIM    = dimension, should be an integer 1,2,3,...
%
%   Outputs:
%      F      = matrix of pdf values
%
%   See also mvstableamplitudecdf, mvstablepdf.

if nargin < 3
   gamma0 = 1.0;
end
if nargin < 4
   dim = 2;
end

[ f, ierr ] = stablemex( 1301, r, alpha, gamma0, dim );
stablechkerror( ierr, 'mvstableamplitudepdf' )

