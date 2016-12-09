function halfwidth = stablefitmleci( theta, n, z )

%STABLEFITMLECI     confidence intervals for stable parameters estimated by
%                   maximum likelihood
%
% HALFWIDTH = STABLEFITMLECI( THETA, N, Z ) 
%
%   Inputs:
%      THETA      = vector of estimated parameters [alpha, beta, gamma, delta] 
%                   (returned by stablefitmle)
%      N          = size of sample from which theta was estimated
%      Z          = critical value from the z table (defaults to 1.96 for 95% 
%                   confidence interval)
%
%   Outputs:
%      HALFWIDTH  = vector of half interval of confidence interval for 
%                   [alpha, beta, gamma, delta] e.g. the confindence 
%                   interval for all four parameters is theta-halfwidth to 
%                   theta+halfwidth
%
%   Note: the continuous 0-parameterization is used.
%
%   See also stablefitmle.

if nargin < 3
   z = 1.96;
end

[ halfwidth, ierr ] = stablemex( 203, theta, n, z );
stablechkerror( ierr, 'stablefitmleci' )

