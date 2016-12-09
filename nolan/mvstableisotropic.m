function  dist = mvstableisotropic( alpha, d, gamma0, delta, param )

%MVSTABLEISOTROPIC      define a multivariate stable isotropic
%                       distribution
%
% DIST = MVSTABLEISOTROPIC( ALPHA, D, GAMMA0, DELTA, PARAM )
%
%   Inputs:
%      ALPHA  = index of stability
%      D      = dimension of the distribution
%      GAMMA0 = scale
%      DELTA  = shift/location vector of length d
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      DIST   = Distribution descriptor
%
%   See also mvstablediscspecmeas, mvstableelliptical, mvstableindep.

if nargin < 5
    param = 0;
end

[ dist, ierr ] = stablemex( 1113, alpha, d, gamma0, delta, param );
stablechkerror( ierr, 'mvstableisotropic' );

