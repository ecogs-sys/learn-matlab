% cart_discount.m
% Companion code for "MATLAB for Loops Don't Have to Count" (YouTube)
%
% The fix for cart_discount_bug.m, and the whole rule of this video in
% one file:
%
%     reading values?      walk the values,   for price = cart
%     writing them back?   you need the index, for i = 1:length(cart)
%
% Both loops are below, each doing the job it is actually good at.

cart = [4 12 3 9 2];

% ---- WRITING: the index form. -------------------------------------
% cart(i) on the LEFT of the = is what changes the cart. You have to
% say WHERE the new value goes, and a position is the only way to say
% where.
for i = 1:length(cart)
    cart(i) = cart(i) - 1;
end

fprintf('cart is now: ');
fprintf('%d ', cart);
fprintf('\n');

% ---- READING: the value form. -------------------------------------
% Nothing is being changed here, so no index is needed.
total = 0;
for price = cart
    total = total + price;
end

fprintf('New total: %d dollars\n', total);

% Expected output:
%   cart is now: 3 11 2 8 1
%   New total: 25 dollars
%
% WORTH TRYING (this is real MATLAB you already know):
%   Replace the whole first loop with one line --  cart = cart - 1;
%   Whole-vector arithmetic (arrays part 1, scene 14) does the same job
%   with no loop at all, and in real code that is what you would write.
%   The loop is here because it is what shows you WHY the value form
%   could not do it: cart(i) on the left of the = can change the cart,
%   and price never can.
