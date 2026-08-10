% matrix_basics.m
% Companion code for "MATLAB Matrices: The Index Mistake That Never Errors"
% (Learn MATLAB, part 2). Video: 0:25-2:02
%
% Same data as part 1, but now three sensors logging the same week.
% Rows = sensors, columns = days.

M = [68 72 75 70 65 60 58;      % sensor 1  -- a semicolon starts a new row
     70 74 77 71 66 62 60;      % sensor 2
     65 69 73 68 63 58 55]      % sensor 3

% Spaces separate columns, semicolons separate rows.

% --- what shape is it? -----------------------------------------------------
size(M)             % 3   7   -- ROWS first, then COLUMNS
[r, c] = size(M)    % r = 3, c = 7  (catch them separately)
numel(M)            % 21  -- total number of readings

% --- building a grid when you know the shape but not the contents ----------
blank = zeros(3, 7)         % 3 rows, 7 columns of zeros -- same order again
allOnes = ones(2, 3)
sameShapeAsM = zeros(size(M))   % exactly the shape of M, useful in loops

size(sameShapeAsM)
