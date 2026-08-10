% matrix_math.m
% Companion code for part 2. Video: 5:04-7:05
%
% Arithmetic on a matrix, transpose, and the direction that sum works in.

M = [68 72 75 70 65 60 58;
     70 74 77 71 66 62 60;
     65 69 73 68 63 58 55];

% --- one number applies to everything --------------------------------------
M * 2
M - 32

% --- two matrices: the dot decides what happens ----------------------------
A = [1 2 3; 4 5 6];
B = [10 20 30; 40 50 60];

A .* B        % element by element: cell times matching cell
A ./ B
A .^ 2

% A * B       % <- uncomment: Incorrect dimensions for matrix multiplication.
%             % plain * is LINEAR ALGEBRA matrix multiply, a different thing.
A * B'        % this one IS defined: 2x3 times 3x2

A + B         % plus and minus never need a dot -- there is no .+

% --- transpose: rows become columns ----------------------------------------
Mt = M'
size(M)       % 3   7
size(Mt)      % 7   3

v = [1 2 3];
v'            % also how you turn a row vector into a column vector

% --- sum works DOWN COLUMNS by default (this one ruins homework) -----------
sum(M)        % 7 numbers -- one total per DAY, across the sensors
sum(M, 2)     % 3 numbers -- one total per SENSOR, across the week
sum(M(:))     % 1399 -- every element added up

mean(M)       % same rule: per column
mean(M, 2)    % per row
max(M)        % the biggest value in each column
max(M(:))     % the biggest value anywhere

% --- M(:) and single-index access -----------------------------------------
M(:)          % the whole matrix as one long column
% MATLAB stores a matrix column by column, so M(:) goes 68, 70, 65, 72, ...
M(4)          % 72 -- the 4th value in that column order (row 1, column 2)

M(M > 73)     % every reading above 73, returned as a column
