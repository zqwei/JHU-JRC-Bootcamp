%% Making Rasters with Spike Train Data
% 
% By Simon Locke
%
% In this script you will make raster plots, which are a tool for
% visualizing the trial-to-trial variability of neural data. You will need
% to do a few things in order for this file to run. Also, while most of this
% file is written for you, it's worth reviewing the code so that you
% understand everything. 
% 
% 1) Set num_trials. In our previous exercise, you only created 100 trials 
% worth of spike train data, which should fit on a single raster, though
% you can plot fewer trials if you wish.
%
% 2) Load in your synthetic spike trains if they are not already present in
% your workspace.
%
% 3) Run the file.

figure
for jj = 1:num_trials % loop through
    % raster_st1 = ; Insert spike train data for each trial here 
    % raster_st2 = ; and here
    y1 = (jj)*ones(1, numel(raster_st1)); % look up numel if you aren't familiar
    y2 = (jj)*ones(1, numel(raster_st2));
    diamond_train=[]; c=1;
    for i=1:length(raster_st1)
        for j=1:length(raster_st2)            
            if abs(raster_st1(i)-raster_st2(j))<= 2 % this will create a diamond if the spikes are <2ms apart
                diamond_train(c)=raster_st1(i);
                diamond_train(c+1)=raster_st2(j);
                c=c+2;
            else
                continue;
            end
        end
    end     
    diamond_train = sort(unique(diamond_train)).';
    yd = (jj)*ones(1, numel(diamond_train));               
    scatter(raster_st1, y1, 10,'red','filled','c')
    hold on
    scatter(raster_st2, y2, 10,'green','filled','c') 
    hold on
    scatter(diamond_train, yd, 15,'blue','filled','d')        
    hold on
end
hold off
xlabel('Time (ms)'); % Time is in milliseconds
ylabel('Trial number');
title('Raster for Poisson Spike Train Data')

% Optional: Save your synthetic raster plots.


