function [ ok ] = mvstableundefine( dist )

%MVSTABLEUNDEFINE       Clears the definition of a multivariate stable 
%                       distribution specified by a distribution descriptor
%
% OK = MVSTABLEUNDEFINE( DIST )
%
%   Inputs:
%      DIST = distribution descriptor
%
%   Outputs:
%      OK     = 1 - the operation was succesful
%             = 0 - unsuccessful
%
%   See also mvstableisotropic, mvstableelliptical, mvstableindep.

%mvstableundefine clears the definition of multivariate stable distribution
%specified by seqnum

[ ierr ] = stablemex( 1104, dist );
stablechkerror( ierr, 'mvstableundefine' )

ok = ~ierr;
