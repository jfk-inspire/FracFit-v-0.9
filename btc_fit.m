function [theta_fit, K_mass, n_iter] = btc_fit(theta0, K0, data, ...
    obj_function, pdf_function, theta_lower, theta_upper)

% Performs WNLS using an initial guess theta0, a 
% guess for mass K0, and data.  Data consists of the observation times,
% the BTC data, and spatial location x_dist.
% The user must supply:
% 1: An objective function obj_function that takes 
% (theta, K, tobs, cobs) as arguements and optimizes theta subject to the
% bounds theta_lower <= theta <= theta_upper and
% 2: A PDF function which used in the mass calculation

% James F. Kelly
% 8 December 2016
global OPTIM_FUNCTION                 %0 = LSQNONLIN or 1 = GA


N_ITER_MAX = 30;
tol = 1e-3;
K_mass = K0;
theta_fit = theta0;
ntheta = length(theta_fit);    %number of parameters

for n_iter = 1:N_ITER_MAX

n_iter
theta_fit
clear f;
if (OPTIM_FUNCTION == 0)
    f = @(theta) obj_function(theta,K_mass,data,pdf_function);
    theta_fit = lsqnonlin(f,theta_fit,theta_lower,theta_upper);
elseif (OPTIM_FUNCTION == 1)
    % Optimize these options...
    options = optimoptions('ga');
    options = optimoptions(options,'PopulationSize',200);
    options = optimoptions(options,'MaxGenerations',800);    
    f = @(theta) obj_function(theta,K_mass,data,pdf_function);
    theta_fit = ga(f,ntheta,[],[],[],[],theta_lower,theta_upper,[],options);
else
    error('only LSQNONLIN and GA are supported');
end    



K_mass_new = calculate_mass(theta_fit,data,pdf_function);
stop_criterion = abs(K_mass - K_mass_new)./abs(K_mass_new);

if ( stop_criterion < tol)
    break;
else
    K_mass = K_mass_new;
end 


end

end
