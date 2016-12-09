function f_i = frac_mobile_cbtc_obj_function(theta,K_mass,data)

if (length(theta) ~= 3)
    error('frac_mobile_obj_function requires exactly THREE parameters!');
end

cobs = data.cobs;
N_samples = length(cobs);
c_fit = K_mass .* frac_mobile_ccdf_function(theta,data);
wgts = 1.0./sqrt(N_samples*K_mass.*cobs.*(1-cobs));
f_i = wgts .* (cobs - c_fit);

end



