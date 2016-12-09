function p = sfade_pdf_function(theta,data)

if (length(theta) ~= 4)
    error('stable_fit requires exactly FOUR parameters!');
end

tobs = data.tobs;
x_dist = data.x_dist;
N_samples = length(tobs);

alpha = theta(1);          %these are the parameters in fADE 
beta = theta(2);
nu = theta(3);
D = theta(4);

skew_factor = abs(cos(pi*alpha/2.0));
one_over_alpha = 1.0/alpha;
p =zeros(size(tobs));

for it = 1:N_samples
    t = tobs(it);
    sigma = (D*t*skew_factor).^one_over_alpha;
    theta_tilde = [alpha beta sigma nu.*t];
    p(it) = spdf(x_dist,theta_tilde);
end


end



