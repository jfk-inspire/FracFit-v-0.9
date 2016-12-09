function  dist = mvstablediscspecmeas2d( alpha, angle, lambda, beta, delta, param )

%MVSTABLEDISCSPECMEAS2D      Definition of a 2-dimensional discrete spectral
%                            measure distribution
%
% DIST = MVSTABLEDISCSPECMEAS2D( ALPHA, ANGLE, LAMBDA, BETA, DELTA, PARAM )
%
%   Inputs:
%      ALPHA  = index of stability
%      ANGLE  = m vector of angles (in radians) of the location of the point
%               masses
%      LAMBDA = m vector of mass in directions given by angle
%      BETA   = m vector of skewness for each direction
%      DELTA  = shift/location vector of length d
%      PARAM  = parameterization
%
%   Outputs:
%      DIST   = distribution descriptor
%
%   See also mvstableindep, mvstableisotropic, mvstableelliptical.

[ dist, ierr ] = stablemex( 1110, alpha, angle, lambda, beta, delta, param );
stablechkerror( ierr, 'mvstablediscspecmeas2d' )
