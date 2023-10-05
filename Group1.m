%% cc
cd('E:\PhD research\2nd paper\for calculating IHA parameters\Github IHA code')
clc;clear
%% daily to monthly mean converter for each catchment of 1 yr value
load('Qobs1995_2007.mat','Qobs1995_2007'); % load the Qobservation for 1995 to 2007 for one catchment
YearNum = [1995:2007]; % simulation paeriods
Group1_IHA = nan(12,13); % Pre-allocation for monthly converted values in group 1
for j=1:13  % for year 1995:2007
    StartDate = datenum(YearNum(:,j),1,1);
    EndDate = datenum(YearNum(:,j),12,31);
    V = datevec((StartDate:EndDate)'); % converts the date numbers to date vectors
    for i=1:12   % for months 1=Jan and 12=Dec
        Monthly_Indx = V(:,2) == i;
        Group1_IHA(i,j) = nanmean(Qobs1995_2007{1,j}(Monthly_Indx));
    end
end
%%
save('Group1_IHA.mat','Group1_IHA')
