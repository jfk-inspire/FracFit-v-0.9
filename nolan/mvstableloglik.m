function  L = mvstableloglik( dist, x ) 
%L = mvstableloglik( dist, x ) compute log-likelihood for data from a stable distribution
%   Inputs:
%      dist   = distribution descriptor
%      x      = (dim x n) matrix of points at which to evaluate loglikelihood
%   Outputs:
%      L      = log-likelihood of the data (a scalar)

f = mvstablepdf( dist, x );
L = sum(log(f));
return
