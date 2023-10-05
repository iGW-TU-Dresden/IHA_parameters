%% cc
cd('E:\PhD research\2nd paper\for calculating IHA parameters\Github IHA code')
clc;clear
%% Group 2: Magnitude and duration of annual extremes
% In this group there are 10 IHAs, 1 to 5 are related to minumum flow and 6 to 10 are related to maximum flow
%1 = Annual minima 1-day mean
%2 = Annual minima 3-day mean
%3 = Annual minima 7-day means
%4 = Annual minima 30-day means
%5 = Annual minima 90-day means

%6 = Annual maxima 1-day mean
%7 = Annual maxima 3-day mean
%8 = Annual maxima 7-day means
%9 = Annual maxima 30-day means
%10 = Annual maxima 90-day means
%% daily to monthly mean converter for each catchment of 1 yr value
load('Qobs1995_2007.mat','Qobs1995_2007'); % load the Qobservation for 1995 to 2007 for one catchment

Group2_IHA = nan(10,13);
for j=1:13 % for 13 yr values
    Sorted_Yearly = sort(Qobs1995_2007{1,j},'ascend');  % increasing order from min to max
   % for Minima calculation ===========================================
    Group2_IHA(1,j) = Sorted_Yearly(1,:);          %Annual minima 1-day mean
    Group2_IHA(2,j) = mean(Sorted_Yearly(1:3,:));  %Annual minima 3-day mean
    Group2_IHA(3,j) = mean(Sorted_Yearly(1:7,:));  %Annual minima 7-day mean
    Group2_IHA(4,j) = mean(Sorted_Yearly(1:30,:)); %Annual minima 30-day mean
    Group2_IHA(5,j) = mean(Sorted_Yearly(1:90,:)); %Annual minima 90-day mean
  % for Maxima calculation ============================================
    Group2_IHA(6,j) = Sorted_Yearly(end,:);               %Annual Maxima 1-day mean
    Group2_IHA(7,j) = mean(Sorted_Yearly(end-3+1:end,:)); %Annual Maxima 3-day mean
    Group2_IHA(8,j) = mean(Sorted_Yearly(end-7+1:end,:)); %Annual Maxima 7-day mean
    Group2_IHA(9,j) = mean(Sorted_Yearly(end-30+1:end,:)); %Annual Maxima 30-day mean
    Group2_IHA(10,j) = mean(Sorted_Yearly(end-90+1:end,:)); %Annual Maxima 90-day mean
end
%%
save('Group2_IHA.mat','Group2_IHA')




