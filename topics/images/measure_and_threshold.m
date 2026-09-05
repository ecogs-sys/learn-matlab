% measure_and_threshold.m
% Companion code for the "images" video. Video: TBD
%
% Scenes 11-12: measure the whole photo with one number, then select pixels
% by a condition.
%
% Needs the Image Processing Toolbox for imshow and rgb2gray.
% No toolbox? Run  addpath fallback  once. See README.md.

imageFile = 'peppers.png';
gray = rgb2gray(imread(imageFile));

% --- measure: 196608 numbers in, one number out ----------------------------
% gray(:) stretches the whole matrix into one long column, DOWN the columns.
% That matters: mean(gray) on its own gives you 512 numbers, one per column,
% because mean works down columns by default (arrays-2d, scene 16).
size(gray(:))          % 196608   1

mean(gray(:))          % average brightness of the entire photo
max(gray(:))           % the brightest pixel anywhere
min(gray(:))           % the darkest pixel anywhere

% Compare with the wrong version, so you can see the difference:
size(mean(gray))       % 1   512   <- one average per COLUMN, not what you want

% mean returns a double even though gray is uint8. max and min return uint8.
class(mean(gray(:)))   % double
class(max(gray(:)))    % uint8

fprintf('average brightness: %.1f\n', mean(gray(:)));
fprintf('darkest pixel: %d,  brightest pixel: %d\n', min(gray(:)), max(gray(:)));

% Now do the same to a brightened copy and watch the average move. It does
% NOT go up by exactly 40 -- the pixels that clamped at 255 could not.
fprintf('after +40:          %.1f\n', mean(gray(:) + 40));

% --- threshold: select by condition, then write ----------------------------
% gray > 128 asks all 196608 pixels the same question at once and hands back
% a grid of true/false the same size as gray. Feed that back in as an index
% and MATLAB touches only the true ones. arrays-1d scene 17, in 2D.
above = gray > 128;

class(above)           % logical
size(above)            % 384   512   <- one answer per pixel
sum(above(:))          % how many pixels are brighter than 128

mask = gray;                    % copy first -- see copy_and_save.m
mask(gray > 128)  = 255;
mask(gray <= 128) = 0;

% Note both conditions ask about gray, not about mask. gray is untouched, so
% the second line still describes the ORIGINAL image even though the first
% line has already overwritten every bright pixel. Swap the two lines around
% and you get the same answer -- there is no ordering rule to remember here.

% The same corner the video keeps on screen, before and after. This region is
% dark -- every value is well under 128 -- so the whole block goes to 0.
disp('corner before:'), disp(gray(1:6, 1:6))
disp('corner after:'),  disp(mask(1:6, 1:6))

figure
imshow(gray), title('gray')
figure
imshow(mask), title('mask -- pure black and pure white, two lines, no loop')

% Every value in mask is now 0 or 255 and nothing else:
unique(mask)

% --- TRY THIS --------------------------------------------------------------
% 1. Change 128 to 80, then to 200. Watch the silhouette grow and shrink.
%    Which threshold separates the peppers from the background best?
%
% 2. mean(gray(:)) is a threshold you did not have to guess. Try
%        t = mean(gray(:));
%        mask(gray > t) = 255;
%    Is it better or worse than 128, and why?
%
% 3. Read values out instead of writing them in: gray(gray > 200) gives you
%    every bright pixel as one long column. What does numel of that tell you?
