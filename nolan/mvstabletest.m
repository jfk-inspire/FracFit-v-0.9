%mvstabletest     script to test multivariate stable interface 
format short

% isotropic distribution
help mvstableisotropic
diso = mvstableisotropic( 1.3, 2, 5, [1 2]);

% independent components
help mvstableindep
dindep = mvstableindep( 1.3, [0 1], [2 3], [4 5], 0 );

% elliptical distribution
help mvstableelliptical
dellip = mvstableelliptical( 1.3, [2 .5; .5 2], [0 0] );

% 2 dim. discrete spectral measure
help mvstablediscspecmeas2d
ddisc = mvstablediscspecmeas2d( 1.3, [0 pi/4 pi/2], [1 2 3], [0 0 1], [4 5], 0);

help mvstableconvert
new1 = mvstableconvert( ddisc, 1 )
new2 = mvstableconvert( new1, 0 )

% 3 dim. discrete spectral measure
help mvstablediscspecmeas
ddisc3d = mvstablediscspecmeas(1.3, [1 0 0; 0 1 0; 0 0 1], [1 2 3], [0 .5 1], [4 5 6], 1 );

help mvstableinfo
mvstableinfo(diso)

% basic functions - pdf, cdf, rnd
help mvstablepdf
x = [0 0 1; 0 1 0]
mvstablepdf(diso,x)

help mvstablecdf
mvstablecdf(diso, [0 0], [1 3])

help mvstablecdfmc
mvstablecdfmc(diso, [0 0]', [1 3]', 10000)

help mvstablernd
mvstablernd(diso,5)

help mvstablefindrectangle
mvstablefindrectangle(diso, 0.90 )

x = mvstablernd(diso,1000);
help mvstableloglik
mvstableloglik( diso, x )

help mvstableqkloglikisotropic2d
mvstableqkloglikisotropic2d( x, 1.3, 2, [0 0])

help mvstablefit
x = mvstablernd(diso,10000);
mvstablefit(x, 40, 3, 2, 1)

help mvstablefitelliptical
fit=mvstablefitelliptical( x, 1 );
fit.shift
fit.R


help mvstableparfn2d
angle = 0.0:pi/50.0:2*pi;
parfn = mvstableparfn2d(diso, angle)

help mvstablefitparfn2d
angle = 0.0:(pi/20):(2*pi);
mvstablefitparfn2d( x, angle, 3, 0 )

help mvstableundefine
mvstableundefine( dindep )


% amplitude calculations
help mvstableamplitudepdf
r = 0:1:5;
f = mvstableamplitudepdf(r, 1.3, 1.0, 2 )

help mvstableqkamplitudepdf2d
f = mvstableqkamplitudepdf2d(r, 1.3, 1.0 )

help mvstableamplitudecdf
F = mvstableamplitudecdf(r, 1.3, 1.0, 2 )

help mvstableamplitudenonlinfn
mvstableamplitudenonlinfn(r,2)

help mvstableamplitudeinv
p = 0:0.1:0.9;
r = mvstableamplitudeinv( p, 1.3, 1.0, 2 )
F = mvstableamplitudecdf( r, 1.3, 1.0, 2 )

help mvstableamplitudernd
r = mvstableamplitudernd( 1000, 1.3, 1.0, 2 );
r1 = r(r < 10);
figure;
hist(r1);
title('amplitude simulation, dim=2');

help mvstablefitamplitude
mvstablefitamplitude(r,2)

% add plots of pdf, simulations, parfns

% plots of parfns
figure;
subplot(2,2,1);
set(gcf,'Color','white')

plot(parfn(:,1), parfn(:,2),'Color','red','LineWidth',2);
xlim([0 2*pi])
ylim([0 2])
set(gca,'XTick',0:pi/2:2*pi);
set(gca,'XTickLabel',{'0','pi/2','pi','3 pi/2','2 pi'});
title('\alpha(\theta)')

subplot(2,2,2);
plot(parfn(:,1), parfn(:,3),'Color','red','LineWidth',2);
xlim([0 2*pi])
ylim([-1 1])
set(gca,'XTick',0:pi/2:2*pi);
set(gca,'XTickLabel',{'0','pi/2','pi','3 pi/2','2 pi'});
title('\beta(\theta)')

subplot(2,2,3);
plot(parfn(:,1), parfn(:,4),'Color','red','LineWidth',2);
xlim([0 2*pi])
ymax = 1.2*max(parfn(:,4));
ylim([0 ymax])
set(gca,'XTick',0:pi/2:2*pi);
set(gca,'XTickLabel',{'0','pi/2','pi','3 pi/2','2 pi'});
title('\gamma(\theta)')

subplot(2,2,4); 
plot(parfn(:,1), parfn(:,5),'Color','red','LineWidth',2);
title('\delta(\theta)')
xlim([0 2*pi])
set(gca,'XTick',0:pi/2:2*pi);
set(gca,'XTickLabel',{'0','pi/2','pi','3 pi/2','2 pi'});

fprintf('Figure window shows results of mvstablefitparfn2d\n')


fprintf('\nEnd of multivariate test script\n\n')

