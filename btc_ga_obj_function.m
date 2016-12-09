function f_i = btc_ga_obj_function(theta,K_mass,data,pdf_function)


cobs = data.cobs;
N_samples = length(cobs);
c_fit = K_mass.*pdf_function(theta,data);
wgts = 1.0./(K_mass.*cobs);
f_i = sum(wgts .* (cobs - c_fit).^2);



end



