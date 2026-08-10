% ragged_rows_error.m
% Companion code for part 2. Video: 0:44-1:12
%
% This file is SUPPOSED to error. Run it and read the message.

% Row 2 is one reading short -- six values where the others have seven.
M = [68 72 75 70 65 60 58;
     70 74 77 71 66 60;
     65 69 73 68 63 58 55]

% Expected:
%   Dimensions of arrays being concatenated are not consistent.
%
% A matrix is a rectangle: every row must be exactly the same width.
% If a sensor genuinely missed a reading, fill the slot instead of
% leaving it out -- NaN ("not a number") is the usual placeholder:

Mfixed = [68 72 75 70 65 60 58;
          70 74 77 71 66 NaN 60;
          65 69 73 68 63 58 55]

mean(Mfixed(2, :))          % NaN -- it spreads, which is the point
mean(Mfixed(2, :), 'omitnan')   % ignores the gap
