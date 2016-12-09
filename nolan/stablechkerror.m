function stablechkerror( ierr, funcname ) 

%STABLECHKERROR     stable distribution error checking and reporting
%
%   STABLECHKERROR( IERR, FUNCNAME )
%
%   Inputs:
%      IERR = error code
%      FUNCNAME = character string giving the function name where error occurred
%
%   Warnings allow you to continue, errors stop the computation.
%   You can control these warnings using matlab's built in controls.
%   To turn off all warnings, use:         warning off all 
%   To turn off a specific warning, use:   warning off Stable:warnapr 


% does nothing if ierr <= 0; if ierr > 0, prints out a message saying what
% the error is, function where the problem occured.
if( ierr > 0 ) 
    switch ierr
    case 1
        msgstring = 'Invalid input parameter';
        msgid = 'Stable:errpar';
        msgtype = 'error';
    case 2
        msgstring = 'alpha parameter outside of tabulated values in QKSTABLE';
        msgid = 'Stable:errtab';
        msgtype = 'error';      
    case 3
        msgstring = 'Too many data points for internal array';
        msgid = 'Stable:errsiz';
        msgtype = 'error';
    case 4
        msgstring = 'Error computing the likelihood, e.g. pdf=0';
        msgid = 'Stable:errlik';
        msgtype = 'error';
    case 5
        msgstring = 'Possible approx. error while using QKSTABLE for alpha or beta near boundary';
        msgid = 'Stable:warnapr';
        msgtype = 'warning';
    case 6
        msgstring = 'Possible error in confidence intervals because parameter is near boundary';
        msgid = 'Stable:warnbnd';
        msgtype = 'warning';
    case 7
        msgstring = 'alpha and/or beta rounded to a special value, adjust tol(4)';
        msgid = 'Stable:warnrnd';
        msgtype = 'warning';
    case 8
        msgstring = 'alpha is at lower bound for search, may not have found best value for alpha'; 
        msgid = 'Stable:warnlowalpha';
        msgtype = 'warning';
    case 9
        msgstring = 'Too many bins (distinct possible values) in sdiscretemle'; 
        msgid = 'Stable:errbin';
        msgtype = 'error';
    case 10
        msgstring = 'beta must be 0 to use this function';
        msgid = 'Stable:errbeta0';
        msgtype = 'error';
    case 11
        msgstring = 'beta near +1 or -1 does not work in this function';
        msgid = 'Stable:errbeta1';
        msgtype = 'error';
    case 12 
        msgstring = 'sinc error in sfitfracmoment';
        msgid = 'Stable:errsinc';
        msgtype = 'error';
    case 13
        msgstring = 'Internal error in sfitlogabs';
        msgid = 'Stable:errlogabs';
        msgtype = 'error';
    case 14
        msgstring = 'Data value near zero in sfitfracmoment or sfitlogabs';
        msgid = 'Stable:warnsmallvalue';
        msgtype = 'warning';
    case 17
        msgstring = 'f(a) and f(b) have the same signs';
        msgid = 'Stable:errdzbren';
        msgtype = 'error';
    case 18
        msgstring = 'Too many function evaluations';
        msgid = 'Stable:errmayeval';
        msgtype = 'error';
    case 19
        msgstring = 'Not enough memory';
        msgid = 'Stable:errmemory';
        msgtype = 'error';
    case 20
        msgstring = 'X zero value';
        msgid = 'Stable:errxzerovalue';
        msgtype = 'error';         
    case 21
        msgstring = 'Internal error in quick stable routine';
        msgid = 'Stable:errqkstable';
        msgtype = 'error';
    case 22
        msgstring = 'Too few uniform(0,1) input values for simulation';
        msgid = 'Stable:mv2fewu';
        msgtype = 'error';
    case 23
        msgstring = 'Must use 2-parameterization in non-symmetric case';
        msgid = 'Stable:errneed2param';
        msgtype = 'error';
    case 50
        msgstring = 'stable';
        msgid = 'Stable:warnsmallvalue';
        msgtype = 'warning';

    case 101
        msgstring = 'Invalid input parameter';
        msgid = 'Stable:mverrpar';
        msgtype = 'error';
    case 102
        msgstring = 'Accuracy warning, alpha<1';
        msgid = 'Stable:mvaccwarn';
        msgtype = 'warning';
    case 103
        msgstring = 'vmax exceeded in mvstablepdf';
        msgid = 'Stable:mvwarnvmax';
        msgtype = 'warning';
    case 104
        msgstring = 'Too many points in spectral measure';
        msgid = 'Stable:mvnspectbig';
        msgtype = 'error';
    case 105
        msgstring = 'nspectral must be divisible by 4';
        msgid = 'Stable:mvnspectdiv4';
        msgtype = 'error';
    case 106
        msgstring = 'This parameterization is not allowed in this function';
        msgid = 'Stable:mverriparam';
        msgtype = 'error';
