% parking_check_amp_bug.m
% Companion code for "MATLAB's & Won't Guard You -- && Will" (YouTube)
%
% *** THIS FILE IS SUPPOSED TO ERROR. Run it, read the message. ***
%
% This is parking_check_guarded.m with request set to 7 and ONE character
% deleted: the second ampersand on the "taken" line. Nothing else is
% different.
%
% Expected message:
%   Index exceeds the number of array elements. Index must not exceed 5.
%
% (Older MATLAB releases word this differently -- R2018b-R2020b print
%  "Index exceeds the number of array elements (5)." and older ones print
%  "Index exceeds matrix dimensions." Same error, same cause.)

spots   = [1 0 1 0 0];
request = 7;

badRequest = request < 1 || request > length(spots);
%
% BUG: single & instead of &&.
%
% The line above has ALREADY worked out that there is no spot 7, so
% badRequest is true and ~badRequest is false. The answer to this AND is
% settled before MATLAB reaches the operator. && would stop right there.
% & does not promise you that -- here, on the right of an equals sign, it
% works out both halves and then combines them, so spots(7) is evaluated
% anyway, and that is the crash. (See the footnote in this folder's
% README for the one place & behaves differently.)
%
taken      = ~badRequest & spots(request) == 1;   % <-- errors here

if badRequest
    fprintf('There is no spot %d.\n', request);
elseif taken
    fprintf('Spot %d is taken.\n', request);
else
    fprintf('Spot %d is free.\n', request);
end

% THE FIX: put the ampersand back.
%
% WORTH TRYING: change the || on the badRequest line to a single | too,
% and run it again. You get the same crash, in the same place, and not a
% squeak out of the | -- both halves of THAT line are safe to work out,
% so nothing goes wrong there.
%
% That is exactly why this bug is nasty. A single ampersand or a single
% pipe costs you nothing at all until the day the half it should have
% skipped is the half that blows up.
