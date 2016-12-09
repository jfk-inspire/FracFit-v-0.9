function  R = mvstablefindrectangle( dist, p )

%MVSTABLEFINDRECTANGLE   find a rectangle containing probability at least p 
%                        for a bivariate stable distribution.
%
% R = MVSTABLEFINDRECTANGLE( DIST, P ) 
%
%   Inputs:
%      DIST   = sequence number
%      P      = specified probability 
%
%   Outputs:
%      R      = bound of the rectangle A=[-R,R] x [-R,R] with P(X in A) >= p
%
%   See also mvstablecdf, mvstablepdf.

[ R, ierr ] = stablemex( 1004, dist, p );
stablechkerror( ierr, 'mvstablefindrectangle' );
return