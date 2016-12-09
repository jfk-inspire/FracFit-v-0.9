function x = stablemode( theta, param )

%STABLEMODE     Mode of a stable distribution
%
% X = STABLEMODE( THETA, PARAM )
%
%   Inputs:
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      X     = mode location
%
%   See also stableconvert.

if nargin < 1
    error( 'theta argument is undefined' );
end

% Set defaults (if necessary)
    if nargin < 2
        param = 0;
    end 

% Call mex function
[ x, ierr ] = stablemex( 103, theta, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablemode' )

