%% cc
cd('E:\PhD research\2nd paper\for calculating IHA parameters\Github IHA code')
clc;clear
%% Definitions:
% Group 3: Timing of annual extreme water condition
%         Julian date of max Q (Occurance date for maximum flow in each year)
%         Julian date of min Q (Occurance date for minimum flow in each year)
%% daily to monthly mean converter for each catchment of 1 yr value
load('Qobs1995_2007.mat','Qobs1995_2007'); % load the Qobservation for 1995 to 2007 for one catchment

Group3_IHA = cell(2,13);

for j=1:13
    INDXmax = find(Qobs1995_2007{1,j} == max(Qobs1995_2007{1,j})); %1-day max flow date (the date number in a year of 365) e.g 56th date out of 365 days
    INDXmin = find(Qobs1995_2007{1,j} == min(Qobs1995_2007{1,j})); %1-day min flow date (the date number in a year of 365)
    Group3_IHA{1,j} = INDXmax; % occurance of maximum flow date
    Group3_IHA{2,j} = INDXmin; % occurance of minimum flow date
end
%% Note: in this analysis several days in year can have the same daily max or
% min value, in that case mean of the repeated date is used.
Group3_IHA_Adjusted = cell(2,13); 
for j=1:13
    Group3_IHA_Adjusted{1,j} = ceil(mean(Group3_IHA{1,j})); %this code adjusts for the mean of max DATE
    Group3_IHA_Adjusted{2,j} = ceil(mean(Group3_IHA{2,j})); %this code adjusts for the mean of min DATE
end
save('Group3_IHA_Adjusted.mat','Group3_IHA_Adjusted')






