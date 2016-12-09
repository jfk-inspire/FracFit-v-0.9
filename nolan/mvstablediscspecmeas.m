function dist = mvstablediscspecmeas( alpha, s, lambda, beta, delta, param )

%MVSTABLEDISCSPECMEAS      Define a multivariate stable distribution with
%                          discrete spectral measure
%
% DIST = MVSTABLEDISCSPECMEAS( ALPHA, S, LAMBDA, BETA, DELTA, PARAM )
%
%   Inputs:
%      ALPHA  = index of stability
%      S      = (d x nlambda) matrix of locations of the point mass
%      LAMBDA = nlambda vector of mass in directions given by angle
%      BETA   = nlmabda vector of skewness for each direction
%      DELTA  = shift/location vector of length d
%      PARAM  = parameterization
%
%   Outputs:
%      DIST   = distribution descriptor
%
%   See also mvstableindep, mvstableisotropic, mvstableelliptical.

[ dist, ierr ] = stablemex( 1109, alpha, s, lambda, beta, delta, param );
stablechkerror( ierr, 'mvstablediscspecmeas' )
