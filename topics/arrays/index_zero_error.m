% index_zero_error.m
% Companion code for "MATLAB Arrays Don't Start at Index 0" (YouTube)
%
% Coming from Python or C, it's natural to reach for index 0. MATLAB
% doesn't have one. This line intentionally errors -- run it and read
% the message.

temps = [68 72 75 70 65 60 58];

temps(0)   % Index must be a positive integer or logical.
