function  f = mvstablecdfmc( dist, a, b, n )

% MVSTABLECDFMC  computes the probability of the rectangle [a,b] for a
%                bivariate stable distribution.
%
% F = MVSTABLECDFMC( DIST, A, B, N )
%   Inputs:
%      DIST = distribution descriptor
%      A    = lower bounds of integration region
%      B    = upper bounds of integration region
%      N    = number of vectors to simulate
%
%   Outputs:
%      F    = cumulative density function evaluated at rectangle [a,b]
%
%   See also mvstableamplitudecdf, mvstablepdf.

tmp = mvstableinfo( dist );
nunif = n * tmp.nunif;
unif = rand( nunif, 1 );
[ f, ierr ] = stablemex( 1005, dist, a, b, n, unif );
stablechkerror( ierr, 'mvstablecdfmc' )
