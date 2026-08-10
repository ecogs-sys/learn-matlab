% index_zero_error.m
% Companion code for part 1. Video: 1:17-1:42
%
% This file is SUPPOSED to error. Run it, read the message, don't fix it.

temps = [68 72 75 70 65 60 58];

% Habit from other languages: "index 0 is the first element".
% In MATLAB it is simply not a valid index.
temps(0)

% Also invalid, for the same reason -- uncomment one at a time to see:
% temps(-1)     % negative
% temps(2.5)    % not a whole number
% temps(8)      % past the end: "Index exceeds the number of array elements"

% Expected message for temps(0):
%   Array indices must be positive integers or logical values.
