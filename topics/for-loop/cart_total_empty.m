% cart_total_empty.m
% Companion code for "MATLAB for Loops Don't Have to Count" (YouTube)
%
% The edge case: what does a for loop do when there is nothing to walk?
%
% Nothing. And that is not an error.
%
% MATLAB still works the collection out before the first pass. It finds
% zero values in it, so it skips the body completely and carries straight
% on to the line after end.

cart   = [];            % an empty cart. No items at all.
total  = 0;
passes = 0;             % counts how many times the body actually runs

for price = cart
    total  = total + price;
    passes = passes + 1;
    fprintf('Body ran. price is %d dollars.\n', price);
end

fprintf('Passes: %d. Cart total: %d dollars\n', passes, total);

% Expected output:
%   Passes: 0. Cart total: 0 dollars
%
% That is the whole output. Nothing inside the loop prints, and passes is
% still 0, because with an empty cart the body never runs at all.
%
% Compare this with the zero-iteration case in the while loop video: a
% while loop runs zero times because its very first check was false. A
% for loop runs zero times because the list was empty. Different reason,
% same calm result -- no error either way.
%
% TRY THIS:
%   cart = 7;  (one number, no brackets) and run it again. You get
%
%     Body ran. price is 7 dollars.
%     Passes: 1. Cart total: 7 dollars
%
%   because now there is something to walk. A single number is a row of
%   one value, so for walks it exactly once.
