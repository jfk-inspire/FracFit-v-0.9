function theta = stablefit( x, method, param )

%STABLEFIT      Fit a stable distribution to sample data
%
% THETA = STABLEFIT( X, METHOD, PARAM )
%
%   Inputs:
%      X      = matrix of data points to fit
%      METHOD = 1 for maximum likelihood method (default)
%             = 2 for quantile method
%             = 3 for empirical characteristic function method
%             = 4 for fractional moment method
%             = 5 for log absolute moment method
%             = 6 for modified quantile method
%             = 7 for U-statistic method
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      THETA  = estimate of parameters [ALPHA, BETA, GAMMA, DELTA]
%
%   See also stablefitdmle, stablefitmle, stablefitmleci, stablefitecf.


if nargin < 1
    error( 'x argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 2
        method = 1;
    end

    if nargin < 3
        param = 0;
    end

% Call mex function
[ theta, ierr ] = stablemex( 201, x, method, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablefit' )

