% double_bug.m
% Companion code for the "images" video. Video: TBD
%
% Scene 14: break it on purpose. double(gray) then imshow gives you a white
% rectangle, with no error and no warning anywhere.
%
% Needs the Image Processing Toolbox for imshow and rgb2gray.
% No toolbox? Run  addpath fallback  once. See README.md -- the fallback
% imshow reproduces this bug faithfully, because the bug is the point.

imageFile = 'peppers.png';
gray = rgb2gray(imread(imageFile));

figure
imshow(gray), title('gray -- uint8, and it looks fine')

% --- the bug ---------------------------------------------------------------
d = double(gray);

figure
imshow(d), title('double(gray) -- a white rectangle')

% Nothing stopped. Nothing crashed. No warning. And your photo is gone.

% --- why -------------------------------------------------------------------
% The numbers did not move:
isequal(d, double(gray))        % 1
disp(gray(1:6, 1:6))
disp(d(1:6, 1:6))               % identical, just written with a .0000 on them

% What changed is the TYPE:
class(gray)                     % uint8
class(d)                        % double

% And imshow reads the type to decide what "white" means:
%
%     uint8  image  ->  displayed over the range 0 to 255
%     double image  ->  displayed over the range 0 to 1
%
% So every pixel of d with a value of 1 or more renders as pure white. Only
% a true 0 stays black. Count the survivors:
fprintf('pixels that are exactly 0 (still black): %d out of %d\n', ...
        sum(d(:) == 0), numel(d));

% This is data-types scene 07, applied to a picture instead of a number:
% wrong result, no error anywhere -> ask class first.

% --- the fix, two ways -----------------------------------------------------
figure
imshow(gray),    title('fix 1: keep it uint8')

figure
imshow(d / 255), title('fix 2: divide by 255, so the range really is 0 to 1')

% Note the fix is about DISPLAY, not about the data. double(gray) is a
% perfectly reasonable thing to have -- you might need it to do arithmetic
% that would otherwise saturate. It is imshow that has to be told, or given
% something already in 0 to 1.

% --- TRY THIS --------------------------------------------------------------
% 1. imshow(d / 1000). Now everything is below 1, so nothing clips to white.
%    What has it done to the picture, and why?
%
% 2. Go the other way: imshow(uint8(d)) turns it back. Check with isequal
%    that uint8(d) really is gray again.
%
% 3. Do some arithmetic that NEEDS double, then come back:
%        avg = (double(gray) + double(mirror)) / 2;   % blend two images
%    and display it with imshow(uint8(avg)). Where does the uint8 go, and
%    what happens if you leave it out? (Build mirror yourself first:
%    mirror = gray(:, end:-1:1);)