% replaced with #22 above
%    case 107
%        msgstring = 'Too few uniform(0,1) input values for simulation';
%        msgid = 'Stable:mv2fewu';
%        msgtype = 'error';
    case 108
        msgstring = 'Distribution not defined';
        msgid = 'Stable:mvnotdef';
        msgtype = 'error';
    case 109
        msgstring = 'mvstablecdf not implemented for nonsymmetric case';
        msgid = 'Stable:mvnotsym';
        msgtype = 'error';
    case 110
        msgstring = 'Matrix is not positive definite';   
        msgid = 'Stable:mvnotposdef';
        msgtype = 'error';
    case 111
        msgstring = 'alpha must be at least 0.8';   
        msgid = 'Stable:mvalpha2small';
        msgtype = 'error';
    case 112
        msgstring = 'Definition error';   
        msgid = 'Stable:mvsdeferr2d';
        msgtype = 'error';
    case 113
        msgstring = 'Dimension is greater than the max allowed';   
        msgid = 'Stable:dtoolarge';
        msgtype = 'error';
    case 115
        msgstring = '';
        msgid = 'Stable:mvsdeferr2d';
        msgtype = 'error';
    case 150
        msgstring = 'Not enough memory';
        msgid = 'Stable:errmemory';
        msgtype = 'error';
    case 151
        msgstring = 'Error in a subroutine';
        msgid = 'Stable:mvssubroutineerr';
        msgtype = 'error';
    case 998
        msgstring = 'Error - not yet implemented';
        msgid = 'Stable:notyetimplementederr';
        msgtype = 'error';
    case 999
        msgstring = 'Error in minimization routine';
        msgid = 'Stable:minimzationerr';
        msgtype = 'error';
        
    case 1100
        msgstring = 'Too few input parameters';   
        msgid = 'Stable:rtfewpar';
        msgtype = 'error';   
    case 1101
        msgstring = 'Too many input parameters';   
        msgid = 'Stable:rtmanypar';
        msgtype = 'error';          
    case 1111
        msgstring = 'Undefined filter';   
        msgid = 'Stable:rtundeffi';
        msgtype = 'error';          
    case 1112
        msgstring = 'Undefined rho function';
        msgid = 'Stable:rtundefrf';
        msgtype = 'error';          
    case 1113
        msgstring = 'Undefined minimization method';   
        msgid = 'Stable:rtundefmi';
        msgtype = 'error';          
    case 1114
        msgstring = 'Full queue';   
        msgid = 'Stable:rtfullqueue';
        msgtype = 'warning';          
    case 1116
        msgstring = 'Skewed data needs parameterization 2';   
        msgid = 'Stable:rtskewneedsparam2';
        msgtype = 'error';
    case 1117
        msgstring = 'Undefined cost function';   
        msgid = 'Stable:rtundefcf';
        msgtype = 'error';        
    case 1118
        msgstring = 'Negative weight';   
        msgid = 'Stable:rtnegweight';
        msgtype = 'error';
    case 1119
        msgstring = 'Buffer too small';   
        msgid = 'Stable:rtbuffersmall';
        msgtype = 'error';        
    case 1120
        msgstring = 'Dimension error';   
        msgid = 'Stable:rtdimer';
        msgtype = 'error';          
    case 1121
        msgstring = 'Undefined cxcoupling';   
        msgid = 'Stable:rtundefcxcoup';
        msgtype = 'error';                  
    case 1130
        msgstring = 'Invalid input argument';   
        msgid = 'Stable:rtinvin';
        msgtype = 'error';   
    case 1140
        msgstring = 'Method parameter undefined';   
        msgid = 'Stable:rtundefmeth';
        msgtype = 'error';         
    case 1150
        msgstring = 'Insufficient memory';   
        msgid = 'Stable:rtmemout';
        msgtype = 'error';   
    case 1160
        msgstring = 'Memory violation';   
        msgid = 'Stable:rtmemvio';
        msgtype = 'error';         
    case 1170
        msgstring = 'Error in subroutine';   
        msgid = 'Stable:rtsuberr';
        msgtype = 'error';   
    case 1999
        msgstring = 'Error other';   
        msgid = 'Stable:rtother';
        msgtype = 'error';         

    otherwise
        msgstring = 'UNRECOGNIZED ERROR CODE';
        msgid = 'Stable:errpar';
        msgtype = 'error';
    end
    
    if strcmp( msgtype, 'warning' )
        str = sprintf( 'STABLE warning %2.0f in function %s: %s', ierr, funcname, msgstring );
        warning( msgid, str );
    else 
        str = sprintf( 'STABLE error %2.0f in function %s: %s', ierr, funcname, msgstring );
        error( str );
    end
   
end
