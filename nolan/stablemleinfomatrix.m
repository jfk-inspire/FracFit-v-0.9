function F = stablemleinfomatrix( theta ) 

%STABLEMLEINFOMATRIX
%
%   resturns the Fisher Information Matrix = variance-covariance 
%   matrix for maximum likelihood estimation of the 4
%   stable parameters at theta = (alpha, beta, gamma, delta). 
%   This is based on the continuous 0-parameterization.
%
%   F = STABLEMLEINFOMATRIX( THETA )
% 
%   Inputs:
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%
%   Outputs:
%      F     = Fisher information matrix 
%
%   See also stablemfitmle, stablefit.

[ F, ierr ] = stablemex( 211, theta );
stablechkerror( ierr, 'stablemleinfomatrix' );
