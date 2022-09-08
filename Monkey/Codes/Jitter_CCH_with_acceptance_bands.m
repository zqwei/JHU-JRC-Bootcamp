%% Jitter CCHs with Acceptance Bands
%
% In this script, you will input the Monkey spike train data and create
% jitter-corrected CCHs with acceptance bands. You will need to do a few
% things for the file to run properly.
%
% 1) If they are not already present in your workspace, load in the
% cell arrays containing spike train data for each neuron pair (monkey data).
%



% See next section...


%% Creating Monte Carlo data w/ the Jitter Procedure
%
% In this section we generate Monte Carlo data which will be used to
% construct the acceptance bands for the Jitter-corrected CCHs. 
% 
% 2) You will need write a few lines to implement the previously written 
% jitter function to jitter each spike train.
%
% 3) set num_trials to the number of spike trains in each dataset
%
%
num_trials = size(neural_data_cell_premotor, 1);
M = 1000; % number of Monte Carlo data sets 
lags = -100:1:100; % lags in CCF 
corr_steps = 100; % maxlag for Xcorr 
ccf = zeros(1,201); % empty varible for CCFs
num_bins = 300; % number of bins for 300ms spike trains from monkey data  
bin_edges = linspace(0, num_bins, num_bins+1); 

raw_indiv_cross = zeros(M,201); % raw cross-correlation data for original + pseudo
near_zero_lags = 96:106;
delta = 20;
delta_edges = linspace(0, num_bins, (num_bins/delta)+1); % length of trial/delta + 1 

parfor m = 1:M % making Monte Carlo pseudo-data
    for trial_num = 1:num_trials    
        st1 = neural_data_cell_premotor{trial_num,1}; % insert per trial spike train data here
        st2 = neural_data_cell_premotor{trial_num,2}; % insert per trial spike train data here
        %
        % Here you will write code to jitter both spike trains using
        % jitter_function.m.
        %
        %
        st1_jitter = Jitter_function_w_soln(st1, delta);
        st2_jitter = Jitter_function_w_soln(st2, delta);
        if m==1
            st1_binned = histcounts(st1, bin_edges);% computes CCH for original data
            st2_binned = histcounts(st2, bin_edges);
        else
            st1_binned = histcounts(st1_jitter, bin_edges); % re-bin the newly jittered spike trains
            st2_binned = histcounts(st2_jitter, bin_edges);
        end
        raw_indiv_cross(m,:) = xcorr(st1_binned, st2_binned, corr_steps) + raw_indiv_cross(m,:);
     end              
end

%% Construction of Acceptance bands & Correction for Multiple Hypothesis Tests %%
% Now we compute terms for standardizing the CCHs
mu = zeros(1,201); nu = zeros(1, 201); s = zeros(1,201); 
J_corr_a = zeros(1,201); J_corr_b = zeros(1,201);

% calculate mu(lag)
for d=1:M
    dataset_d = raw_indiv_cross(d,:);
    mu = dataset_d + mu;
end
mu = mu/(M);
% calculate nu(lag) and s(lag) and normal acceptance bands
for lag=1:201
    ordered_data_lag = zeros(1,M);
    ordered_data_tenlag = zeros(1,M);
    for l = 1:M                   
        dataset_l = raw_indiv_cross(l,:);
        ordered_data_lag(l) = dataset_l(lag);
    end                 
    ordered_data_lag = sort(ordered_data_lag);
    J_corr_a(lag) = ordered_data_lag(0.975*M); % regular acceptance bands
    J_corr_b(lag) = ordered_data_lag(0.025*M);
    ordered_data_lag = ordered_data_lag(2:M);
    nu(lag) = sum(ordered_data_lag, 'all')/M;
    for k = 1:(M-1)
        s(lag) = (ordered_data_lag(k)-nu(lag))^2 + s(lag);
    end
    s(lag) = sqrt(s(lag)/(M-1));
end

% find and sort the maximum and minimum values for each standardized CCH          
c_plus = zeros(1,M);
c_minus = zeros(1,M);
c_plus_tenlag = zeros(1,M);
c_minus_tenlag = zeros(1,M);

for d = 1:M
    dataset_d = raw_indiv_cross(d,:);
    c_star = (dataset_d - nu)./s;    
    c_plus(d) = max(c_star); % acceptance bands for full lags   
    c_minus(d) = min(c_star);   
    c_plus_tenlag(d) = max(c_star(near_zero_lags)); % acceptance bands for middle 11 lags (+/- 5ms around 0)                    
    c_minus_tenlag(d) = min(c_star(near_zero_lags));                             
end

c_plus = sort(c_plus);
c_minus = sort(c_minus);
c_plus_tenlag = sort(c_plus);
c_minus_tenlag = sort(c_minus);
% now we create the jitter corrected simultaneous acceptance bands
J_corr_a_star = (c_plus(0.975*(M)).*s)+nu-mu; % standardized acceptance bands
J_corr_b_star = (c_minus(0.025*(M)).*s)+nu-mu;
orig_data = (raw_indiv_cross(1,:))-mu;

%%%%%%%% mean subtraction %%%%%%%%%%%%
J_corr_a = J_corr_a - mu; % non-standardized acceptance bands
J_corr_b = J_corr_b - mu;

J_corr_a_star_tenlag = (c_plus_tenlag(0.975*(M)).*s)+nu-mu; % standardized bands for middle 10 lags (+/- 5ms around 0)
J_corr_b_star_tenlag = (c_minus_tenlag(0.025*(M)).*s)+nu-mu;

% Plotting the Jitter-Corrected CCHs with acceptance bands            
lags1 = [lags, fliplr(lags)];
accpt_bands = [J_corr_b, fliplr(J_corr_a)];
accpt_bands_star = [J_corr_b_star, fliplr(J_corr_a_star)];
accpt_bands_tenlag_star = [J_corr_b_star_tenlag, fliplr(J_corr_a_star_tenlag)];

figure
fill(lags1, (accpt_bands_tenlag_star/num_trials), [0.8 0.8 0.8]);
hold on
alpha(0.55)
fill(lags1, (accpt_bands/num_trials), [0.5 0.5 0.5]);
hold on
alpha(0.55)            
plot(lags, (orig_data/num_trials), 'red','LineWidth', 1); 
hold off
grid on
xlabel('Lags (1ms bins)')
ylabel('Coincidences/Trials')                
title('JCCH Monkey Data') % might be worth creating specific titles for each pair

% Optional - write a line of code to save each JCCH
