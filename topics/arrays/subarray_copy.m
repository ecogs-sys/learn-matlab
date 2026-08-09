% subarray_copy.m
% Companion code for "MATLAB Arrays Don't Start at Index 0" (YouTube)
%
% Slicing a piece out of an existing array and saving it under a new
% name works the same way in 1D and 2D -- and the result is still an
% independent copy, not a view into the original.

temps = [68 72 75 70 65 60 58 66];   % grown to 8 elements, as in vector_basics.m
newTemps = temps(4:end);             % everything after the 3rd day
disp(newTemps)

M = [68 72 75 70 65 60 58;
     70 74 77 71 66 62 60;
     65 69 73 68 63 58 55];
newM = M(3:end, 4:end);              % everything after row 2 and column 3
disp(newM)

% Proof it's a copy, not a reference: changing the slice doesn't touch
% the originals.
newTemps(1) = -1;
newM(1, 1) = -1;
disp(temps)   % unchanged
disp(M)       % unchanged
