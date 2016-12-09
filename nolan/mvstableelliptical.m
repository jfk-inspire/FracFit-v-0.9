function  dist = mvstableelliptical( alpha, R, delta, param )

%MVSTABLEELLIPTICAL      Define a multivariate stable elliptical
%                        distribution
%
% DIST = MVSTABLEELLIPTICAL( ALPHA, R, DELTA, PARAM )
%
%   Inputs:
%      ALPHA  = index of stability
%      R      = (d x d) shape matrix
%      DELTA  = shift/location vector of length d
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      DIST = number of sequence
%
%   See also mvstablediscspecmeas, mvstableisotropic, mvstableindep.

if nargin < 4
    param = 0;
end

[ dist, ierr ] = stablemex( 1111, alpha, R, delta, param );
stablechkerror( ierr, 'mvstableelliptical' );
