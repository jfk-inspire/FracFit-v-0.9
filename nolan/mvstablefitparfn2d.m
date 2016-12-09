function  parfn = mvstablefitparfn2d( x, angle, method1d, param )

%MVSTABLEFITPARFN2D         estimate the parameter functions
%                           for a bivariate data set
%
% PARFN = MVSTABLEFITPARFN2D( X, ANGLE, METHOD1D, PARAM ) 
%
%   Inputs:
%      X        = (2 x n) matrix of data points
%      ANGLE    = vector of angles which are used to project the data
%      METHOD1D = which method to use for 1-dimensional fits
%      PARAM    = parameterization to use (suggest 0, especially if alpha is near 1)
%
%   Outputs:
%      PARFN    = (length(angle) x 5) matrix containing results: 
%                       column 1    angle
%                       column 2    alpha
%                       column 3    beta
%                       column 4    gamma
%                       column 5    delta
%
%   See also mvstablefitamplitude, mvstablefitelliptical, mvstablefit.

[ parfn, ierr ] = stablemex( 1202, x, angle, method1d, param );
parfn = parfn.';
stablechkerror( ierr, 'mvstablefitparfn2d' )
