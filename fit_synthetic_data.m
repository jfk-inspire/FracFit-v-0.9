% Addresses Reviewer 1: Test FracFit against synthetic data with known 
% parameters

clear all;

tstart = 50;
tfinal = 2000;
nt = 400;

tslog = log10(tstart);
tflog = log10(tfinal);
data.tobs = logspace(tslog,tflog,nt);
%data.tobs = linspace(tstart,tfinal,nt);
data.x_dist = 1.5;
data.x_dist_units = 'km';
data.type = 'btc';  
data.conc_units = '\mug/L';
data.time_units = 'min';

%model = 'spatial_fade';
%model = 'frac_mobile_diffusion';
model = 'frac_mobile_tempered';

if (strcmp(model,'spatial_fade'))
    theta_true = [1.3 -0.99 0.02 .002];
  
elseif (strcmp(model,'frac_mobile_diffusion'))
    v_t = 0.03;
    theta_true = [.85 v_t .12 .00001];
 
elseif (strcmp(model,'frac_mobile_tempered'))
    v_t = 0.03;
    lambda_t = .003;
    theta_true = [.85 v_t .12 .00001 lambda_t];  
end   
    
[obj_function,xdf_function] = create_model(model,data.type); 
K_true = 25.0;
data.cobs = K_true .* xdf_function(theta_true,data);  
data.cobs = data.cobs;
loglog(data.tobs,data.cobs,'o')
axis tight




%Choose and create the model
[theta_lower, theta_upper, theta0] = get_constraints_and_guess(model,data);
% 
% % Initial guess for mass
 K0 = calculate_mass(theta0,data,xdf_function);
% 
% % BTC_Fit requires iterating for mass
 [theta_fit, K_mass] = btc_fit(theta0, K0, data, ...
     obj_function, xdf_function, theta_lower, theta_upper);
% 
% %Evaluate fit
 c_fit = K_mass .* xdf_function(theta_fit,data);
% 
 figure(2)
 loglog(data.tobs,c_fit,'-',data.tobs,data.cobs,'o')
 set(gca,'FontSize',18)
 timestr = ['Time (' data.time_units ')'];
 xlabel(timestr)
 concstr = ['Concentration (' data.conc_units ')'];
 ylabel(concstr)
 legend('fit','data')
 axis tight
 
 mar = mean(abs(data.cobs - c_fit))
 
 