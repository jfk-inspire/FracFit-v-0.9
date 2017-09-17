 function mode = mystablemode(theta)
% mode = stablemode(theta)
% theta = [alpha beta gamma delta] is the stable parameter in the ST
% parameterization (1-parameterization).  Returns the mode of stable
% density, replacing STABLEMODE in John Nolan's STABLE toolbox.

% James F. Kelly
% 17 May 2017
 
 alpha = theta(1);
 beta = theta(2);
 gam = theta(3);
 delta = gam*tan(pi*alpha/2)*beta + theta(4);
 pd = makedist('Stable','alpha',alpha,'beta',beta,'gam',gam,...
        'delta',delta);
 med = median(pd);
 tol = 1e-5;
 nx = 10000;
 
 
 if (abs(beta)<tol)
     mode = med;
 
 elseif (beta < 0)
     xstart = med;
     xend = med + 2*abs(med);
     x = linspace(xstart,xend,nx);
     y = pdf(pd,x);
     [ymax, imax] = max(y);
     mode = x(imax);
 
 elseif (beta > 0)
     xstart = med - 2*abs(med);
     xend = med;
     x = linspace(xstart,xend,nx);
     y = pdf(pd,x);
     [ymax, imax] = max(y);
     mode = x(imax);
 end  
     
 end    