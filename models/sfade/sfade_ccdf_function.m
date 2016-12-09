function p = sfade_ccdf_function(theta,data)

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
    term1 = 1 - scdf(x_dist,theta_tilde);
    % Some CBTCs have a cutoff time
    if (data.inj_time > 0)
      tc = data.inj_time
      theta_tilde = [alpha beta sigma nu.*(t-tc)];
      term2 = 1 - scdf(x_dist,theta_tilde);
      p(it) = term1 - term2;
    else  
      p(it) = term1;
    end  
    %p(it) = 1 - stableqkcdf(x_dist,theta_tilde,1); 
end


end



