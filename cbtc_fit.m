function [theta_fit, K_mass] = cbtc_fit(theta0, data, ...
    obj_function, theta_lower, theta_upper, ccdf_function)

% Performs nonlinear least squares fit using an initial guess theta0,  
% and data.  Data consists of the observation times,
% the CBTC data, and spatial location x_dist.
% The user must supply:
% 1: An objective function obj_function that takes 
% (theta, K, tobs, cobs) as arguements and optimizes theta subject to the
% bounds theta_lower <= theta <= theta_upper and
% 2: A PDF function which used in the mass calculation
% K = CBTC fits

% James F. Kelly
% 12 December 2016
global OPTIM_FUNCTION                 %0 = LSQNONLIN or 1 = GA
ntheta = length(theta0);           %number of parameters
K_mass = 1.0;

if (OPTIM_FUNCTION == 0)
    options = optimset('TolFun',1e-8);
    theta_fit = theta0;
    f = @(theta) obj_function(theta,K_mass,data, ccdf_function);
    theta_fit = lsqnonlin(f,theta_fit,theta_lower,theta_upper,options);
elseif (OPTIM_FUNCTION == 1)
    options = optimoptions('ga');
    options = optimoptions(options,'PopulationSize',200);
    options = optimoptions(options,'MaxGenerations',800);    
    f = @(theta) obj_function(theta,K_mass,data,ccdf_function);
    theta_fit = ga(f,ntheta,[],[],[],[],theta_lower,theta_upper,[],options);
else
    error('only LSQNONLIN and GA are supported');
end    
    

end
