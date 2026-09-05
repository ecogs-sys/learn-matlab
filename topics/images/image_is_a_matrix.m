% image_is_a_matrix.m
% Companion code for the "images" video. Video: TBD
%
% Scenes 02-04: load it, look at the numbers, change one of them.
%
% Needs the Image Processing Toolbox for imshow and rgb2gray.
% No toolbox? Run  addpath fallback  once. See README.md.

imageFile = 'peppers.png';

% --- a file becomes an ordinary variable -----------------------------------
img = imread(imageFile);

size(img)      % 384   512     3   <- THREE numbers, not two
class(img)     % uint8

% Nothing exotic arrived. Look in the Workspace: img is a variable, like any
% other variable you have ever made. The 3 on the end is the colour layers.
% Park it -- colour_layers.m unpacks it, and so does the end of the video.

% --- collapse the three colour layers into one grey matrix -----------------
gray = rgb2gray(img);

size(gray)     % 384   512   <- now it is a plain 2D matrix
class(gray)    % uint8
numel(gray)    % 196608 pixels

figure
imshow(gray)
title('gray -- a 384x512 matrix of uint8 numbers')

% --- the numbers ARE the picture -------------------------------------------
% An ordinary block slice. Rows 1 to 6, columns 1 to 6. Nothing new here --
% this is exactly what you did to a grid of sensor readings in arrays-2d.
corner = gray(1:6, 1:6)

% uint8: unsigned, 8 bit. Whole numbers from 0 to 255, and nothing else.
%   0   is black
%   255 is white
%   everything between is a shade of grey
min(gray(:))
max(gray(:))

% --- read one pixel: row first, column second ------------------------------
gray(1, 1)        % the top-left pixel, as one plain number
gray(200, 300)    % row 200, column 300 -- NOT column 200, row 300

% --- write one pixel, and the picture is different -------------------------
gray(1, 1) = 255;      % one dot, now pure white

gray(1:6, 1:6)         % look at the corner again: the top-left is 255

figure
imshow(gray)
title('one number changed')

% You will never see it. That is 1 dot out of 196608. But you did not edit a
% picture -- you assigned a number, and the picture is different.
%
% Note that this was destructive. gray(1,1) is 255 now and there is no undo,
% exactly like any other variable. copy_and_save.m is where that gets fixed.

% --- TRY THIS --------------------------------------------------------------
% 1. Reload gray, then set a whole block to white instead of one pixel:
%        gray = rgb2gray(imread(imageFile));
%        gray(1:40, 1:40) = 255;
%        figure, imshow(gray)
%    Now you can see it.
%
% 2. Print gray(1:6, 1:6) before and after. Which numbers changed, and which
%    did not? Match every changed number to a changed pixel in the image.
