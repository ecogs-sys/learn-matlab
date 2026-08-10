% growing_and_deleting.m
% Companion code for part 1. Video: 3:50-5:26
%
% Changing a vector after it exists: overwrite, grow, join, delete.

temps = [68 72 75 70 65 60 58];

% --- writing: indexing on the LEFT of the = --------------------------------
temps(3) = 78;            % replace Wednesday in place
disp(temps)

temps(5:7) = [64 61 59];  % overwrite a whole slice at once
disp(temps)
% The sizes have to match: 3 positions on the left, 3 values on the right.
% temps(5:7) = [1 2];     % <- uncomment to see the error

temps = [68 72 75 70 65 60 58];   % reset back to the original week

% --- growing: no fixed size, no resizing by hand ---------------------------
temps(end + 1) = 66;      % position 8 did not exist a moment ago
disp(temps)
length(temps)             % 8

% --- growing by rebuilding: [ ] pastes pieces together ---------------------
temps = [temps 70];       % all of temps, then a 70 on the end
disp(temps)

week1 = [68 72 75 70 65 60 58];
week2 = [66 69 71 68 64 61 57];
fortnight = [week1 week2];        % one 14-element vector
length(fortnight)                 % 14

% --- deleting: assign empty brackets ---------------------------------------
temps = [68 72 75 70 65 60 58];   % reset again
temps(4) = [];                    % that element disappears
disp(temps)                       % 68 72 75 65 60 58  -- six left
temps(4)                          % 65: everything after the gap shifted down

% You can delete several at once, too:
temps([1 2]) = [];
disp(temps)
