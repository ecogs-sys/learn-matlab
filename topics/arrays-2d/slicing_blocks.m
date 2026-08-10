% slicing_blocks.m
% Companion code for part 2. Video: 3:24-3:44
%
% Ranges in BOTH slots carve out a rectangle.

M = [68 72 75 70 65 60 58;
     70 74 77 71 66 62 60;
     65 69 73 68 63 58 55];

block = M(2:3, 4:6)     % rows 2-3, columns 4-6: sensors 2 and 3, Thu-Sat
size(block)             % 2   3

% Mix ranges, colons and end freely:
M(1:2, :)          % the first two sensors, whole week
M(:, 4:end)        % every sensor, Thursday onward
M([1 3], [1 7])    % pick specific rows and columns: sensors 1 and 3, Mon and Sun

% The result is always a new matrix -- see copy_semantics.m
