function f_i = btc_lsqnonlin_obj_function(theta,K_mass,data,pdf_function)


cobs = data.cobs;
N_samples = length(cobs);
c_fit = K_mass.*pdf_function(theta,data);
wgts = 1.0./sqrt(N_samples*K_mass.*cobs);
f_i = wgts .* abs(cobs - c_fit);

end



