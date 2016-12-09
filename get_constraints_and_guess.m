function [theta_lower, theta_upper, theta0] = get_constraints_and_guess(model,data)
% [theta_lower, theta_upper] = get_constraints(model)
% Given a string with the model name, determine the lower and upper
% constraints on the parameter theta that is being optimized.
% Also returns a (crude) initial guess.  You may want to override this
% guess with a "hand fit".

if (not(ischar(model)))
error('model must be a character array');
end

if (strcmp(data.type,'btc'))
    [cmax, imax] = max(data.cobs);
    v0 = data.x_dist/data.tobs(imax);   
elseif (strcmp(data.type,'cbtc'))
    imedian = min(find(data.cobs>0.5));
    v0 = data.x_dist/data.tobs(imedian); 
else
     error('Data type not supported.');         
end

if (strcmp(model,'sfade'))
    %theta_lower = [0.001 -1 1e-7 1e-7];
    theta_lower = [1.01 -1 1e-7 1e-7];
    theta_upper = [2 1 1e9 1e9];
    theta0 = [1.5 0 v0 .001];
elseif (strcmp(model,'sfade_negskew'))
    theta_lower = [0.001 -1 1e-7 1e-7];
    theta_upper = [2 -.999 1e9 1e9];
    theta0 = [1.95  -1 v0 .00001];
elseif (strcmp(model,'ade'))               
    theta_lower = [1.9999 -1 1e-7 1e-3];
    theta_upper = [2 1 1e9 1];
    theta0 = [2  0 v0 .00001];  
elseif (strcmp(model,'tfde'))
    theta_lower = [0.1 1e-7 1e-7];
    theta_upper = [0.99 1000 1000]; 
    theta0 = [0.9  0.2 0.04];
elseif (strcmp(model,'fmim'))
    theta_lower = [0.1 1e-7 1e-7 1e-7];
    theta_upper = [0.99 1000 1000 1000]; 
    theta0 = compute_fmim_guess(data);
    
elseif (strcmp(model,'ttlm'))
    theta_lower = [0.1 1e-7 1e-7 1e-7 1e-7];
    theta_upper = [0.99 1000 1000 1000 1000]; 
    theta01 = compute_fmim_guess(data);
    tmax = max(data.tobs);
    lambda0 = 1/tmax;
    theta0 = [theta01(1) theta01(2) theta01(3) theta01(4) lambda0]; 
  
else
    error('Model not supported.');         
end

end


