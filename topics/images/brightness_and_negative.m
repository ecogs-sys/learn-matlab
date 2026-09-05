% brightness_and_negative.m
% Companion code for the "images" video. Video: TBD
%
% Scenes 05-07: brightness is addition, uint8 saturates, and a negative is
% one subtraction.
%
% Needs the Image Processing Toolbox for imshow and rgb2gray.
% No toolbox? Run  addpath fallback  once. See README.md.

imageFile = 'peppers.png';
gray = rgb2gray(imread(imageFile));

% --- brightness: one number, applied to every element ----------------------
bright = gray + 40;

disp('before:'), disp(gray(1:6, 1:6))
disp('after +40:'), disp(bright(1:6, 1:6))

figure
imshow(gray),   title('gray')
figure
imshow(bright), title('gray + 40')

% No loop. Not a nested loop over 384 rows and 512 columns. One line, and it
% is the same line you wrote for a grid of temperatures in arrays-2d.

% --- the catch: uint8 arithmetic SATURATES ---------------------------------
% A uint8 holds whole numbers 0 to 255. It cannot hold 270, and it cannot
% hold -30. So MATLAB clamps to the nearest end and says nothing at all.

uint8(230) + 40      % 255, not 270  -- clamped at the top
uint8(10)  - 40      % 0,   not -30  -- clamped at the bottom, and it does
                     %                  NOT wrap round to 226 either

% Which means brightening is LOSSY at the top end. Count how many pixels got
% clamped:
clamped = sum(bright(:) == 255) - sum(gray(:) == 255);
fprintf('%d pixels were pushed all the way to pure white.\n', clamped);

% Those pixels used to be different from each other. Now they are all 255,
% and the difference between them is gone for good.
%
% (The video's challenge is about exactly this. Work it out on paper before
%  you make MATLAB do it for you -- that is the whole exercise.)

% --- the negative: one subtraction -----------------------------------------
neg = 255 - gray;

disp('original:'), disp(gray(1:6, 1:6))
disp('negative:'), disp(neg(1:6, 1:6))     % every value is 255 minus the one above

figure
imshow(neg), title('255 - gray')

% Nothing saturates here: 255 minus a number in 0..255 is always in 0..255.
% Not a function. A subtraction.

% --- TRY THIS --------------------------------------------------------------
% 1. Try gray * 2 and gray / 2. What happens to the bright end of gray * 2,
%    and why? Which one is reversible?
%
% 2. gray + 40 then - 40 does not give you gray back. Before running
%    anything, predict how many pixels come home unchanged and how many do
%    not. Then check with isequal and a count. Doing it in your head first is
%    the point -- the answer is the video's challenge.
