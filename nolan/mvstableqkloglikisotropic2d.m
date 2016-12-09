function  loglik = mvstableqkloglikisotropic2d( x, alpha, gamma0, delta )

%MVSTABLEQKLOGLIKISOTROPIC2D   compute fast approximation of log-likelihood 
%                              of an isotropic bivariate stable distribution
%
% LOGLIK = MVSTABLEQKLOGLIKISOTROPIC2D( X, ALPHA, GAMMA0, DELTA ) 
%
%   Inputs:
%      X      = (2 x n) matrix of points at which to evaluate loglikelihood
%      ALPHA  = index of stability
%      GAMMA0 = scale
%      DELTA  = location
%
%   Outputs:
%      LOGLIK = log-likelihood of the data (a scalar)
%
%   See also mvstableqkamplitudepdf2d.

[ loglik, ierr ] = stablemex( 1402, x, alpha, gamma0, delta );
stablechkerror( ierr, 'mvstableqkloglikisotropic2d' );
return
