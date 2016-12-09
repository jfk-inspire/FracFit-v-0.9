function fit = mvstablefit( x, nspectral, method1d, method2d, param )

%MVSTABLEFIT    fits bivariate data set with a stable distribution
%
% FIT = MVSTABLEFIT( X, NSPECTRAL, METHOD1D, METHOD2D, PARAM ) 
%
%   Inputs:
%      x         = (2 x n) matrix of data points
%      NSPECTRAL = number of points to make in the spectral measure 
%                  (suggest 40, must be a multiple of 4)
%      METHOD1D  = which method to use for 1-dim. fits
%      METHOD2D  = method to use for 2-dim. fits
%      PARAM     = parameterization to use (currently only works for param=1)
%
%   Outputs:
%      FIT       = a structure describing the distribution. It contains fields:
%                      alpha    estimated alpha 
%                      shift    (2 x 1) matrix with the estimated 
%                               shift/location vector 
%                      param    parameterization
%                      angle    (nspectral x 1) matrix of angles for 
%                               point masses
%                      lambda   (nspectral x 1) matrix of estimated weights 
%                               of the masses in the spectral measure
%
%   See also mvstablefitparfn2d, mvstablefitelliptical, mvstablefitamplitude.

% internally, stablemex returns a vector of length 3+2*nspectral
[ y, ierr ] = stablemex( 1201, x, nspectral, method1d, method2d, param );
stablechkerror( ierr, 'mvstablefit' )

fit.alpha = y(1);
fit.shift = y(2:3);
fit.param = param;
fit.angle = y(4:(3+nspectral));
fit.lambda = y((4+nspectral):(3+2*nspectral));
