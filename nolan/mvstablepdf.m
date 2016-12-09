function f = mvstablepdf( dist, x )

%MVSTABLEPDF   computes pdf of a multivariate stable distribution.
%
% f = MVSTABLEPDF( DIST, X ) 
%
%   Inputs:
%      DIST   = distribution descriptor
%      X      = matrix of points at which to evaluate pdf
%
%   Outputs:
%      F      = vector of pdf values
%
%   See also mvstablecdf, mvstableamplitudepdf.

[ f, ierr ] = stablemex( 1001, dist, x );
stablechkerror( ierr, 'mvstablepdf' )
