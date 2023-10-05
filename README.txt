This README file contains the description of those 32 IHA parameters utilized in the current study of Abraham et al. (2023).
The 32 IHA parameters are adopted from Richter et al. (1996). They describe the whole range of ecologically significant aspects of the flow regime, such as magnitude, frequency, timing, duration, and rate of change.

The 32 IHA parameters are grouped into five such as:
    •	Group 1- monthly flow indices,
    •	Group 2 - extreme flow indices,
    •	Group 3 - timing indices,
    •	Group 4 - high-flow and low-flow indices and
    •	Group 5 - rising and falling indices.

Description of each 32 IHA parameters is shown below, and more extended description can be found in Abraham et al. (2023).

IHA statistics groups and Hydrologic parameter (Short form)
Group 1: Magnitude of monthly water condition
         Jan, Feb...Dec

Group 2: Magnitude and duration of annual extreme water condition
        1d_min
        1d_max
        3d_min
        3d_max
        7d_min
        7d_max
        30d_min
        30d_max
        90d_min
        90d_max

Group 3: Timing of annual extreme water condition
        Julian date of max Q
        Julian date of min Q

Group 4: Frequency and duration of high and low pulses
        high pulses count
        low pulses count
        high pulses duration
        low pulses duration

Group 5: Rate and frequency of water condition changes
        mean of all +ve diff
        mean of all –ve diff
        number of rise
        number of fall

We provided a code to calculate all the above 32 IHA parameters in the MATLAB code. There are five MATLAB codes to calculate the five groups of IHA as Group1.mat, Group2.mat, Group3.mat, Group4.mat, Group5.mat. 
In these codes we calculated the IHA parameters for one gauged catchment (#01 @Bilate) using streamflow time series data in the historical period (1995-2007).

language: Matlab

included files:
	- IHA calculation code: Group1.mat, Group2.mat, Group3.mat, Group4.mat, Group5.mat.
	- Input streamflow data for catchment #01 in the historical period: Qobs1995_2007.mat
	- Calculated IHA parameters: Group1_IHA.mat, Group2_IHA.mat, Group3_IHA_Adjusted.mat, Group4_IHA.mat, Group5_IHA.mat

Reference

Abraham, T., Liu, Y., Tekleab, S., Hartmann, A., 2023. Climate change potentially induces ecological change in the Ethiopian Rift Valley Lakes Basin. Journal of hydrol; regional studies.
Richter, B.D., Baumgartner, J. V., Powell, J., Braun, D.P., 1996. A Method for Assessing Hydrologic Alteration within Ecosystems. Conserv. Biol. 10, 1163–1174. https://doi.org/10.1046/j.1523-1739.1996.10041163.x
