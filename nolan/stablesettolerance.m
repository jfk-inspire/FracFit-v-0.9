function stablesettolerance( inum, value ) 

%STABLESETTOLERANCE      Sets an internal tolerance value for stable
%                       routines
%
%   STABLEGETTOLERANCE( INUM, VALUE )
%   Inputs:
%      INUM =  Specifies the tolerance to retrieve. It can be:
%        0: 	Relative error in pdf numerical integration.
%        1: 	Relative error in cdf numerical integration.
%        2: 	Relative error in quantile calculation.
%        3: 	Tolerance used to compare values of alpha and beta. 
%        4: 	Tolerance used to test values of x.
%        5: 	Tolerance used in exponential evaluation.
%        6: 	Tolerance used when finding the location of the peak
%               of the pdf
%               integrand and limiting the stabletrim search.
%        7: 	Tolerance used by stabletrim.
%        8: 	Tolerance used to determine the minimum alpha.
%        9: 	Minimum value of xtol allowed.
%        10: 	Thershold used in quantile search.
%      
%     VALUE =   New value to assign to tolerance(i)
%
%   WARNING: this routine should only be used by expert users
%
%   See also stablegettolerance

[ value, ierr ] = stablemex( 104, inum, value );
stablechkerror( ierr, 'stablesettolerance' );
