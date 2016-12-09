function parfn = mvstableparfn2d( dist, angle )

%MVSTABLEPARFN2D   computes parameter functions of a 2-dimensional stable 
%                  distribution.
%
% PARFN = MVSTABLEPARFN2D( DIST, ANGLE ) 
%
%   Inputs:
%      DIST   = distribution descriptor
%      ANGLE  = vector of points at which to evaluate parameter functions.
%
%   Outputs:
%      PARFN  = matrix of parameter functions: dimensions are length(angle) x 5, with
%               angle in the first column, alpha in the second column, beta in the 
%               third column, gamma in the fourth column, and delta in the
%               fifth column.
%
%   See also mvstableconvert, mvstableinfo.

[ parfn, ierr ] = stablemex( 1106, dist, angle );
stablechkerror( ierr, 'mvstableparfn2d' )
