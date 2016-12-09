function x = stablernddiscrete2( n, theta, cutoff, psaturation, param )

%STABLERNDDISCRETE2     Stable random numbers
%
% X = STABLERNDDISCRETE2( N, THETA, CUTOFF, PSATURATION, PARAM )
%
% simulate random numbers with a discrete 
%     stable distribution with a specified saturation probability
%
%   Inputs:
%      N     = number of random values to generate
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%              ( GAMMA is ignored, but a 1 x 4 vector is required )
%      CUTOFF = vector [A B] of cutoff values, defaults to [-128 127]
%      PSATURATION = saturation probability, defaults to 0.02
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      X     = matrix of random values (will be integer valued)
%
%   See also stablernddiscrete, stablernd.

% Set defaults (if necessary)
    if nargin < 3
       cutoff = [ -128 127 ];
    end

    if nargin < 4
        psaturation = 0.02;
    end 

    if nargin < 5
       param = 0;
    end


% Prepare aditional parameters
unif = rand( 1, 2 * n );

% Call mex function
[ x, ierr ] = stablemex( 304, n, theta, cutoff, psaturation, param, unif );

% Check for errors or report warnings
stablechkerror( ierr, 'stablernddiscrete2' )

