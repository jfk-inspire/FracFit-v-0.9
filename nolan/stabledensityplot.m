function [ ] = stabledensityplot( x, theta, param, xrange, width )
% stabledensityplot(x,theta,param,xrange,width)
% produces a plot that compares the smoothed sample
% density for the data in x and the stable density with parameters
% theta.  This routine is not meant to simply plot a stable pdf.
%
%   x     = sample data
%   theta = stable parameters [alpha beta gamma delta]. If not specified,
%           stablefit is called to estimate theta from x
%   param = parameterization, defaults to 0
%   xrange = [a b] is the interval to display the density over.
%           Defaults to the interval [min(x),max(x)].  For long tails,
%           manually set this to a smaller range, e.g. 5 to 95 percentiles.
%   width = width of the window to be used for smoothing the sample
%           density.  Defaults to 2*(interquartile range)/n^(1/3).  For
%           low alpha or small samples, manually change to get reasoanble plot.


if nargin < 3
  param = 0;
end
if nargin < 2
  theta = stablefit( x, 1, param );
end
nx = length(x);
if nargin < 5
  xsort = sort(x);
  i75 = round(0.75*nx);
  i25 = max(1,round(0.25*nx));
  iqr = xsort(i75) - xsort(i25);
  width = 2*iqr*nx^(-1/3);
end
if nargin < 4
  xrange = [min(x) max(x)];
end

% plot both data and stable densities at u(1),...,u(nu) - an equally
% spaced grid covering the range from xrange(1) to xrange(2).
nu = 101;
du = (xrange(2) - xrange(1))/(nu-1);
u = xrange(1):du:xrange(2);
y = stablepdf(u, theta, param );
y1 = smooth(x, u, width );
plot(u,y,'Color','blue');
line(u,y1,'LineStyle',':','Color','red');
str1 = sprintf('S(%4.2f,%4.2f,%.3g,%.3g;%1d] pdf',theta(1),theta(2),theta(3),theta(4),param);
str2 = sprintf('smoothed data, width=%.3g',width);
legend(str1,str2,0);
str3 = sprintf('density plot of stable distribution vs data, n=%d', nx);
title(str3);

function pdf = smooth( x, u, width )
% smooth data in x with Gaussian kernel
nu = length(u);
nx = length(x);
pdf = zeros(nu);
c = -0.5/width^2;
d = 1/(nx*width*2.506628275);
for i=1:nu
  for j=1:nx
    pdf(i)=pdf(i) + exp( c*(x(j)-u(i))^2 );
  end
  pdf(i) = pdf(i)*d;
end
