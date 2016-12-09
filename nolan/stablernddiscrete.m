function x = stablernddiscrete( n, theta, cutoff, param )

%STABLERNDDISCRETE      Simulate random numbers with a discrete stable
%                       distribution
%
% X = STABLERNDDISCRETE( N, THETA, CUTOFF, PARAM )
%
%   Inputs:
%      N	 = number of random values to generate
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%	   CUTOFF = vector [A B] of cutoff values, defaults to [-128 127]
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      X     = matrix of random values (will be integer valued)
%
%   See also stablernd, stablernddiscrete.

% Set defaults (if necessary)
    if nargin < 3
       cutoff = [ -128 127 ];
    end

    if nargin < 4
        param = 0;
    end 

% Prepare aditional parameters
unif = rand( 1, 2 * n );

% Call mex function
[ x, ierr ] = stablemex( 303, n, theta, cutoff, param, unif );

% Check for errors or report warnings
stablechkerror( ierr, 'stablernddiscrete' )

