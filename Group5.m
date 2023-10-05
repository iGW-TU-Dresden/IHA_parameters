%% cc
cd('E:\PhD research\2nd paper\for calculating IHA parameters\Github IHA code')
clc;clear
%% daily to monthly mean converter for each catchment of 1 yr value
load('Qobs1995_2007.mat','Qobs1995_2007'); % load the Qobservation for 1995 to 2007 for one catchment
% 
%% Definition 
% Group 5: Rate and frequency of water condition changes
%         number of rise
%         mean of all +ve diff
%         number of fall
%         mean of all –ve diff
%% pre-allocation with nan value
Group5_IHA = cell(4,13);
ConsquativeDiff = cell(1,13);
for j=1:13
    ConsquativeDiff{1,j} = nan(length(Qobs1995_2007{1,j}),1); % ...= nan(365,1)
end
%% consecutive day diff | current row-previos row
for j=1:13
    for i=2:length(ConsquativeDiff{1,j}) % 2:365 or 366
        ConsquativeDiff{1,j}(i-1,:) = Qobs1995_2007{1,j}(i,:)-Qobs1995_2007{1,j}(i-1,:); % current row -previos row
    end
end
% in this analysis the last row is nan in all cat and 13 yrs
%% Positive and negative difference indx, value and mean row 2 to 5
for j=1:13
    % for positive diff
    PostiveDiff_INDX = ConsquativeDiff{1,j} > 0; %
    Positv_diff_val = ConsquativeDiff{1,j}(PostiveDiff_INDX); % No of rises (positive diff values)
    Group5_IHA{1,j} = length(Positv_diff_val); % No of rises
    Group5_IHA{2,j} = mean(Positv_diff_val); % mean of +ve diff
    % for negative diff
    NegativeDiff_INDX = ConsquativeDiff{1,j} < 0; %
    Negtv_diff_val = ConsquativeDiff{1,j}(NegativeDiff_INDX); % No of falls (negative diff values)
    Group5_IHA{3,j} = length(Negtv_diff_val); % No of falls 
    Group5_IHA{4,j} = mean(Negtv_diff_val); %mean of -ve diff
end
%%
save('Group5_IHA.mat','Group5_IHA')







