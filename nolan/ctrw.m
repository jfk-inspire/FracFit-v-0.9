clear all;
N_particles = 1e5;

N = 1000;     %number of jumps a particle takes
Np1 = N +1;
alpha = 1.5;
g = (abs(cos(pi*alpha/2))).^(1/alpha);
theta = [alpha -1 g 0]; 
A = 0.3;
B = 1.0;
wait_time =1;

time_obs = 500;
x_obs = zeros(N_particles,1);      %snapshot


for ipart = 1:N_particles
ipart

Y_i = A.*stablernd(N,theta,1) + B;           %Waiting Times
x_pos = zeros(Np1,1);
x_pos(2:Np1) = cumsum(Y_i);
time = (0:N).*wait_time;

x_obs(ipart) = x_pos(501);

end

figure(1)
h = histogram(x_obs)
h.BinWidth = 5;
histmax = 1.2e4;
axis([300 600 0 histmax]) 



%plot(time,x_pos)


%for i1 =1:(N -1)
    %time(i1+1) = time(i1) + J_i(i1);
%    x_pos(i1 + 1) = x_pos(i1) + Y_i(i1);
%end



