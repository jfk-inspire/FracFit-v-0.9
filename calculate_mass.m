function mass = calculate_mass(theta,data,pdf_function)

cobs = data.cobs;
tobs = data.tobs;
nobs = length(cobs);
p = pdf_function(theta,data);


%if (strncmp(model,'spatial_fade',12))
num = sum(cobs);
denom = sum(p.^2./cobs);
mass = sqrt(num/denom);
%elseif (strncmp(model,'frac_mobile',11))

%dt = diff(tobs);
%num = (sum(cobs(1:(nobs -1)).*dt) + sum(cobs(2:nobs).*dt))./2;
%v = theta(2);
%mass = num*v;
%end




end


