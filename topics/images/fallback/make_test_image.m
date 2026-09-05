function make_test_image(filename)
%MAKE_TEST_IMAGE  Build a colour test photo from scratch, base MATLAB only.
%
%   Use this if  which('peppers.png')  comes up empty on your MATLAB
%   install, so the files in this folder still have something to work on:
%
%       addpath fallback
%       make_test_image
%
%   then change the top line of each script to
%
%       imageFile = 'test_pattern.png';
%
%   It writes a 384-by-512-by-3 uint8 PNG -- the same shape as peppers.png,
%   so every crop range and index in this folder still lands inside it.
%
%   You do not need to understand this file. It is a utility, not a lesson.

if nargin < 1
    filename = 'test_pattern.png';
end

rows = 384;
cols = 512;

% A row number and a column number at every pixel.
r = repmat((1:rows)', 1, cols);
c = repmat( 1:cols,  rows, 1);

% Red ramps left to right, green ramps top to bottom, blue is a soft
% chequer -- so the result has bright regions, dark regions, and texture.
red   = uint8(255 * (c / cols));
green = uint8(255 * (r / rows));
blue  = uint8(255 * (0.5 + 0.45 * sin(r/25) .* cos(c/25)));

rgb = cat(3, red, green, blue);

imwrite(rgb, filename);

fprintf('Wrote %s (%d x %d x 3, uint8) into %s\n', ...
        filename, rows, cols, pwd);
end
