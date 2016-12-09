clear all;
N = 1000;
beta1 = .7;
g = (cos(pi*beta1/2)).^(1/beta1);
theta = [beta1 1 g 0]; 
A = 2.0;
B = 0.1;
J_i = stablernd(N,theta,1);           %Waiting Times
Y_i = A.*J_i + B;                     %Jumps 
time = zeros(N,1);
x_pos = zeros(N,1);
time(1) = 0.0;
x_pos(1) = 0.0
for i1 =1:(N -1)
    time(i1+1) = time(i1) + J_i(i1);
    x_pos(i1 + 1) = x_pos(i1) + Y_i(i1);
end



