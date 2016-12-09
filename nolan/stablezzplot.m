function [ ] = stablezzplot( x, theta, param )
%stablezzplot(x,theta,param) produces a zz-plot for a stable fit to the sample in x
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

% plot the data points and vs quantiles of the claimed/null distribution
n = length(x);
p = ((1:n) - 0.5)/n;
sortx = sort(x);
psortx = stablecdf(sortx,theta,param);
zdata = stableinv(psortx,[2 0 1 0],2);
znull = stableinv( p,[2 0 1 0],2);
scatter(znull, zdata, 5, '*');

% add titles, reference line and pointwise 95% confidence limits
str = sprintf('zz-plot of stable distribution vs data, n=%d',n);
title(str);
xstr = sprintf('S(%4.2f,%4.2f,%.3g,%.3g;%1d)',theta(1),theta(2),theta(3),theta(4),param);
xlabel(xstr);
ystr = sprintf('data, n=%d', n);
ylabel(ystr);

line( znull,znull,'Color','red');  
sd = sqrt( p .* (1-p)/n) ./ stablepdf(znull,[2 0 1 0],2);
a = znull + 2*sd;
line(znull,a,'Color','black','LineStyle',':');
b = znull - 2*sd;
line(znull,b,'Color','black','LineStyle',':');
