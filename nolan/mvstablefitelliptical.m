function fit = mvstablefitelliptical( x, method1d )

%MVSTABLEFITELLIPTICAL    fits multivariate data set with an elliptical 
%                         stable distribution
%
% FIT = MVSTABLEFITELLIPTICAL( X, METHOD1D ) 
%
%   Inputs:
%      X        = (d x n) matrix of data points
%      METHOD1D = which method to use for 1-dim. fits (see stablefit)
%
%   Outputs:
%      FIT      = a structure describing the distribution. It contains fields:
%                   alpha   estimated alpha 
%                   shift   (d x 1) matrix with the estimated shift/location vector 
%                   R       (d x d) covariation matrix
%
%   See also mvstablefitparfn2d, mvstablefitamplitude, mvstablefit.

[ d, n ] = size(x);
[ y, ierr ] = stablemex( 1203, x, method1d );
stablechkerror( ierr, 'mvstablefitelliptical' );

% internally, stablemex returns a vector y with packed info
fit.alpha = y(1);
fit.shift = y(2:(d+1));
fit.R = zeros(d);
k = d+2;
for i=1:d
  for j=1:d
    fit.R(i,j) = y(k);
    k = k + 1;
  end
end
