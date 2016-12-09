function  dist = mvstableindep( alpha, beta, gamma, delta, param )

%MVSTABLEINDEP      Define a multivariate stable distribution
%                   with independent components
%
% DIST = MVSTABLEINDEP( ALPHA, BETA, GAMMA, DELTA, PARAM )
%
%   Inputs:
%      ALPHA  = index of stability
%      BETA   = Vector of skewness for each coordinate
%      GAMMA  = vector of scale parameters
%      DELTA  = shift/location vector
%      PARAM  = parameterization
%
%   Outputs:
%      DIST   = distribution descriptor
%
%   See also mvstablediscspecmeas, mvstableisotropic, mvstableelliptical.

[ dist, ierr ] = stablemex( 1112, alpha, beta, gamma, delta, param );
stablechkerror( ierr, 'mvstableindep' );
