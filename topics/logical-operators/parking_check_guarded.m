% parking_check_guarded.m
% Companion code for "MATLAB's & Won't Guard You -- && Will" (YouTube)
%
% The finished version. parking_check.m only had a ceiling, so it was
% still happy to be asked about spot 0 -- and spots(0) is a hard error in
% MATLAB ("Array indices must be positive integers or logical values"),
% not a way of getting the first element.
%
% So the guard gets a floor as well as a ceiling, and both operators do
% their job:
%
%   ||  stops the instant something is TRUE  (one true side is enough)
%   &&  stops the instant something is FALSE (both sides have to be true)
%   ~   flips a true to a false and a false to a true

spots   = [1 0 1 0 0];   % bays 1 and 3 are occupied
request = 0;

% Below the floor, or above the ceiling? Either one settles it, so || can
% stop after the first half.
badRequest = request < 1 || request > length(spots);

% ~badRequest is false for a bad request, and false settles an AND -- so
% spots(request) is never evaluated for a spot that does not exist.
taken      = ~badRequest && spots(request) == 1;

if badRequest
    fprintf('There is no spot %d.\n', request);
elseif taken
    fprintf('Spot %d is taken.\n', request);
else
    fprintf('Spot %d is free.\n', request);
end

% TRY THIS:
%   request = 0   ->  There is no spot 0.     (and spots(0) never runs)
%   request = 7   ->  There is no spot 7.     (and spots(7) never runs)
%   request = 3   ->  Spot 3 is taken.
%   request = 2   ->  Spot 2 is free.
%
% This is also the file the video's challenge asks you to edit. The
% challenge is written out in the README in this folder.
