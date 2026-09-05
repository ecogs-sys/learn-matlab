function g = rgb2gray(rgb)
%RGB2GRAY  Base-MATLAB stand-in for the Image Processing Toolbox rgb2gray.
%
%   ONLY add this folder to your path if you do NOT have the Image
%   Processing Toolbox:
%
%       addpath fallback
%
%   If you do have the toolbox, adding this folder SHADOWS the real
%   rgb2gray and you should not do it. Run check_setup.m if you are not
%   sure.
%
%   Three stacked matrices in, one matrix out -- exactly what the video
%   says. It is a WEIGHTED blend, not a plain average, because human vision
%   is far more sensitive to green than to blue. These are the same
%   Rec. ITU-R BT.601 luma weights the real function uses:
%
%       0.2989 * red  +  0.5870 * green  +  0.1140 * blue
%
%   Results may differ from the toolbox version by one grey level here and
%   there, purely from rounding. Nothing in this folder depends on that.

if ndims(rgb) ~= 3 || size(rgb, 3) ~= 3
    error('rgb2gray:notRGB', ...
          'Expected an H-by-W-by-3 colour image.');
end

R = double(rgb(:, :, 1));
G = double(rgb(:, :, 2));
B = double(rgb(:, :, 3));

g = uint8(0.2989*R + 0.5870*G + 0.1140*B);
end
