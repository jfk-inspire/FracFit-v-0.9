function loglik = stableqkloglik( x, theta, param )

%STABLEQKLOGLIK     compute log-likelihood for sample data using stableqkpdf
%
% LOGLIK = STABLEQKLOGLIK( X, THETA, PARAM )
%
%   Inputs:
%      X      = matrix of data points 
%      THETA  = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%	   LOGLIK = log likelihood of the data for a stable model with the stated theta
%
%   See also stablefit, stableloglik.

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 

% Call mex function
[ loglik, ierr ] = stablemex( 207, x, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stableqkloglik' )

