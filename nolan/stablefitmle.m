function theta = stablefitmle( x, param )

%STABLEFITMLE       fit a stable distribution to sample data using maximum
%                   likelihood
%
% THETA = STABLEFITMLE( X, PARAM )
%
%   Inputs:
%      X      = matrix of data points to fit
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      THETA  = estimate of parameters [ALPHA, BETA, GAMMA, DELTA]
%
%   See also stablefit, stablefitmleci, stablefitecf, stablefitdmle.

if nargin < 1
    error( 'x argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 2
        param = 0;
    end 

% Call mex function
[ theta, ierr ] = stablemex( 202, x, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablefitmle' )

