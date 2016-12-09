function value = stablegettolerance( i ) 

%STABLEGETTOLERANCE      gets an internal tolerance value from stable
%                       routines
%
%   VALUE = STABLEGETTOLERANCE(I)
%   Inputs:
%      I     =  Specifies the tolerance to retrieve. It can be:
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
%   See also stablesettolerance

[ value, ierr ] = stablemex( 105, i );
stablechkerror( ierr, 'stablegettolerance' );
