%% Calculating Cross-Correlation with Xcorr
%
% by Simon Locke
%
% In this script, you will calculate the CCF for your synthetic spike trains.
% 
% First, load in the synthetic Poisson data if it isn't still present in 
% your workspace. You need to set num_trials and bin_edges before running 
% the loop in addition to setting the maximum lag for Xcorr. bin_edges 
% needs to indicate the edges of each 1ms bin from the beginning of the 
% spike train to the end.
% 
% Hint: look up the function linspace - it may be helpful!

for i = 1:num_trials
    % load in your two Poisson spike trains for the ith trial here and name them
    % "st1" and "st2"   
    st1_binned = histcounts(st1, bin_edges); % this bins the spike trains
    st2_binned = histcounts(st2, bin_edges); % check documentation for histcounts
    % next, use the function Xcorr to compute the CCF for each trial and 
    % remember to sum over trials!

end

%% Plotting Section
%
% Here you will plot the results of your CCF over trials. You can divide by
% trials to get an idea of the average number of events/trial.
%
figure
% plot(); insert plotting arguments here
% 
xlabel('Lags (1ms bins)') % here we label the axes
ylabel('Coincident Events')                
title('Cross-correlation Histogram: Poisson Neurons')

% Optional: it may be worth saving your figure as well!
%
%
% Describe the results here: 
%
% 


