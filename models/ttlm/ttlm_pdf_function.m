function p = ttlm_pdf_function(theta,data)
% See Eq. (9) in Meerschaert et. al. "Tempered anomalous diffusion in 
% heterogeneous systems".  
% theta = (gamma1, v, beta, D, lambda)

if (length(theta) ~= 5)
    error('frac_mobile_tempered_pdf_function requires exactly FOUR parameters!');
end

tobs = data.tobs;
N_samples = length(tobs);
p = zeros(size(tobs));
tol = 1e-6;
gamma1 = theta(1);
x = data.x_dist;
v = theta(2);           %particle velocity
beta = theta(3);
D = theta(4);
lambda = theta(5);

nu = v*x/(4*D);
mu = beta*x/v;
tau0 = x/v;
prefac = sqrt(nu/pi)/v;


% Quadgk is overkill, but it's the only way to accureately 
% compute the tails.  Tried quad and quadl and the tails are
% not caputred.
for i1 =1:N_samples
    t = tobs(i1);
   
    fun = @(tau)frac_integrand(tau,t,tau0,mu,nu,lambda,gamma1);
    if (t < tau0)
        low_limit = -1;
        upper_limit = t/tau0 - 1;
        c1 = quadgk(fun,low_limit,upper_limit,'RelTol',1e-6);
        c2 = 0;
    else
        low_limit = -1;
        upper_limit = 0;
        c1 = quadgk(fun,low_limit,upper_limit,'RelTol',1e-6);
        low_limit = 0;
        upper_limit = t/tau0 - 1;
        c2 = quadgk(fun,low_limit,upper_limit,'RelTol',1e-6);
    end
        
    p(i1) = prefac .* (c1 + c2);
   

end
end


function y = frac_integrand(tau,t,tau0,mu,nu,lambda,gamma1)

scale = (mu.*(1 + tau)).^(1/gamma1);
skew_factor = abs(cos(pi*gamma1/2.0)).^(1/gamma1);
theta_tilde = [gamma1 1  skew_factor 0];
lambdag = lambda^gamma1;
%theta_tilde
p = (1./scale) .* spdf((t - tau0.*(1 + tau))./scale,theta_tilde);
fac2 = exp(-nu .* tau.^2./(1+tau) + lambdag.*mu.*(1+tau));
fac3 = 1./sqrt( (1 + tau));
fac4 = exp(-lambda.*(t - tau));
y = p.*fac2 .* fac3 .* fac4;


end





