% vector_basics.m
% Companion code for "MATLAB Counts From 1, Not 0 -- Vectors From Scratch"
% (Learn MATLAB, part 1). Video: 0:30-2:35
%
% The running example for the whole video: one temperature sensor,
% one reading a day, for a week.

temps = [68 72 75 70 65 60 58]     % square brackets, spaces between values

% --- reading one value back out -------------------------------------------
temps(1)        % Monday  -- the FIRST element is index 1, not 0
temps(7)        % Sunday  -- the last one, counted by hand

% --- end: the last position, whatever the length is ------------------------
temps(end)      % same as temps(7), but it keeps working if temps grows
temps(end - 1)  % second to last (Saturday)

% --- how long is it? -------------------------------------------------------
length(temps)   % 7
numel(temps)    % 7  (number of elements)
size(temps)     % 1  7  -- one row, seven columns

% A vector is really just a grid with a single row. That is why size
% gives you two numbers here, and it is what part 2 builds on.
