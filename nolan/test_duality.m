% 
clear all;
x = 0.1:0.1:10;
alpha1 = 3/2;
beta1  = -1;
sigma1 = abs(cos(pi*alpha1/2))^(1/alpha1);
theta1 = [alpha1 beta1 sigma1 0];
y1 = stablepdf(x,theta1,1);

%figure(1)
%plot(x,y1)

alpha2 = 1/alpha1;
beta2 = 1;
sigma2 = abs(cos(pi*alpha2/2))^(1/alpha2);
theta2 = [alpha2 beta2 sigma2 0];
y2 = x.^(-(1+alpha1)).* stablepdf(x.^(-alpha1),theta2,1);

figure(1)
plot(x,y1,'-',x,y2,'--')
legend('y1','y2')


x = -10:0.1:-0.1;
y1n = stablepdf(x,theta1,1);


alpha2 = 1/alpha1;
beta2 = 0;
%sigma2 = abs(cos(pi*alpha2/2))^(1/alpha2);
sigma2 = 1;
theta2 = [alpha2 beta2 sigma2 0];
xa = abs(x);
y2n = xa.^(-(1+alpha1)).* stablepdf(xa.^(-alpha1),theta2,1);



figure(2)
plot(x,y1n,'-',x,y2n,'--')