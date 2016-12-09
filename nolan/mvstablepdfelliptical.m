function f = mvstablepdfelliptical( x, alpha, R, delta ) 

%MVSTABLEPDFELLIPTICAL   computes PDF of the amplitude of a multivariate 
%                        elliptical stable distribution.
%
% f = MVSTABLEPDFELLIPTICAL( X, ALPHA, R, DELTA ) 
%
%   Inputs:
%      X      = vector of points at which to evaluate density
%      ALPHA  = index of stability
%      R      = (d x d) covariation matrix
%      DELTA  = shift/location vector of length d
%
%   Outputs:
%      F      = matrix of pdf values
%
%   See also mvstableamplitudecdf, mvstablepdf.

[ f, ierr ] = stablemex( 1307, x, alpha, R, delta );
stablechkerror( ierr, 'mvstablepdfisotropic' )

