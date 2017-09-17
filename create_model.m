function [obj_function,xdf_function] = create_model(model,data_type)
% [obj_function,xdf_function] = create_model(model,data_type)
% Sets path and create the objective function and the pdf/cdf function
% associated with the model and the data type.  The data type may be
% either "btc" or "cbtc".
% Available models: sfade (and submodels)
%                   tfde (TO DO)
%                   fmim
%                   ttlm

if (not(ischar(model)))
error('model must be a character array');
end

if (not(ischar(data_type)))
error('data_type must be a character array');
end


global STABLE_LIBRARY;  %0 = Nolan, 1= Veillette, 2 = Matlab Statistics
global OPTIM_FUNCTION;  % 0 = lsqnonlin, 1 = ga (genetic algorithm)

STABLE_LIBRARY = 2;
OPTIM_FUNCTION = 0; 

% Set up paths to the stable library
if (STABLE_LIBRARY == 0)
    addpath('nolan')
elseif  (STABLE_LIBRARY == 1)   
    addpath('veillette')
elseif (STABLE_LIBRARY == 2)
     %verify that version is at least 2016a AND Statistics toolbox is loaded
    if verLessThan('stats','R2016a')
        error('Statistics Toolbox for R2016a required');
    end 
else
    error('Not supported!');
end    



if (OPTIM_FUNCTION == 1 & verLessThan('globaloptim','R2006'))
        error('Global Optimization Toolbox for R2006 or later required for genetic algorithm (ga)');
end 


if (strcmp(data_type,'btc'))
    if (OPTIM_FUNCTION == 0)
        obj_function = @btc_lsqnonlin_obj_function;
    elseif (OPTIM_FUNCTION == 1)
         obj_function = @btc_ga_obj_function;
    end
elseif (strcmp(data_type,'cbtc'))
    if (OPTIM_FUNCTION == 0)
        obj_function = @cbtc_lsqnonlin_obj_function;
    elseif (OPTIM_FUNCTION == 1)
        obj_function = @cbtc_ga_obj_function;
    end
else
    error('Data type not supported.');  
end    
    
    
    
if (strcmp(model,'sfade'))
  addpath('models/sfade');
  if (strcmp(data_type,'btc'))
     xdf_function = @sfade_pdf_function;
   elseif (strcmp(data_type,'cbtc'))
        xdf_function = @sfade_ccdf_function;    
   else
       error('Data type not supported.');  
   end     
        
elseif (strcmp(model,'sfade_negskew'))
  addpath('models/sfade');
   if (strcmp(data_type,'btc'))
        xdf_function = @sfade_pdf_function;
   elseif (strcmp(data_type,'cbtc'))
        xdf_function = @sfade_ccdf_function;    
   else
       error('Data type not supported.');  
   end

elseif (strcmp(model,'ade'))        
  addpath('models/sfade'); 
   if (strcmp(data_type,'btc'))
        xdf_function = @sfade_pdf_function;
   elseif (strcmp(data_type,'cbtc'))
        xdf_function = @sfade_ccdf_function;
   else
       error('Data type not supported.');  
   end
      
elseif (strcmp(model,'tfde'))
    addpath('models/tfde');   
     if (strcmp(data_type,'btc'))
        xdf_function = @tfde_pdf_function;  
     elseif (strcmp(data_type,'cbtc'))
        xdf_function = @tfde_ccdf_function; 
     else
       error('Data type not supported.');  
     end
    
     
elseif (strcmp(model,'fmim'))
    addpath('models/fmim');   
     if (strcmp(data_type,'btc'))
        xdf_function = @fmim_pdf_function;  
     elseif (strcmp(data_type,'cbtc'))
        xdf_function = @fmim_ccdf_function; 
     else
       error('Data type not supported.');  
     end     
     
elseif (strcmp(model,'ttlm'))
    addpath('models/ttlm');   
     if (strcmp(data_type,'btc'))
        xdf_function = @ttlm_pdf_function;  
     elseif (strcmp(data_type,'cbtc'))
        xdf_function = @ttlm_ccdf_function; 
     else
       error('Data type not supported.');  
     end
     
     
else
    error('Model not supported.');         
end

end



