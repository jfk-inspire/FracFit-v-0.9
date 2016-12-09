function  f = mvstablecdf( dist, a, b )

% MVSTABLECDF  computes the probability of the rectangle [a,b] for a
%              bivariate stable distribution.
%
% F = MVSTABLECDF( DIST, A, B )
%   Inputs:
%      DIST = distribution descriptor
%      A    = lower bounds of integration region
%      B    = upper bounds of integration region
%
%   Outputs:
%      F    = cumulative density function evaluated at rectangle [a,b]
%
%   See also mvstableamplitudecdf, mvstablepdf.

[ f, ierr ] = stablemex( 1002, dist, a, b );
stablechkerror( ierr, 'mvstablecdf' )
