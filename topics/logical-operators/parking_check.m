% parking_check.m
% Companion code for "MATLAB's & Won't Guard You -- && Will" (YouTube)
%
% The running example from the video. A parking garage is a row vector:
% 1 means the bay is occupied, 0 means it is empty. Someone asks for a
% spot number, and we answer one question about it -- is that spot both
% real and taken?
%
% This version only checks the CEILING (request <= length(spots)).
% That is on purpose. parking_check_guarded.m adds the floor.

spots   = [1 0 1 0 0];   % bays 1 and 3 are occupied
request = 3;

% Two equals signs on the right: "==" asks a question.
% One equals sign puts a value in a box.
%
% && reads left to right and stops the instant the answer is settled.
% If the left half is false, the whole AND is false whatever the right
% half says -- so MATLAB never evaluates spots(request).
taken = request <= length(spots) && spots(request) == 1;

if taken
    fprintf('Spot %d is taken.\n', request);
else
    fprintf('Spot %d is free.\n', request);
end

% TRY THIS (scene 05 of the video):
%   Change request to 7 and run it again. There is no spot 7, so the left
%   half is false, && stops, and spots(7) is never evaluated. No error.
%
%   Then read what it printed: "Spot 7 is free." Safe, and still wrong --
%   there is no spot 7 to be free. That is what parking_check_guarded.m
%   is for.
