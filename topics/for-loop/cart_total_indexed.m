% cart_total_indexed.m
% Companion code for "MATLAB for Loops Don't Have to Count" (YouTube)
%
% The running example: a shopping cart of five item prices, in whole
% dollars. This file adds them up the way almost everyone writes it the
% first time -- count the positions 1 to 5, then dig each value out of
% the cart with cart(i).
%
% Nothing here is wrong. It works, it is what you will see in every
% textbook, and cart_discount.m needs this form back. It is only two
% steps where one would do. cart_total_values.m deletes the index.

cart  = [4 12 3 9 2];   % five item prices, in dollars
total = 0;              % the accumulator. It lives OUTSIDE the loop.

% length(cart) is 5, so the collection is the row 1 2 3 4 5.
% MATLAB works that row out ONCE, before the first pass. There is no
% condition anywhere in a for loop and nothing to update to make it stop.
for i = 1:length(cart)

    % Two things happen on this line, not one:
    %   1. i gives you a POSITION       (1, then 2, then 3 ...)
    %   2. cart(i) looks up the VALUE at that position
    % Get step 2 wrong and MATLAB usually tells you: cart(i - 1) is
    % cart(0) on the first pass, which is a hard error. The mistake that
    % does NOT tell you is in the loop header -- see TRY THIS.
    total = total + cart(i);

    fprintf('Pass %d: cart(%d) is %d, running total %d\n', i, i, cart(i), total);
end

fprintf('Cart total: %d dollars\n', total);

% Expected output:
%   Pass 1: cart(1) is 4, running total 4
%   Pass 2: cart(2) is 12, running total 16
%   Pass 3: cart(3) is 3, running total 19
%   Pass 4: cart(4) is 9, running total 28
%   Pass 5: cart(5) is 2, running total 30
%   Cart total: 30 dollars
%
% TRY THIS:
%   Change the loop header to  for i = 1:length(cart) - 1  and run it
%   again. You get 28 dollars, no error and no complaint: the loop stops
%   one item early and the 2-dollar item is never added. This is the bug
%   the video opens with. An off-by-one in a stopping point is a wrong
%   answer, not a crash -- which is why it is so easy to hand in.
