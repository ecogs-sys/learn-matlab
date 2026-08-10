% growing_and_deleting.m
% Companion code for part 2. Video: 3:44-5:04
%
% Writing into, adding to, and deleting from a matrix.

M = [68 72 75 70 65 60 58;
     70 74 77 71 66 62 60;
     65 69 73 68 63 58 55];

% --- writing: one cell, a whole row, a whole column ------------------------
M(1, 1) = 71;                          % fix one bad reading
M(3, :) = [66 70 74 69 64 59 56];      % replace sensor 3's entire week
M(:, 7) = 0;                           % one value spreads down the column
disp(M)

% --- adding a row or a column ---------------------------------------------
M(4, :) = [63 67 70 66 61 57 54];      % a fourth sensor
size(M)                                % 4   7

newRow = [60 64 68 63 58 54 51];
M = [M; newRow];        % glue underneath -- must be the same WIDTH
size(M)

newCol = [50; 52; 49; 51; 48];
M = [M, newCol];        % glue on the side -- must be the same HEIGHT
size(M)

% --- deleting: whole rows or whole columns only ---------------------------
M = [68 72 75 70 65 60 58;
     70 74 77 71 66 62 60;
     65 69 73 68 63 58 55];   % reset

M(2, :) = [];      % delete sensor 2
size(M)            % 2   7 -- what was sensor 3 is now row 2

M(:, 1) = [];      % delete Monday
size(M)            % 2   6

% This does NOT work -- uncomment to see it:
% M(2, 3) = [];
% Expected: A null assignment can only have one non-colon index.
% Punch a hole in a rectangle and it stops being a rectangle.
