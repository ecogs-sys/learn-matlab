% copy_semantics.m
% Companion code for part 2. Video: 7:05-7:47
%
% The copy rule from part 1, now in two dimensions.

M = [68 72 75 70 65 60 58;
     70 74 77 71 66 62 60;
     65 69 73 68 63 58 55];

% --- copying the whole matrix ----------------------------------------------
M2 = M;
M2(1, 1) = 999;

disp(M2)      % top-left is 999
disp(M)       % untouched -- all 21 values were copied, not shared

% --- copying a block -------------------------------------------------------
newM = M(2:end, 4:end);    % sensors 2-3, Thursday to Sunday
size(newM)                 % 2   4

newM(1, 1) = 0;
disp(newM)
disp(M)                    % still the original

% Want the original updated? Write the block back in:
M(2:end, 4:end) = newM;
disp(M)

% --- the part 1 challenge, in 2D -------------------------------------------
row = M(1, :);
row(1) = 999;
disp(M(1, 1))    % did M change? Work it out before you run it.
