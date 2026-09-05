% colour_layers.m
% Companion code for the "images" video. Video: TBD
%
% Scenes 15-16: that third number. A colour image is three stacked matrices,
% and rgb2gray blends them into one.
%
% Needs the Image Processing Toolbox for imshow and rgb2gray.
% No toolbox? Run  addpath fallback  once. See README.md.

imageFile = 'peppers.png';
img = imread(imageFile);

size(img)              % 384   512     3
class(img)             % uint8

% Three numbers. Rows, columns, and LAYERS. arrays-2d stopped at two
% dimensions on purpose; this is the third.

figure
imshow(img), title('img -- the colour photo')

% --- one layer at a time ---------------------------------------------------
% Three index slots now: row, column, layer -- in that order.
red   = img(:, :, 1);
green = img(:, :, 2);
blue  = img(:, :, 3);

size(red)              % 384   512   <- an ordinary 2D matrix, like gray
class(red)             % uint8

figure
imshow(red),   title('layer 1 -- red')
figure
imshow(green), title('layer 2 -- green')
figure
imshow(blue),  title('layer 3 -- blue')

% Each one displays as a GRAYSCALE photo, because each one is a grayscale
% photo: one number per pixel. Bright in the red layer means "a lot of red
% at that pixel", not "this pixel is red".
%
% Look at a red pepper in the red layer (bright) and in the green layer
% (dark). Then look at a green pepper and see it the other way round.
red(1:6, 1:6)
green(1:6, 1:6)
blue(1:6, 1:6)

% --- writing to a whole layer ----------------------------------------------
% Same brackets, now on the left of the equals. This is the exact line the
% video says out loud, writing straight into img:
img(:, :, 3) = 0;              % every blue value, gone

figure
imshow(img), title('img(:,:,3) = 0 -- pale things go yellow, the whole photo warms up')

% Red plus green is yellow -- but only where red and green were already about
% equal and blue was supplying the whiteness. So:
%   the garlic, the background and the highlights  ->  clearly yellow
%   the red peppers                                ->  still red, a bit more orange
%   the green peppers                              ->  still green, a bit more olive
%   anything blue or purple                        ->  dark
% If your red peppers are still red, you did it right. That is the point.

% That wrote straight into img, and there is no undo -- assigning overwrites,
% same as any other variable. red, green and blue are unaffected, because
% slicing copies. Reload the original before the next section:
img = imread(imageFile);

% --- and that is all rgb2gray was doing ------------------------------------
gray = rgb2gray(img);

size(gray)             % 384   512   <- three matrices in, one matrix out

% It is a weighted blend, not a plain average, because your eye is far more
% sensitive to green than to blue. The weights (Rec. ITU-R BT.601) are:
byHand = uint8(0.2989*double(red) + 0.5870*double(green) + 0.1140*double(blue));

% Flatten with (:) before taking the max -- otherwise max works down the
% columns and hands you 512 answers instead of one. arrays-2d, scene 16.
% Usually within a grey level or two. The real rgb2gray takes an integer path
% for uint8 input, so it can differ from this floating-point version by more
% than one -- the line below prints the real answer, whatever it is.
max(abs(double(gray(:)) - double(byHand(:))))

figure
imshow(gray),   title('rgb2gray(img)')
figure
imshow(byHand), title('the same blend, done by hand')

% --- TRY THIS --------------------------------------------------------------
% 1. Kill each layer in turn -- img(:,:,1) = 0, then (:,:,2), then (:,:,3) --
%    and name the colour each one leaves behind before you look. Watch the
%    pale, neutral areas rather than the peppers: they are where the cast
%    shows up most.
%
% 2. Swap two layers: swapped = img; swapped(:,:,1) = img(:,:,2);
%    swapped(:,:,2) = img(:,:,1). What have the red peppers become?
%
% 3. Try a plain average instead of the weighted blend:
%        flat = uint8((double(red) + double(green) + double(blue)) / 3);
%    Put it next to gray. The green things are the giveaway.
%
% 4. Every trick from the grayscale files works on one layer:
%        img(:, :, 1) = img(:, :, 1) + 40;    % more red, everywhere
%    and it saturates at 255 exactly as before.
