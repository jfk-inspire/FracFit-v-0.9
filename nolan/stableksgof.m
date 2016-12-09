function results = stableksgof( x, theta, method, param )

%STABLEKSGOF    Compute Kolmogorov-Smirnov goodness-of-fit for sample data
%      test of null hypothesis 
%           H0: data comes from a stable distribution with parameters theta.
%      Test is based on D = max difference between emprical cdf and exact cdf
%
% RESULTS = STABLEKSGOF( X, THETA, METHOD, PARAM )
%
%   Inputs:
%      X      = matrix of data points 
%      THETA  = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      METHOD = 0 to use stableqkcdf for exact cdf (default)
%             = 1 to use stablecdf for exact cdf
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%	   RESULTS = 1 x 2 vector with test results for 
%              RESULTS(1) = observed value of D from sample
%              RESULTS(2) = P( D > results(1) | H0 ), significance level for H0
%
%   See also stableloglik, stablefit.

% Set defaults (if necessary)
    if nargin < 4
        param = 0;
    end 
    
    if nargin < 3
        method = 0;
    end


% Call mex function
[ results, ierr ] = stablemex( 208, x, theta, method, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stableksgof' )

