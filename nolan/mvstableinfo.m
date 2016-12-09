function diststr = mvstableinfo( dist )

%MVSTABLEINFO       provides information about a multivariate stable
%                   distribution.
%
% DISTSTR = MVSTABLEINFO( DIST )
%
%   Inputs:
%      DIST    = distribution descriptor (from mvstableisotropic, etc.)
%
%   Outputs:
%      DISTSTR = structure with distribution information
%
%   See also mvstableisotropic, mvstableelliptical, mvstableundefine.

% get data in packed format
[ info, ierr ] = stablemex( 1105, dist );
stablechkerror( ierr, 'mvstableinfo' );

% scalars are in specific locations in info array
diststr.seqnum = info(9);
diststr.alpha = info(10);
diststr.mvstype = info(1);
switch info(1)
  case 101
     diststr.type = 'ISOTROPIC';
  case 102 
     diststr.type = 'ELLIPTICAL';
  case 103 
     diststr.type = 'DISCRETE';
  otherwise
     diststr.type = 'UNKNOWN';
end
diststr.dim = info(3);
diststr.nunif = info(2);
diststr.symmetric = info(4);
diststr.independent = info(5);
diststr.param = info(7);
k = 10+diststr.dim;
diststr.delta = info(11:k);

% matrices are packed in consecutive positions in info array
% unpack the lambda matrix
nlambda = info(6);
if (nlambda > 0) 
  lambda = info((k+1):(k+nlambda));
  if (info(1) == 102)
    % convert the vector lambda into a (d x d) matrix
    tmp = zeros(diststr.dim);
	l = 0;
	for j=1:diststr.dim
	  for i=1:diststr.dim
	    l = l + 1;
		tmp(i,j) = lambda(l);
	  end;
	end;
	diststr.R = tmp;
	lambda = NaN;
	nlambda = 0;
  end;
else 
  lambda = NaN;
end;
diststr.nlambda = nlambda;
diststr.lambda = lambda;

% unpack the s matrix
k = k + nlambda;
ns = info(8);
if (ns > 0) 
  % must have nlambda=dim*nlambda, i.e. nlambda vectors of length dim
  for i=1:nlambda
    for j=1:diststr.dim
	  k = k + 1;
	  s(j,i) = info(k);
	end;
  end;
else
  s = NaN;
end;
diststr.ns = ns;
diststr.s = s;

% unpack the beta vector
if (diststr.mvstype == 103)
  diststr.beta = info((k+1):(k+nlambda));
else
  diststr.beta = NaN;
end;
