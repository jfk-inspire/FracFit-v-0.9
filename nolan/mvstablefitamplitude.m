function fit = mvstablefitamplitude( r, dim, method ) 

%MVSTABLEFITAMPLITUDE   fits amplitude data from an isotropic stable distribution
%
%   FIT = MVSTABLEFITAMPLITUDE( R, DIM, METHOD ) 
%
%   Inputs:
%      R      = vector of data points 
%      DIM    = dimension of the underlying istropic distribution
%      METHOD = estimation method (currently ignored; it is always set to 5 )
%
%   Outputs:
%      FIT    = structure describing the fit.  
%                   alpha    estimated alpha
%                   gamma0   estimated gamma0
%                   dim      dimension
%                   method   method
%
%   See also mvstablefitparfn2d, mvstablefitelliptical, mvstablefit.

% only method implemented yet
method = 5;

[ y, ierr ] = stablemex( 1305, r, dim, method );
stablechkerror( ierr, 'mvstablefitamplitude' );

fit.alpha = y(1);
fit.gamma0 = y(2);
fit.dim = dim;
fit.method = method;
return
