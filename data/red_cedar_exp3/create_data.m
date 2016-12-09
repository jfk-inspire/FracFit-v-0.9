% Load data and construct a data object
load 'red_cedar_exp3/testdata_3.1km.mat';
data.cobs = cobs;
data.conc_units = '\mug/L';
data.tobs = tobs;
data.time_units = 'minutes';
data.x_dist = 3.1;
data.x_dist_units = 'km';
data.type = 'btc';  

save testdata_3.1km.mat data