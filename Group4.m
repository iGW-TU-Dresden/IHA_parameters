%% cc
cd('E:\PhD research\2nd paper\for calculating IHA parameters\Github IHA code')
clc;clear
%% Group 4: Frequency and Duration of High/Low pulses
% number of high pulses each year
% number of low pulses each year
% mean duration of high pulses with in each year (Days)
% mean duration of low pulses with in each year (Days)

% Definition
% Low pulses are defined as those periods during which daily mean flows drops below the 25th percentile of all pre-impact flows;
% High pulses are defined as those periods during which the 75th percentile is exceeds. 
% Ritchter et al., 1996 pp241
% ===========================================
% Qall = textread('Qobs.txt'); %Qfor 14 cats
%% daily to monthly mean converter for each catchment of 1 yr value
load('Qobs1995_2007.mat','Qobs1995_2007'); % load the Qobservation for 1995 to 2007 for one catchment
% Qtime_series = Qall(:,1);
load('Qtime_series.mat','Qtime_series'); % load the Qobservation for 1995 to 2007 for one catchment
%% calculting the 25%, 50%, and 75th percentile ...
% this section calculates the low pulse and high pulse count. 
%   Y = PRCTILE(X,P) returns percentiles of the values in X. P is a scalar or a vector of percent values.

X = Qtime_series; % X is vector of data points
Y = nan(1,3); % are 25th, 50th, and 75th percentiles
percent = [25,50,75];
for i=1:3
    Y(:,i) = prctile(X,percent(:,i)); % are the percentiles of 25th, 50th and 75th
end

Group4_IHA = cell(4,13);
% Number of Low pulse per a year
for j=1:13
    HighPulse_INDX = Qobs1995_2007{1,j} >= Y(:,3); %17.22
    Q_75_Perc = Qobs1995_2007{1,j}(HighPulse_INDX);% Q values for high pulse/ Number of high pulse
    Group4_IHA{1,j} = length(Q_75_Perc); % Number of high pulse

    LowPulse_INDX = Qobs1995_2007{1,j} <= Y(:,1); %3.362
    Q_25_Perc = Qobs1995_2007{1,j}(LowPulse_INDX);% Q values for low pulse/
    Group4_IHA{2,j} = length(Q_25_Perc);% Number of low pulse
    
    % duration of high pulses with in each year (Days)
    a = HighPulse_INDX(:)'; % Transposed logicals
    a = [0,a,0]; % 0 and 0 is added to the front and end of data (to make transition from 0 to 1 or 1 to 0), i.e always the transition keep being from 0 to 1 during rising. 
    NaNStart = strfind(a, [0 1])+1-1; %from the logical(000111) values the index having [0 1] is taken.
    NaNStop = strfind(a, [1 0])-1; %from the logical(111000) values the index having [1 0] is taken.
    
    DiffDays = (NaNStop - NaNStart)+1; % individual durations for high pulse| +1 is to account the 1st day inthe duration 
    Duration_HighPulses = sum(DiffDays); % its duration of high pulse  in a year
    Group4_IHA{3,j} = Duration_HighPulses;
    
    % duration of low pulses with in each year (Days)
    b = LowPulse_INDX(:)'; % Transposed logicals
    b = [0,b,0]; % 0 and 0 is added to the front and end of data (to make transition from 0 to 1 or 1 to 0), i.e always the transition keep being from 0 to 1 during rising.             
    NaNStart = strfind(b, [0 1])+1-1; %from the logical(000111) values the index having [0 1] is taken. To account for the added 0 in the front -1 was used
    NaNStop = strfind(b, [1 0])-1; %from the logical(111000) values the index having [1 0] is taken. To account for the added 0 in the front -1 was used
    
    DiffDays = (NaNStop - NaNStart)+1; % individual durations for high pulse| +1 is to account the 1st day inthe duration 
    Duration_LowPulses = sum(DiffDays); % its duration of high pulse  in a year
    Group4_IHA{4,j} = Duration_LowPulses;
end
%%
save('Group4_IHA.mat','Group4_IHA')
% High pulse count and High pulse duration are equal
% Low pulse count and Low pulse duration are equal







