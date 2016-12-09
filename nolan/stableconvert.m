function thetaj = stableconvert( iparam, thetai, jparam )

%STABLECONVERT  Converts from parameterization i to parameterization j
%
% THETAJ = STABLECONVERT( IPARAM, THETAI, JPARAM )
%
%   Inputs:
%      IPARAM	= original parameterization
%	   THETAI   = original [ALPHA, BETA, GAMMA, DELTA]
%	   JPARAM   = parameterization to convert to
%
%   Outputs:
%      THETAJ   = new [ALPHA, BETA, GAMMA, DELTA]
%
%   See also stablepdf.

if nargin < 1
    error( 'iparam argument is undefined' );
end

if nargin < 2
    error( 'thetai argument is undefined' );
end

if nargin < 3
    error( 'jparam argument is undefined' );
end

% Call mex function
[ thetaj, ierr ] = stablemex( 106, iparam, thetai, jparam );

% Check for errors or report warnings
stablechkerror( ierr, 'stableconvert' )

