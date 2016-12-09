function f = mvstablepdfisotropic( x, alpha, gamma0, delta ) 

%MVSTABLEPDFISOTROPIC   computes PDF of the amplitude of a multivariate 
%                       isotropic stable distribution..
%
% f = MVSTABLEPDFISOTROPIC( X, ALPHA, GAMMA, DELTA ) 
%
%   Inputs:
%      X      = vector of points at which to evaluate density
%      ALPHA  = index of stability
%      GAMMA  = scale
%      DELTA  = shift/location vector of length d
%
%   Outputs:
%      F      = matrix of pdf values
%
%   See also mvstableamplitudecdf, mvstablepdf.

[ f, ierr ] = stablemex( 1306, x, alpha, gamma0, delta );
stablechkerror( ierr, 'mvstablepdfisotropic' )

