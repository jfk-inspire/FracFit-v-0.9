function theta0 = compute_fmim_guess(data)

tobs = data.tobs; cobs = data.cobs;


%Get mode from Data
[cmax, imax] = max(cobs);
tmode = tobs(imax);

%Get median from data
nobs = length(cobs);
%dt = diff(tobs);
%Construct emprical CDF
ecdf = zeros(nobs,1);
for n = 2:nobs
    dt = tobs(n) - tobs(n-1); 
    ecdf(n) = ecdf(n-1) + dt.*(cobs(n) + cobs(n-1))/2;
end
moment0 = ecdf(nobs);
%normalize
ecdf = ecdf./moment0;

%Calculate Median
[cmed, imed] = min(abs(ecdf - .5));
tmed = tobs(imed);

% Mode and Median for standard stable
gamma = 0.75;
skewfac = (cos(pi*gamma/2)).^(1/gamma);
mode0 = stablemode([gamma 1 skewfac 0],1);
median0 = stableinv(0.5,[gamma 1 skewfac 0],1);

%Estimate velocity
x = data.x_dist;
v1 = (median0 - mode0)./(tmode.*median0 - tmed.*mode0) .* x;
v1 = abs(v1);

%Estimate capacity coefficient
beta = (abs(tmode - x/v1)).^gamma .* v1 ./ (x*mode0^gamma);


%f = @(v) v*tmode - x - mode0 .*(beta.*x).^(1/gamma) .* v.^(1 - 1/gamma);
%v0 = x/tmode;
%v1 = fzero(f,v0);


nobs = length(cobs);
dt = diff(tobs);
num = (sum(cobs(1:(nobs -1)).*dt) + sum(cobs(2:nobs).*dt))./2;
%K_mass = num*v1;

%D0 = .01;         %Arbitrary
[cmax, imax] = max(cobs);
tpeak = tobs(imax);
ileft = find(cobs./cmax <0.5);
ileft2 = find(tobs<tpeak);
ithalf_left = max(intersect(ileft,ileft2));
tleft = tobs(ithalf_left);
twidth = tpeak - tleft;
xwidth = v1 * twidth;
D0 = xwidth.^2 / (4*tpeak*log(2));






%theta0 = [gamma v1 beta D0 K_mass];
theta0 = [gamma v1 beta D0];
end



