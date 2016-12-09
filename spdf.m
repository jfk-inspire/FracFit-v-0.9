function y = spdf(x,theta)
% y = spdf(x,theta)
% Wrapper for stable pdfs
global STABLE_LIBRARY

if STABLE_LIBRARY == 0       %NOLAN
    %theta
    if (theta(1) > 0.2)
        y = stableqkpdf(x,theta,1); 
    else
        y = stablepdf(x,theta,1); 
    end
    
elseif STABLE_LIBRARY == 1   %VEILLETTE
     y = stblpdf(x,theta(1),theta(2),theta(3),theta(4)); 
     
elseif STABLE_LIBRARY == 2   %MATLAB
    alpha = theta(1);
    beta = theta(2);
    gam = theta(3);
    delta = gam*tan(pi*alpha/2)*beta + theta(4);
    pd = makedist('Stable','alpha',alpha,'beta',beta,'gam',gam,...
        'delta',delta);
    y =  pdf(pd,x);
     
else
 error('Not supported!');     
end

