function  f = mvstablepdfdiscrete2d( dist, x, cutoff, eps, method )

%MVSTABLEPDFDISCRETE2D  computes PDF of a discrete bivariate stable distribution.
%
% R = MVSTABLEPDFDISCRETE2D( DIST, X, CUTOFF, EPS, METHOD ) 
%
%   Inputs:
%      DIST   = distribution descriptor
%      X      = specified probability 
%      CUTOFF = vector [A B] giving the low and high cutoff values,
%      EPS    = absolute error desired on calculations
%      METHOD = reserved argument
%
%   Outputs:
%      f      = matrix of pdf values
%
%   See also mvstablecdf, mvstablepdf.

rmax = mvstablefindrectangle( dist, 1 - eps );
rmax = max( [ rmax 1.1*abs( cutoff ) ] );

[ f, ierr ] = stablemex( 1501, dist, x, cutoff, eps, method, rmax );
stablechkerror( ierr, 'mvstablepdfdiscrete2d' );
return