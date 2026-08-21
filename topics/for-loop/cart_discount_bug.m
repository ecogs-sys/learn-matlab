% cart_discount_bug.m
% Companion code for "MATLAB for Loops Don't Have to Count" (YouTube)
%
% Break it on purpose. The shop knocks a dollar off every item, so we
% walk the values and subtract one.
%
% THIS FILE RUNS TO COMPLETION AND GIVES THE WRONG ANSWER.
% Nothing stops. Nothing crashes. The printout even looks perfect.
% cart is not touched, and the customer pays full price.
%
% Why: price is a COPY of the value, not a window into cart. At the top
% of every pass MATLAB puts the next value into price, overwriting
% whatever the last pass left there. Your subtraction really does happen
% -- and is then thrown away.

cart = [4 12 3 9 2];

for price = cart
    % Changes the copy. Never reaches cart.
    % (The MATLAB Editor may underline this line -- see the README.)
    price = price - 1;

    fprintf('Item now costs %d dollars.\n', price);
end

fprintf('cart is now: ');
fprintf('%d ', cart);
fprintf('\n');

% Expected output:
%   Item now costs 3 dollars.
%   Item now costs 11 dollars.
%   Item now costs 2 dollars.
%   Item now costs 8 dollars.
%   Item now costs 1 dollars.
%   cart is now: 4 12 3 9 2
%
% Read those last two lines together. The discount was applied and
% printed. The cart was never discounted. A bug that prints the right
% numbers is the worst kind there is.
%
% The fix is in cart_discount.m: to change cart itself, you have to say
% WHERE -- and saying where means the index.
