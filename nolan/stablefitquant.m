function theta = stablefitquant( x, param )

%STABLEFITQUANT     Fit a stable distribution to sample data using quantile
%                   method
%
% THETA = STABLEFITQUANT( X, PARAM )
%
%   Inputs:
%      X      = matrix of data points to fit
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      THETA  = estimate of parameters [ALPHA, BETA, GAMMA, DELTA]
%
%   See also stablefit, stablepdf.

if nargin < 1
    error( 'X argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 2
        param = 0;
    end 

% Call mex function
[ theta, ierr ] = stablemex( 204, x, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablefitquant' )
