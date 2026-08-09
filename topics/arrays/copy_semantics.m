% copy_semantics.m
% Companion code for "MATLAB Arrays Don't Start at Index 0" (YouTube)
%
% Does M2 = M link the two variables, or copy the data? Run this and
% check both variables afterward.

M = [68 72 75 70 65 60 58;
     70 74 77 71 66 62 60;
     65 69 73 68 63 58 55];

M2 = M;
M2(1, 1) = 999;

disp('M2:'); disp(M2)
disp('M:');  disp(M)   % unchanged -- M2 was an independent copy
