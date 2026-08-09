% vector_basics.m
% Companion code for "MATLAB Arrays Don't Start at Index 0" (YouTube)
%
% The core 1D array example from the video: a week of temperature
% readings for one sensor, indexed, sliced, and grown.

temps = [68 72 75 70 65 60 58];

temps(1)          % first reading (Monday) -- index 1, not 0
temps(7)          % last reading (Sunday)

temps(end)        % last element, however long temps is
temps(end - 1)    % second-to-last element

temps(2:4)        % Tuesday through Thursday, as a new vector

temps(end + 1) = 66;   % array grows from 7 elements to 8
disp(temps)
