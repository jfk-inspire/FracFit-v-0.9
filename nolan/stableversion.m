function stableversion

%STABLEVERSION    version information of the STABLE library that is being used.
%
% STABLEVERSION( )
%
%   Inputs:
%      None
%      
%   Outputs:
%     None
%

[ vinfo, ierr ] = stablemex( 101, 7 );
clockstr = clock;
fprintf('\nSTABLE version %d.%d.%d   %d/%d/%d  Serial #%d  Copyright 2002-%d Robust Analysis Inc\n', ...
    vinfo(1),vinfo(2),vinfo(3),vinfo(4),vinfo(5),vinfo(6),vinfo(7),clockstr(1))
%stablechkerror( ierr, 'stableversion' );
