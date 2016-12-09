function theta = stablefitecf( x, gamma0, delta0, param )

%STABLEFITECF       Fit a stable distribution to sample data using
%                   empirical characteristic function method
%
% THETA = STABLEFITECF( X, GAMMA0, DELTA0, PARAM )
%
%   Inputs:
%      X      = matrix of data points to fit
%	   GAMMA0 = initial estimate of scale parameter
%	   DELTA0 = initial estimate of location parameter
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      THETA  = estimate of parameters [ALPHA, BETA, GAMMA, DELTA]
%
%   See also stablefit, stablefitmle, stablefitmleci, stablefitdmle.

% Set defaults (if necessary)
    if nargin < 4
        param = 0;
    end 


% Call mex function
[ theta, ierr ] = stablemex( 205, x, gamma0, delta0, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablefitecf' )

