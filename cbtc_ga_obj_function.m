function f_i = cbtc_ga_obj_function(theta,K_mass,data,ccdf_function)

tol = 1e-2;


cobs = data.cobs;
N_samples = length(cobs);
c_fit = K_mass.*ccdf_function(theta,data);
wgts = ones(size(cobs));
for isamp = 1:N_samples
    cob = cobs(isamp);
    if (cob > tol & cob < (1 - tol))
        wgts(isamp) = 1.0./(N_samples*K_mass.*cob.*(1 -cob));
    else
        wgts(isamp) = 0.0;
    end
end    
f_i = sum(wgts .* (cobs - c_fit).^2);

end



