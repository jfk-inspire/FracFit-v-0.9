function p = tfde_ccdf_function(theta,data)

if (length(theta) ~= 3)
    error('tfde_pdf_function requires exactly THREE parameters!');
end

tobs = data.tobs;
N_samples = length(tobs);
p = zeros(size(tobs));
tol = 1e-6;
gamma1 = theta(1);
x = data.x_dist;
v = theta(2);           %particle velocity
D = theta(3);


for i1 =1:N_samples
    t = tobs(i1);
    fun = @(u)frac_integrand_tfde2(u,t,x,gamma1,v,D);
    p(i1) = quadgk(fun,0,inf,'RelTol',tol);
   
end

end

function y = frac_integrand_tfde2(u,t,x,gamma1,v,D)
    
    skew_factor = abs(cos(pi*gamma1/2.0));
    theta1 = [gamma1 1 skew_factor 0];
    us = u.^(-1/gamma1);
    g_gam =  us.* spdf(t.*us,theta1);
    h_gam = t./gamma1./u .* g_gam;      %construct density of ISS
    exparg = (x - v.*u)./(2.*D.*u);
    c_cbtc = 0.5 .* erfc(exparg);
    y = h_gam .* c_cbtc;
    
end





