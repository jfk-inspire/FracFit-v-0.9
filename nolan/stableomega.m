function F = stableomega( u, theta, param ) 

%STABLEOMEGA    
%
%   stableomega computes the function omega( u | alpha, beta; k). 
%   if a random variable Z sim S( alpha, beta, 1, 0; k ), then 
%   the characteristic function of its probability distribution is:
%
%   E exp( iuZ ) = exp( - omega( u | alpha, beta; k ) ). 
%
%   Where k = 0 is 0-parameterization, and k = 1 is 1-parameterization.
%
%   F = STABLEOMEGA( U, THETA, PARAM )
%
%   Inputs:
%      U     = matrix of points at which to evaluate the function
%      THETA = vector of parameters [ALPHA, BETA, GAMMA, DELTA] (note GAMMA
%              and DELTA are ignored, they can be omitted.)
%      PARAM = code for parameterization to use (defaults to 0)
%
%   Outputs:
%      F     = matrix of omega function values.  If beta = 0, then the
%      result will be real numbers; otherwise the result will be complex
%      valued.
%

[ F, ierr ] = stablemex( 107, u, theta, param);
stablechkerror( ierr, 'stableomega' );
