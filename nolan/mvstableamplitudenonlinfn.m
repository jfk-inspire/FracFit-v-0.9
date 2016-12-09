function f = mvstableamplitudenonlinfn( r, alpha, gamma0, dim ) 

%MVSTABLEAMPLITUDENONLINFN   computes nonlinear/score function of the amplitude of a 
%                       multivariate isotropic stable distribution.
%
% f = MVSTABLEAMPLITUDENONLINFN( R, ALPHA, GAMMA0, DIM ) 
%
%   Inputs:
%      R      = vector of points at which to evaluate density
%      ALPHA  = index of stability
%      GAMMA0 = scale
%      DIM    = dimension, should be an integer 1,2,3,...
%
%   Outputs:
%      F      = matrix of pdf values
%
%   See also mvstableamplitudepdf, mvstableamplitudepdf, mvstableamplitudeinv.

if nargin < 3
   gamma0 = 1.0;
end
if nargin < 4
   dim = 2;
end

[ f, ierr ] = stablemex( 1308, r, alpha, gamma0, dim );
stablechkerror( ierr, 'mvstableamplitudenonlinfn' )
