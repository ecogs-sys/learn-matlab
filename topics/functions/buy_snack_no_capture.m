% buy_snack_no_capture.m
% Companion code for "MATLAB Functions Can't Touch Your Variables" (YouTube)
%
% A function works out its answer and hands it back. If there is no box on
% the left of an equals sign to catch it, the answer is gone.

wallet = 2.00;

% No variable on the left, and no semicolon. It runs, it works out 0.50,
% and with nowhere to put the answer MATLAB parks it in `ans`.
% Command Window shows:  ans = 0.5000
vend(wallet)

% ...and the very next thing that returns a value overwrites `ans`.
% Command Window shows:  ans = 0.2500  -- the 0.50 is gone, with no history.
vend(1.75)

% Add a semicolon and you don't even see it happen. This line runs,
% computes 0.50, throws it away, and prints nothing at all.
vend(wallet);

% This is the only version that keeps the answer.
change = vend(wallet);
fprintf('Change: %.2f\n', change);

% Expected output (MATLAB's default `format loose` also puts a blank line
% above and below each `ans =` display -- left out here for readability):
%   ans =
%       0.5000
%   ans =
%       0.2500
%   Change: 0.50
%
% (`ans` is the box MATLAB uses when you didn't name one -- see the
%  "data types" video. Never build anything on top of it: it survives
%  exactly until the next uncaught answer comes along.)
