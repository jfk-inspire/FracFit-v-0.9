function chisq = stablechisq( x, theta, nclasses, param )

%CHISQ      Compute chi squared goodness-of-fit statistic for sample data
%
% CHISQ = STABLECHISQ( X, THETA, NCLASSES, PARAM )
%
%   Inputs:
%      X      = matrix of data points 
%      THETA  = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      NCLASSES = number of classes/bins to use.  Bins are computed internally
%                 to have equal probability
%      PARAM  = code for parameterization to use (defaults to 0)
%
%   Outputs:
%	   CHISQ  = computed chi-squared value
%
%   WARNING: if theta is estimated from the sample, using (nclasses-1) degrees of freedom
%   will give a conservative test.
%

% Set defaults (if necessary)
    if nargin < 4
        param = 0;
    end 


% Call mex function
[ chisq, ierr ] = stablemex( 210, x, theta, nclasses, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablechisq' )

