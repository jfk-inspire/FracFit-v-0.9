function theta = stablefitmlerestricted( x, theta, param, restriction )

%STABLEFITMLERESTRICTED   Maximum likelihood estimation, this function
%                         allows fixed parameters.
%
% THETA = STABLEFITMLEFIXEDPARAM( X, THETA, PARAM, FIXEDPARAM )
%
%   Inputs:
%      X          = matrix of data points to fit
%      PARAM      = code for parameterization to use (defaults to 0)
%      THETA      = fixed parameters [ALPHA, BETA, GAMMA, DELTA]
%      FIXEDPARAM = vector of flags indicating fixed parameters
%
%   Outputs:
%      THETA      = estimate of parameters [ALPHA, BETA, GAMMA, DELTA]
%
%   See also stablefit, stablefitmle, stablefitmleci, stablefitecf, 
%   stablefitdmle.

if nargin < 4
    error( 'not enough arguments defined' );
end

% Set defaults (if necessary)
    if nargin < 2
        param = 0;
    end 

% Call mex function
[ theta, ierr ] = stablemex( 213, x, theta, param, restriction );

% Check for errors or report warnings
stablechkerror( ierr, 'stablefitmlerestricted' )

