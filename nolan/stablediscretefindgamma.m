function gamma = stablediscretefindgamma( theta, cutoff, psaturation, param )

%GAMMA      Finds gamma value
%
% GAMMA = STABLEDISCRETEFINDGAMMA( THETA, CUTOFF, PSATURATION, PARAM )
%
% Finds gamma value  for a discrete stable distribution to achieve 
%    specified saturation probability,
%    e.g.  P(cutoff(1) <= X <= cutoff(2) ) = 1-psaturation.
%
%   Inputs:
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA]
%              (GAMMA is ignored, but a 1 x 4 vector is required)
%	   CUTOFF = vector [A B] of cutoff values, defaults to [-128 127]
%      PSATURATION = saturation probability, defaults to 0.02
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      GAMMA  = computed gamma (scalar)
%
%   See also stablepdf.

% Set defaults (if necessary)
    if nargin < 2
       cutoff = [ -128 127 ];
    end

    if nargin < 3
        psaturation = 0.02;
    end 

    if nargin < 4
       param = 0;
    end


% Call mex function
[ gamma, ierr ] = stablemex( 305, theta, cutoff, psaturation, param );

% Check for errors or report warnings
stablechkerror( ierr, 'stablediscretefindgamma' )

