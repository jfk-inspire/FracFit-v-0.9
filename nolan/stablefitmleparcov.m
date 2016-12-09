function sigtheta = stablefitmleparcov( alpha, beta )

%STABLEFITMLEPARCOV     Returns the asymptotic standard deviations 
%                       and correlations of the parameters obtained 
%                       from the inverse of the Fisher information matrix 
%                       for large sample confidence intervals.
%
% SIGTHETA = STABLEFITMLEPARCOV(ALPHA, BETA)
%
%   Inputs:
%      ALPHA  = Parameter alpha of the stable distribution
%      BETA   = Parameter beta of the stable distribution
%
%   Outputs:
%      SIGTHETA = Pointer to an array of 10 doubles that will receive
%                 the values of standard deviations and correlations.
%
%   See also stablefitmle, stablefitmle0, stablefitmleci.

% Set defaults (if necessary)
    if nargin < 1
        error( 'Alpha and Beta arguments undefined' );
    end

    if nargin < 2
        error( 'Beta argument is undefined' );
    end

% Call mex function
[ sigtheta, ierr ] = stablemex( 405, alpha, beta );

% Check for errors or report warnings
stablechkerror( ierr, 'stablefitmleparcov' )

