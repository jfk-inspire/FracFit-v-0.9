function [ ] = stableppplot( x, theta, param )
%stableqppplot(x,theta,param) produces a pp-plot for a stable fit to the sample in x
%   x     = sample data
%   theta = stable parameters [alpha beta gamma delta]. If not specified, 
%           stablefit is called to estimate theta from x
%   param = parameterization, defaults to 0

if nargin < 3
  param = 0;
end
if nargin < 2
  theta = stablefit( x, 1, param );
end

% plot the data points and vs quantiles of the claimed distribution
n = length(x);
p = ((1:n) - .5)/n;
sortx = sort(x);
xdata = stablecdf(sortx,theta,param);
scatter(p, xdata, 5, '*');

% add titles, reference line and pointwise 95% confidence limits
str1 = sprintf('pp-plot of stable distribution vs data, n=%d',n);
title(str1);
xstr = sprintf('S(%4.2f,%4.2f,%.3g,%.3g;%1d)',theta(1),theta(2),theta(3),theta(4),param);
xlabel(xstr);
ystr = 'data';
ylabel(ystr);
line(p,p,'Color','red');  
sd = sqrt( p .* (1-p)/n);
a = p + 2*sd;
line(p,a,'Color','black','LineStyle',':');
b = p - 2*sd;
line(p,b,'Color','black','LineStyle',':');
