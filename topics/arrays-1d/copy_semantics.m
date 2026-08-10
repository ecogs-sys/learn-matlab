% copy_semantics.m
% Companion code for part 1. Video: 7:08-7:47
%
% The myth that trips people up hardest: does "=" share the data?

temps = [68 72 75 70 65 60 58];

% --- copying the whole vector ----------------------------------------------
t2 = temps;       % in some languages this makes a second NAME for one array
t2(1) = 999;

disp(t2)          % 999 72 75 70 65 60 58  -- changed
disp(temps)       %  68 72 75 70 65 60 58  -- untouched

% Assigning an array in MATLAB copies its VALUES. Two independent variables.

% --- copying a slice -------------------------------------------------------
newTemps = temps(4:end);   % everything from day four onward
newTemps(1) = 0;

disp(newTemps)    %  0 65 60 58
disp(temps)       % still the original week

% A slice is always a copy, never a window into the original.
% If you want the original changed, index it directly:
temps(4:end) = 0;
disp(temps)
