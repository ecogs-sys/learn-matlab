% crop_and_mirror.m
% Companion code for the "images" video. Video: TBD
%
% Scenes 08-10: a crop is a block slice, a mirror is a colon that counts
% backwards, and transpose puts the photo on its side (and mirrors it).
%
% Needs the Image Processing Toolbox for imshow and rgb2gray.
% No toolbox? Run  addpath fallback  once. See README.md.

imageFile = 'peppers.png';
gray = rgb2gray(imread(imageFile));

size(gray)     % 384   512

% --- crop: a rectangle of a matrix -----------------------------------------
% You do not need a crop function for this. Ranges in both slots, rows
% first, columns second -- arrays-2d, unchanged.
cropped = gray(101:300, 201:400);

size(cropped)          % 200   200
% 300 - 101 + 1 = 200. A colon range includes BOTH ends.

figure
imshow(cropped), title('gray(101:300, 201:400)')

% gray is untouched. You did not cut a rectangle out of it, you copied one
% out of it:
size(gray)             % still 384   512

% --- mirror: the colon that counts backwards -------------------------------
% arrays-1d taught start:step:stop. It never used a negative step. Here it is:
1:1:6                  % 1  2  3  4  5  6
6:-1:1                 % 6  5  4  3  2  1   <- step of MINUS one

% end is "the last position", so end:-1:1 is "every position, backwards".
mirrored = gray(:, end:-1:1);      % every row, columns reversed

figure
imshow(mirrored), title('gray(:, end:-1:1) -- flipped left to right')

% Same trick in the other slot flips it top to bottom:
upsideDown = gray(end:-1:1, :);

figure
imshow(upsideDown), title('gray(end:-1:1, :) -- flipped top to bottom')

% Watch the corner block reverse, so you can see it in the numbers too:
disp('original corner:'),  disp(gray(1:6, 1:6))
disp('mirrored corner:'),  disp(mirrored(1:6, end-5:end))

% --- transpose: on its side, and mirrored -----------------------------------
sideways = gray';

size(gray)             % 384   512
size(sideways)         % 512   384

figure
imshow(sideways), title("gray' -- turned AND mirrored")

% Transpose reflects the grid about its main diagonal. On a grid of sensor
% readings nobody notices the difference between that and a rotation. On a
% photo it is obvious. Prove it on something with a clear left and right:
letter = uint8(255 * ones(9));
letter(2:8, 3)   = 0;   % the spine of a letter F
letter(2,   3:7) = 0;   % top bar
letter(5,   3:6) = 0;   % middle bar

% 9x9 is too small to look at, so blow every pixel up into a 30x30 block.
% kron does that in one line, and it is base MATLAB. You do not need to
% understand this line -- it is here so the F is big enough to see.
bigF     = uint8(kron(double(letter),  ones(30)));
bigFprim = uint8(kron(double(letter'), ones(30)));

figure
imshow(bigF),     title('an F')
figure
imshow(bigFprim), title("F' -- turned AND mirrored, not rotated")

% --- TRY THIS --------------------------------------------------------------
% 1. Mirror it twice: gray(:, end:-1:1)(:, end:-1:1) is not valid MATLAB, so
%    do it in two steps. Is the result identical to gray? Check with isequal.
%
% 2. gray(end:-1:1, end:-1:1) reverses both dimensions at once. Is that the
%    same as gray' ? Predict first, then check with isequal.
%
% 3. Deleting is not cropping. gray(1:100, :) = [] removes the top 100 rows
%    of gray itself, destructively, and leaves a 284x512 image. Try it on a
%    copy and compare it with the crop above. Note that a partial delete --
%    gray(1:100, 1:100) = [] -- is an error, same as in arrays-2d.
