% Recreates Fig. 4, panel 2 in Chakroborty, Meerschaert, and Lim, WRR:45, 2009
% James F. Kelly

clear all;
load data/diogo_cbtc/data_PSS4600.mat

%Choose and create the model
model = 'tfde';
[obj_function,ccdf_function] = create_model(model,data.type);

% Get Default Initial guess for parameter and
% default constraints
[theta_lower, theta_upper, theta0] = get_constraints_and_guess(model,data);

% Override defaults here (optional)
theta_lower = [0.5 0.1*theta0(2) 0.1*theta0(3)];
theta_upper = [0.99 10*theta0(2) 10*theta0(3)];

 [theta_fit, K_mass] = cbtc_fit(theta0, data, ...
    obj_function, theta_lower, theta_upper, ccdf_function)


%Evaluate fit
c_fit = K_mass .* ccdf_function(theta_fit,data);


%Visualize Results
figure(1)
plot(data.tobs,c_fit,'-',data.tobs,data.cobs,'o')
set(gca,'FontSize',18)
timestr = ['Time (' data.time_units ')'];
xlabel(timestr)
concstr = ['Concentration (' data.conc_units ')'];
ylabel(concstr)
legend('fit','data')
titlestr = [num2str(data.x_dist) ' ' data.x_dist_units ' from injection site'];
title(titlestr);
