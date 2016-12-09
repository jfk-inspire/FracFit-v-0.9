function p = fmim_ccdf_function(theta,data)
% See Eq. (21) in Schumer et. al. "Fractal Mobile-Immobile Solute
% Transport"

if (length(theta) ~= 4)
    error('frac_mobile_ccdf_function requires exactly FOUR parameters!');
end

tobs = data.tobs;
N_samples = length(tobs);
p = zeros(size(tobs));
v = theta(2);
lower_lim = data.x_dist/v;
td = data.inj_time;    %Duration of the continuous injection
x_dist = data.x_dist;
%lower_lim = 0.0;

for i1 =1:N_samples
    t = tobs(i1);
    fun = @(u)frac_integrand3(u,x_dist,td,t,theta);
    p(i1) = quadgk(fun,0,t,'RelTol',1e-8);
end

%CBTC must be normalized to one
p = p./max(abs(p));




end


function y = frac_integrand3(u,x_dist,td,t,theta)


gamma1 = theta(1);
v = theta(2);           %particle velocity
beta = theta(3);        %retention constant
diffusion = theta(4);
skew_factor = abs(cos(pi*gamma1/2.0)).^(1/gamma1);
scale = (beta*u).^(1/gamma1);
theta_tilde = [gamma1 1  skew_factor 0];
 if (gamma1 > 0.2)
     y1 = (1./scale) .* stableqkpdf((t - u)./scale,theta_tilde,1);
 else
   y1 = (1./scale) .* stablepdf((t - u)./scale,theta_tilde,1);
 end

%Construct ADE solution
sigma = 2.0 .* sqrt(diffusion.*u);
C1 = erfc((x_dist-v.*u)/sigma);
C2 = erfc((x_dist-v.*u + v.*td)/sigma);
C = 0.5.*(C1- C2);

%Integrand is subordinator multiplied by ADE solution
y = C.*y1;

end



