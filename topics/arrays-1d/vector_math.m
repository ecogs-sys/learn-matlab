% vector_math.m
% Companion code for part 1. Video: 5:26-7:08
%
% Doing arithmetic on a whole vector at once -- the reason MATLAB exists.

temps = [68 72 75 70 65 60 58];

% --- one number applied to every element (vectorizing) ---------------------
tempsC = (temps - 32) * 5/9      % Fahrenheit -> Celsius, all seven at once
disp(temps)                      % temps itself is unchanged

% The long way, which you do NOT need:
% tempsC = zeros(1, length(temps));
% for i = 1:length(temps)
%     tempsC(i) = (temps(i) - 32) * 5/9;
% end

% --- two vectors of the same length, element by element --------------------
sensorB = [70 74 77 71 66 62 60];
diffs = sensorB - temps          % 2 2 2 1 1 2 2 -- sensor B reads high

% For MULTIPLY (and divide, and power) you need the dot:
sensorB .* temps                 % element by element -- what you usually mean
% sensorB * temps                % <- uncomment: matrix multiply, errors here
sensorB ./ temps
temps .^ 2

% Plus and minus never need a dot. There is no such thing as .+

% --- the summary functions -------------------------------------------------
sum(temps)                       % 468
mean(temps)                      % 66.8571
max(temps)                       % 75
min(temps)                       % 58

[hi, day] = max(temps)           % hi = 75, day = 3  -- the value AND where

% --- picking values by a condition -----------------------------------------
temps > 70                       % a true/false vector, one per day
temps(temps > 70)                % 72 75 -- only the days that passed
sum(temps > 70)                  % 2 -- how many days were above 70
find(temps > 70)                 % 2 3 -- which positions they were at
