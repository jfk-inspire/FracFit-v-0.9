function  f = mvstablecdfindep( dist, a, b )

% MVSTABLECDFINDEP  computes the probability of the rectangle [a,b] for a
%                   multivariate stable distribution with independent 
%                   components.
%
% F = MVSTABLECDF( DIST, A, B )
%
%   Inputs:
%      DIST = distribution descriptor
%      A    = lower bounds of integration region
%      B    = upper bounds of integration region
%
%   Outputs:
%      F    = cumulative density function evaluated at rectangle [a,b]
%
%   See also mvstablecdf, mvstablepdf.

[ f, ierr ] = stablemex( 1006, dist, a, b );
stablechkerror( ierr, 'mvstablecdfindep' )
