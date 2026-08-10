% indexing_rows_cols.m
% Companion code for part 2. Video: 2:02-3:24
%
% Two numbers to reach one value: ROW first, COLUMN second.

M = [68 72 75 70 65 60 58;
     70 74 77 71 66 62 60;
     65 69 73 68 63 58 55];

% --- one element -----------------------------------------------------------
M(2, 3)     % 77 -- sensor 2, day 3

% --- the trap: flip the two numbers ---------------------------------------
M(3, 2)     % 69 -- sensor 3, day 2. NO error, NO warning, wrong answer.
%
% Nothing will catch this for you. Row, then column, every time.

% --- a colon on its own means "all of this dimension" ----------------------
M(2, :)     % all of sensor 2's week      (a row)
M(:, 1)     % every sensor on Monday      (a column)
M(:, end)   % every sensor on Sunday

% --- end works in each dimension independently ----------------------------
M(end, end)      % 55 -- last row, last column
M(2, end - 1)    % 62 -- sensor 2, Saturday
M(end, :)        % the whole last row, however many sensors you add later
