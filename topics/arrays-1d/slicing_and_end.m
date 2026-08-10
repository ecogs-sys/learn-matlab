% slicing_and_end.m
% Companion code for part 1. Video: 2:35-3:22
%
% Taking MORE THAN ONE element at a time, with the colon.

temps = [68 72 75 70 65 60 58];

% --- start:stop -- read the colon as the word "through" --------------------
temps(2:4)        % positions 2 through 4: Tue, Wed, Thu
temps(1:3)        % the first three days
temps(5:end)      % day five to the end -- no counting required

% The result is a BRAND NEW vector. temps itself is untouched:
disp(temps)

% --- start:step:stop -- the middle number is the STEP, not the stop --------
temps(1:2:end)    % every second day: Mon, Wed, Fri, Sun
temps(2:2:end)    % the other ones:   Tue, Thu, Sat
temps(end:-1:1)   % step of -1 walks backwards: the week reversed

% Common first mistake: reading 1:2:end as "1 through 2 through end".
% It is start = 1, step = 2, stop = end.
