function  x = mvstablernd( dist, n )

%MVSTABLERND       generate multivariate sample with a stable distribution.
%
% X = MVSTABLERND( DIST, N ) 
%
%   Inputs:
%      DIST   = sequence number
%      N      = number of vectors to generate
%
%   Outputs:
%      X      = matrix of cdf values
%
%   See also mvstablepdf, mvstablecdf, stablepdfdiscrete2d.

temp = mvstableinfo( dist );
unif = rand( 1, temp.nunif * n );
dim = temp.dim;

[ x, ierr ] = stablemex( 1003, dist, n, dim, unif );
stablechkerror( ierr, 'mvstablernd' );
return
