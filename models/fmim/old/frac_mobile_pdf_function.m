function p = frac_mobile_pdf_function(theta,data)
% p = frac_mobile_pdf_function(theta,data)
% See Eq. (21) in Schumer et. al. "Fractal Mobile-Immobile Solute
% Transport"

if (length(theta) ~= 3)
    error('frac_mobile_pdf_function requires exactly THREE parameters!');
end

x_dist = data.x_dist;
tobs = data.tobs;
gamma1 = theta(1);
v = theta(2);
beta = theta(3);
skew_factor = abs(cos(pi*gamma1/2.0))^(1/gamma1);
scale = (beta*x_dist/v)^(1/gamma1);
theta_tilde = [gamma1 1  skew_factor 0];
p =  1./(v*scale) .* spdf((tobs - x_dist/v)./scale,theta_tilde);



end



