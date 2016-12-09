function x = stablernd( n, theta, param )

%STABLERND      Simulate random numbers with a stable distribution
%
% X = STABLERND( N, THETA, PARAM )
%
%   Inputs:
%      N	 = number of random values to generate
%      THETA =  vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      X     = matrix of random values
%
%   See also stablernddiscrete, stablernddiscrete2.

if nargin < 2
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 3
        param = 0;
    end 

% Prepare auxiliary parameters: Uniformly distributed aleatory values.
unif = rand( 1, 2 * n );

% Call mex function
[ x, ierr ] = stablemex( 102, n, theta, param, unif );

% Check for errors or report warnings
stablechkerror( ierr, 'stablernd' )

