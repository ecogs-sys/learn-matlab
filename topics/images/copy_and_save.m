% copy_and_save.m
% Companion code for the "images" video. Video: TBD
%
% Scene 13: the copy rule holds for images, and imwrite puts a matrix back
% on your disk as a file.
%
% Needs the Image Processing Toolbox for imshow and rgb2gray.
% No toolbox? Run  addpath fallback  once. See README.md.

imageFile = 'peppers.png';
gray = rgb2gray(imread(imageFile));

% --- assigning to gray itself is destructive -------------------------------
% There is no undo. Same as any other variable, since the very first video.
before = gray(1, 1);
gray(1, 1) = 255;
after  = gray(1, 1);

fprintf('gray(1,1) went from %d to %d, and %d is gone.\n', before, after, before);

% Reload to get a clean original back:
gray = rgb2gray(imread(imageFile));

% --- so work on a copy -----------------------------------------------------
edited = gray;                  % a real, independent copy of all 196608 values

edited(1:60, 1:60) = 255;       % white square in the corner of the COPY
edited(gray > 200) = 0;         % and black out the brightest pixels

isequal(edited, gray)           % 0 -- they are different now

% The same corner the video keeps on screen. The copy's is all 255 now;
% the original's is untouched, which is the whole point of this file.
disp('gray corner:'),   disp(gray(1:6, 1:6))
disp('edited corner:'), disp(edited(1:6, 1:6))

gray(1, 1)                      % the original is exactly as it was

figure
imshow(gray),   title('gray -- untouched')
figure
imshow(edited), title('edited -- a copy, changed')

% This is arrays-2d scene 18, unchanged: assigning a matrix copies every
% value into a brand new variable. It does not make two names for one grid.

% --- getting it back out of MATLAB -----------------------------------------
% imread turns a file into a matrix. imwrite does the opposite.
imwrite(edited, 'my_peppers.png');

fprintf('wrote my_peppers.png into %s\n', pwd);

% Read your own file straight back in and check it survived:
roundTrip = imread('my_peppers.png');

size(roundTrip)                 % 384   512
class(roundTrip)                % uint8
isequal(roundTrip, edited)      % 1 -- PNG is lossless, nothing changed

% imread and imwrite are base MATLAB. No toolbox needed for either.

% --- TRY THIS --------------------------------------------------------------
% 1. Save as a JPEG instead: imwrite(edited, 'my_peppers.jpg'). Read it back
%    and run isequal against edited. Why is the answer different this time?
%
% 2. Copy a BLOCK rather than the whole thing:
%        block = gray(101:300, 201:400);
%        block(1, 1) = 0;
%        gray(101, 201)
%    Did gray change? Slicing copies too.
%
% 3. Write the block back into the original where it came from:
%        gray(101:300, 201:400) = block;
%    That is how you edit a region without touching the rest.
