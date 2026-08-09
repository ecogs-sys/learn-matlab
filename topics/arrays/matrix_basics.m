% matrix_basics.m
% Companion code for "MATLAB Arrays Don't Start at Index 0" (YouTube)
%
% Same week, three sensors -- a 2D array. Semicolons separate rows.

M = [68 72 75 70 65 60 58;
     70 74 77 71 66 62 60;
     65 69 73 68 63 58 55];

M(2, 3)      % row 2 (sensor 2), column 3 (Wednesday) -- row, then column

size(M)      % [rows columns] -- 3 sensors, 7 days

M(2, :)      % every column in row 2 -- sensor 2's whole week
M(:, 1)      % every row in column 1 -- every sensor's Monday reading
