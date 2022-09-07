%% Function for jittering spike trains
%
% By Simon Locke
% 
% This function should take as input one spike train and a delta value, and
% output a jittered spike train which then can be binned. You will 
% need to write code that jitters the spike train. For simplicity, 
% choose a value of delta that evenly divides the spike train into an 
% integer number of delta-length bins. For the exercise with monkey data, 
% our spike trains will be 300ms long, so when testing the function, make 
% some synthetic data with 300ms spike trains and use delta = 20.


function jittered_spike_train = Jitter_function(spike_train, delta)
    delta_edges = linspace(0, 300, (300/delta)+1); % This sets the edges of our delta-binned spike train  
    spike_train_binned_delta = histcounts(spike_train, delta_edges); % The binning in delta-length
    % is done for you. 
    %
    % Here, you will need to write a routine that loops through each
    % nonempty delta-length interval and uniformly jitters the spikes in
    % each interval. Once the newly jittered spikes are created, create a
    % new spike train by appending the newly jittered spikes in each delta
    % bin and then sorting them. The functions unifrnd, cat, sort
    % should be useful here.




end