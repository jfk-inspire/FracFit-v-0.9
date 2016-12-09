function results = stablelrt( x, alphabnds, betabnds ) 

%STABLELRT      Likelihood ratio statistic for sample data
%
% RESULTS = STABLELRT( X, ALPHABNDS, BETABNDS ) 
%
% Compute likelihood ratio statistic for sample data for 
%       H0: data is stable with alpha and beta in the region specified vs.
%       H1: data is stable with any alpha > 0.4 and any beta
%
%   Inputs:
%      X         = matrix of data points 
%      ALPHABNDS = 1 x 2 vector giving upper and lower bound for alpha in H0
%      BETABNDS  = 1 x 2 vector giving upper and lower bound for beta in H0
%
%   Outputs:
%	   RESULT = 1 x 12 vector containing results of computation:
%		RESULT(1) = ratio of the likelihoods
%		RESULT(2) = -2*log(ratio of likelihoods) (converges to chi-squared with
%			d.f. = (# free parameters in H1 parameter space - 
%                               # free parameters in H0 parameter space)
%		RESULT(3) = log likelihood of the data for the restricted H0
%		RESULT(4) = log likelihood of the data for the unrestricted H1
%		RESULT(5:8) = estimated value of THETA=[ALPHA, BETA, GAMMA, DELTA] under H0
%		RESULT(9:12) = estimated value of THETA=[ALPHA, BETA, GAMMA, DELTA] under H1
%
%   See also stablefit.

% Call mex function
[ results, ierr ] = stablemex( 209, x, alphabnds, betabnds );

% Check for errors or report warnings
stablechkerror( ierr, 'stablelrt' )

