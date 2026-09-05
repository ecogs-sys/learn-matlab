% check_setup.m
% Companion code for the "images" video. Video: TBD
%
% RUN THIS FIRST. It tells you whether the other files in this folder will
% run as written, and exactly what to do if they won't.
%
% Two things this folder needs:
%   1. imshow and rgb2gray  -- these live in the Image Processing Toolbox
%   2. peppers.png          -- MATLAB's sample photo, used by every file
%
% If either is missing, the fix is one line. Read on.

fprintf('\n--- Learn MATLAB: images -- setup check ---\n\n');

% --- 1. the Image Processing Toolbox ---------------------------------------
haveIPT = ~isempty(ver('images'));

if haveIPT
    fprintf('Image Processing Toolbox : FOUND.\n');
    fprintf('   imshow and rgb2gray are the real MathWorks ones. Nothing to do.\n');
else
    fprintf('Image Processing Toolbox : not found.\n');
    fprintf('   Run this once, and every file in this folder works anyway:\n');
    fprintf('       addpath fallback\n');
    fprintf('   That folder holds base-MATLAB stand-ins for imshow and rgb2gray.\n');
    fprintf('   Only add it if you do NOT have the toolbox -- otherwise it\n');
    fprintf('   shadows the real functions.\n');
end

fprintf('\n');

% --- 2. the photo ----------------------------------------------------------
if ~isempty(which('peppers.png'))
    fprintf('peppers.png              : FOUND.\n');
    fprintf('   %s\n', which('peppers.png'));
else
    fprintf('peppers.png              : not found.\n');
    fprintf('   Build a stand-in of the same shape (384 x 512 x 3) with:\n');
    fprintf('       addpath fallback\n');
    fprintf('       make_test_image\n');
    fprintf('   then change the imageFile line at the top of each script to\n');
    fprintf('       imageFile = ''test_pattern.png'';\n');
    fprintf('   Any colour photo of your own works too -- if it is a different\n');
    fprintf('   size, adjust the crop ranges in crop_and_mirror.m to suit.\n');
end

fprintf('\n--- end of setup check ---\n\n');
