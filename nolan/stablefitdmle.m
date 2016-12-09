function theta = stablefitdmle( x, cutoff, method, param )

%STABLEFITDMLE  Fit a discrete stable distribution to sample data using
%               max. likelihood
%
% THETA = STABLEFITDMLE( X, CUTOFF, METHOD, PARAM )
%
%   Inputs:
%      X      = matrix of data points to fit
%      CUTOFF = [A,B] are lower and upper truncation values, defaults to [-128 127]
%      METHOD = 1 for general non-symmetric case (default)
%             = 2 for symmetric case
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      THETA  = estimate of parameters [ALPHA, BETA, GAMMA, DELTA]
%
%   See also stablefit, stablefitmle, stablefitmleci, stablefitecf.

% Set defaults (if necessary)
    if nargin < 2
       cutoff = [ -128 127 ];
    end

    if nargin < 3
       method = 1;
    end

    if nargin < 4
       param = 0;
    end

% Call mex function
[ theta, ierr ] = stablemex( 306, x, cutoff, method, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablefitdmle' )

