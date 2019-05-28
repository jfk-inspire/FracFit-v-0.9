function p = ttlm_ccdf_function(theta,data)
% See Eq. (9) in Meerschaert et. al. "Tempered anomalous diffusion in 
% heterogeneous systems".  
% theta = (gamma1, v, beta, D, lambda)

if (length(theta) ~= 5)
    error('frac_mobile_tempered_pdf_function requires exactly FIVE parameters!');
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

td = data.inj_time;    %Duration of the continuous injection
x_dist = data.x_dist;

for i1 =1:N_samples
    t = tobs(i1);
    fun = @(u)frac_integrand4(u,x_dist,td,t,theta);
    p(i1) = quadgk(fun,0,t,'RelTol',1e-8);
  end


end


function y = frac_integrand4(u,x_dist,td,t,theta)


gamma1 = theta(1);
v = theta(2);           %particle velocity
beta = theta(3);        %retention constant
diffusion = theta(4);
lambda = theta(5);
skew_factor = abs(cos(pi*gamma1/2.0)).^(1/gamma1);
scale = (beta*u).^(1/gamma1);
theta_tilde = [gamma1 1  skew_factor 0];
 if (gamma1 > 0.2)
     y11 = (1./scale) .* spdf((t - u)./scale,theta_tilde);
 else
 end
expfac = -lambda.*t + u .*beta.*lambda^gamma1;
y1 = y11 .* exp(expfac);


%end

%Construct ADE solution
sigma = 2.0 .* sqrt(diffusion.*u);
C1 = erfc((x_dist-v.*u)/sigma);
C2 = erfc((x_dist-v.*u + v.*td)/sigma);
C = 0.5.*(C1- C2);

%Integrand is subordinator multiplied by ADE solution
y = C.*y1;

end








