%discretetest     script to test discrete stable interface 
format short

x = [0 1 2 3 4 5];
theta = [1.3 0.5 1.0 0.0]

help stablepdfdiscrete
stablepdfdiscrete(x,theta)

help stableqkpdfdiscrete
stableqkpdfdiscrete(x,theta)

help stablecdfdiscrete
stablecdfdiscrete(x,theta)

help stableqkcdfdiscrete
stableqkcdfdiscrete(x,theta)

help stablernddiscrete
stablernddiscrete(10,theta )

help stablernddiscrete2
stablernddiscrete2(10,theta )

help stablediscretefindgamma
stablediscretefindgamma(theta)

help stablefitdmle
data = stablernddiscrete2( 10000, theta );
stablefitdmle( data )
stablefitdmle( data, [-128 127], 2 )

help mvstablepdfdiscrete2d
dist = mvstableisotropic( 1.5, 2, 1, [0 0]);
mvstablepdfdiscrete2d( dist, [0 1 0;0 0 1],[-128 127],0.01,0)


fprintf('\nEnd of discrete stable test script\n\n')
