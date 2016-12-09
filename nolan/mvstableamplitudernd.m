function r = mvstableamplitudernd( n, alpha, gamma0, dim ) 

%MVSTABLEAMPLITUDERND   simulate the amplitude of a multivariate isotropic 
%                       stable distribution
%
% R = MVSTABLEAMPLITUDERND( N, ALPHA, GAMMA0, DIM ) 
%
%   Inputs:
%      N      = number of values to simulate
%      ALPHA  = index of stability
%      GAMMA0 = scale
%      DIM    = dimension, should be an integer 1,2,3,...
%
%   Outputs:
%      R      = matrix of r values
%
%   See also mvstableamplitudepdf, mvstableamplitudecdf.

if nargin<3
   gamma0 = 1.0;
end
if nargin<4
   dim=2;
end

unif = rand( 1, 2 * n * ( dim + 1 ) );
[ r, ierr ] = stablemex( 1303, n, alpha, gamma0, dim, unif );
stablechkerror( ierr, 'mvstableamplitudernd' )
