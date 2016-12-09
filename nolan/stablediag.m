function [ ] = stablediag( x, xrange, continuous )
% stablediag(x,xrange,continuous) fits the data in x and produces 4 diagnostic plots
%   Inputs:
%     x = matrix of data points to plot
%     xrange is the range over which the density plot is shown, defaults to 
%         [min(x) max(x)].  
%     continuous should be 0 (default) for continuous data, 1 for discrete data
%   Outputs: 
%     plot with 4 diagnostic graphs
%
%   Note: the qq- and zz-plots will be slow if there are many points in the x matrix.


if nargin < 2
  xrange = [min(x) max(x)];
end
if nargin < 3
  continuous = 0;
end

if continuous == 0
  sprintf('estimating parameters for continuous data')
  theta = stablefit( x );  % use this for continuous stable
else
  sprintf('estimating parameters for discrete data')
  theta = stablefitdmle( x );  % use this for discrete stable data
end

subplot(2,2,1);
sprintf('density plot...')
stabledensityplot(x, theta, 0, xrange);

subplot(2,2,2);
sprintf('qq plot...')
stableqqplot(x,theta);

subplot(2,2,3);
sprintf('zz plot...')
stablezzplot(x,theta);

subplot(2,2,4); 
sprintf('pp plot...')
stableppplot(x,theta);
