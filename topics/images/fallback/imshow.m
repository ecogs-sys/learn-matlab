function imshow(x)
%IMSHOW  Base-MATLAB stand-in for the Image Processing Toolbox imshow.
%
%   ONLY add this folder to your path if you do NOT have the Image
%   Processing Toolbox:
%
%       addpath fallback
%
%   If you do have the toolbox, adding this folder SHADOWS the real imshow
%   and you should not do it. Run check_setup.m if you are not sure.
%
%   It is built out of image/imagesc/colormap, which are all base MATLAB,
%   and it reproduces the behaviour the video relies on:
%
%       uint8  input   ->  displayed over 0 to 255   (0 black, 255 white)
%       double input   ->  displayed over 0 to 1     (this is the bug in
%                                                      double_bug.m, and it
%                                                      is reproduced on
%                                                      purpose)
%       H-by-W-by-3    ->  a colour image
%
%   See also IMAGE, IMAGESC, COLORMAP.

if ndims(x) == 3
    % Three layers: image() takes a uint8 RGB array directly.
    image(x);
else
    if isa(x, 'uint8')
        imagesc(x, [0 255]);       % white means 255
    else
        imagesc(x, [0 1]);         % white means 1  <- the double trap
    end
    colormap(gray(256));
end

axis image off
end
