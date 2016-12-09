function [ ] = stableqqplot( x, theta, param )
%stableqqplot(x,theta,param)  produces a qq-plot for a stable fit to the sample in x
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
p = ((1:n) - 0.5)/n;
sortx = sort(x);
xfit = stableinv(p,theta,param);
scatter(xfit, sortx, 5, '*');

% add titles, reference line and pointwise 95% confidence limits
str = sprintf('qq-plot of stable distribution vs data, n=%d',n);
title(str);
xstr = sprintf('S(%4.2f,%4.2f,%.3g,%.3g;%1d)',theta(1),theta(2),theta(3),theta(4),param);
xlabel(xstr);
ystr = 'data';
ylabel(ystr);
line(xfit,xfit,'Color','red'); 
sd = sqrt( p .* (1-p)/n) ./ stablepdf(xfit,theta,param);
a = xfit + 2*sd;
line(xfit,a,'Color','black','LineStyle',':');
b = xfit - 2*sd;
line(xfit,b,'Color','black','LineStyle',':');
