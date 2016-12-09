%stabletest     script to test stable interface
format short

help stableversion
stableversion;

x = 1:4;
theta = [1.3 0 1 0];

help stablepdf
f = stablepdf(x,theta)
logpdf = log(f); % save for below

help stableqkpdf
f = stableqkpdf(x,theta)

help stableqklogpdf
stableqklogpdf(x,theta)
logpdf % compare to previously calculated log(stablepdf(x))

% simple density plot
xx = -4:0.05:4;
f1 = stablepdf(xx,[1.3 0 1 0]);
f2 = stablepdf(xx,[2 0 1 0]); % N(0,sqrt(2)) not N(0,1)
figure;
plot(xx,f1,xx,f2);
title('plot of stable densities with alpha=1.3 (blue) and alpha=2 (green)')

help stablecdf
F = stablecdf(x,theta)

help stablepdfderiv
fp = stablepdfderiv(x,theta)

help stablepdfsecondderiv
fpp = stablepdfsecondderiv(x,theta)

% plot of cdf F, pdf f, deriv. f', and second deriv. f''
xx = -4:0.05:4;
f1 = stablecdf(xx,[1.3 0 1 0]);
f2 = stablepdf(xx,[1.3 0 1 0]);
f3 = stablepdfderiv(xx,[1.3 0 1 0]);
f4 = stablepdfsecondderiv(xx,[1.3 0 1 0]);
figure;
plot(xx,f1,xx,f2,xx,f3,xx,f4);
title('plot of stable cdf (blue), pdf f (green), deriv. of f'' (red), and second deriv. f'''' (aqua) ')


help stableqkcdf
F = stableqkcdf(x,theta)

help stableinv
xx = stableinv(F,theta)
help stableqkinv
xx = stableqkinv(F,theta)

help stablehazard
h = stablehazard(x,theta)
help stableqkhazard
h = stableqkhazard(x,theta)

help stablernd
z = stablernd(10,theta)

help stablenonlinfn
g = stablenonlinfn(x,theta)

help stableqknonlinfn
stableqknonlinfn(x,theta,1)
stableqknonlinfn(x,theta,2)
stableqknonlinfn(x,theta,3)

help stablemode
stablemode(theta)

help stablesettolerance
stablesettolerance(1,1.2345e-014)

help stablegettolerance
stablegettolerance(1)

help stableconvert
stableconvert(0,theta,1)

help stableomega
u = 0:3;
stableomega(u,[1.3 0.5 1 0],1)

theta0 = [1.3 0.5 3 0];
z = stablernd(1000,theta0);
help stablefit
fprintf('Fitting for simulated data with \n  theta= %f %f %f %f (1000 point data set) \n',theta0);
for i = 1:7
  theta = stablefit(z,i);
  fprintf('method= %d   theta= %f %f %f %f\n',i,theta);  
end;
fprintf('\n\n');

help stablediag
figure;
stablediag(z)

help stablefitmle
thetamle = stablefitmle(z)

help stablefitmleci
halfwidth = stablefitmleci(thetamle,length(z),1.96)
fprintf('             max likelihood     95%% confidence interval\n parameter     estimate           based on n=%d points:\n',length(z));
a = ['alpha'; 'beta '; 'gamma'; 'delta'];
for i = 1:4
  fprintf('    %s    %f          %f to %f\n',a(i,:),theta(i),theta(i)-halfwidth(i),theta(i)+halfwidth(i));  
end;
fprintf('\n\n')

help stablemleinfomatrix
stablemleinfomatrix(thetamle)

help stablefitquant
thetaquant = stablefitquant(z)
stablefit(z,2)

help stablefitecf
stablefitecf(z,thetaquant(3),thetaquant(4) )
stablefit(z,3)

help stableloglik
stableloglik(z,thetamle)

help stableqkloglik
stableqkloglik(z,thetamle)

help stableksgof
stableksgof(z,thetamle)

help stablelrt
stablelrt(z,[2 2],[0 0])

help stablechisq
stablechisq(z,thetamle,10)

help stableregression
% generate data
xx = (-10:.25:10);
x = [ones(1,length(xx)); xx]';
e = stablernd( length(xx), [1.2 0 1 0]);
y = x * [8;5] + e';
% fit data
fit = stableregression(x,y)
% plot the data, regression line and residuals
figure;
subplot(2,1,1);
scatter(xx,y,'.');
title('data points and regression line');
yy = x * fit.theta';
line(xx,yy,'Color','red');
subplot(2,1,2);
residuals = y - yy;
scatter(xx,residuals,'.');
title('residuals');

% test error checking and reporting
%f = stablepdf(x,[3.0 0 1 0])
%f = stablepdf(x)
%f = stablepdf(x,[3.0])

fprintf('\nEnd of univariate test script\n\n')

