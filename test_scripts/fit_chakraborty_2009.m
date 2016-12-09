% Recreates Fig. 4, panel 2 in Chakroborty, Meerschaert, and Lim, WRR:45, 2009
% James F. Kelly

clear all;
load data/red_cedar_exp3/testdata_3.1km.mat;

%Choose and create the model
model = 'sfade';
[obj_function,pdf_function] = create_model(model,data.type);

% Get Default Initial guess for parameter and
% default constraints
[theta_lower, theta_upper, theta0] = get_constraints_and_guess(model,data);

% Override defaults here (optional)
% GA needs a much tighter search region (using current options)
theta_lower = [1.05 -1 0.1*theta0(3) 0.1*theta0(4)];
theta_upper = [1.99 1 10*theta0(3) 10*theta0(4)];


% Estimate Mass
K0 = calculate_mass(theta0,data,pdf_function);

% Fit Pulse Initial Condition
[theta_fit, K_mass, n_iter] = btc_fit(theta0, K0, data, ...
    obj_function, pdf_function, theta_lower, theta_upper);


%Evaluate fit
c_fit = K_mass .* pdf_function(theta_fit,data);


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
