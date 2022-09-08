%% Generating Synthetic Poisson Data
%
% By Simon Locke
% 
% Here, you will implement the provided algorithm for simulating mutliple trials
% using a Poisson process. We will be simulating data from two neurons. In the 
% space below, set all of the necessary parameters.






synth_spike_times_neuron1 = cell(1, num_trials); % we will use a cell array to store our spike trains
synth_spike_times_neuron2 = cell(1, num_trials); % Check the documentation to understand the cell function

for i = 1:num_trials
    % Use this space to generate your Poisson and uniform random numbers
    
    
    
    % make sure to sort your spikes once they have been generated!
    synth_spike_times_neuron1(i) = {insert_code_here}; % insert your new spike train here
    synth_spike_times_neuron2(i) = {insert_code_here};
end

% Optional: You will be using these variables across future exercises, and 
% while it's fine to keep them in your workspace, it is good practice to 
% save your data. To do this, write a line of code to save your synthetic
% spike train data. Obviously, the save function will be useful here. Be
% sure to name your files appropriately and set the directory.
%

