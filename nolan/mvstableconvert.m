function shift = mvstableconvert( dist, newparam )

%MVSTABLECONVERT  Converts the current stable distribution to parameterization newparam.
%
% SHIFT = MVSTABLECONVERT( DIST, NEWPARAM ) 
%
%   Inputs:
%      DIST     = distribution descriptor
%      NEWPARAM = 0 or 1, for the new parameterization
%
%   Outputs:
%      SHIFT    = ( 2 x 1 ) vector that is the new shift/location vector
%
%   See also mvstableparfn2d, mvstableinfo.

[ shift, ierr ] = stablemex( 1107, dist, newparam );
stablechkerror( ierr, 'mvstableconvert' )