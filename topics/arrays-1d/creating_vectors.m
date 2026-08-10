% creating_vectors.m
% Companion code for part 1. Video: 3:22-3:50
%
% Building vectors without typing out every single value.

% --- the colon, again: this time to CREATE ---------------------------------
days = 1:7          % 1 2 3 4 5 6 7
evens = 2:2:10      % 2 4 6 8 10
countdown = 5:-1:1  % 5 4 3 2 1

% --- known size, contents later --------------------------------------------
% The two numbers are rows, then columns -- 1 row, 7 columns.
blank = zeros(1, 7)
allOnes = ones(1, 3)

% Why bother? Because filling a vector you already made is much faster than
% growing it one element at a time inside a loop:
readings = zeros(1, 7);
for i = 1:7
    readings(i) = 60 + i;     % pretend this is a real measurement
end
disp(readings)

% linspace is the other one worth knowing: 5 values evenly spread from 0 to 1
linspace(0, 1, 5)
