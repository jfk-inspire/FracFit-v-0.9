function f = mvstableqkamplitudepdf2d( r, alpha, gamma0 )

%MVSTABLEQKAMPLITUDEPDF2D   fast approximation to the density of the amplitude 
%                           of a bivariate isotropic stable distribution
%
% F = MVSTABLEQKAMPLITUDEPDF2D( R, ALPHA, GAMMA )
%
%   Inputs:
%      R      = vector of points at which to evaluate density
%      ALPHA  = index of stability
%      GAMMA  = scale
%
%   Outputs:
%      F     = matrix of pdf values
%
%   See also mvstableqkloglikisotropic2d.

if nargin<3
   gamma0 = 1.0;
end

[ f, ierr ] = stablemex( 1401, r, alpha, gamma0 );
stablechkerror( ierr, 'mvstableqkamplitudepdf2d' )

