% cart_total_values.m
% Companion code for "MATLAB for Loops Don't Have to Count" (YouTube)
%
% The same total as cart_total_indexed.m, with the index deleted.
%
%     for price = cart
%
% walks the VALUES in the row, one per pass. No position number is ever
% worked out, so no position number can ever be worked out wrong.
%
% Why this is legal: for i = 1:5 was never a counting instruction. 1:5
% builds a row of numbers (arrays part 1, scene 09), and for walks along
% a row of numbers, handing you one per pass. cart is a row of numbers
% too, so for walks that instead.

cart  = [4 12 3 9 2];
total = 0;              % still outside the loop, still doing the same job

for price = cart
    % price holds the actual dollar amount this pass -- 4, then 12, then
    % 3 -- not the position it came from.
    total = total + price;

    fprintf('price is %d, running total %d\n', price, total);
end

fprintf('Cart total: %d dollars\n', total);

% Expected output:
%   price is 4, running total 4
%   price is 12, running total 16
%   price is 3, running total 19
%   price is 9, running total 28
%   price is 2, running total 30
%   Cart total: 30 dollars
%
% TRY THIS:
%   Add a sixth item:  cart = [4 12 3 9 2 7];  and run it again.
%   Nothing inside the loop changes. There is no bound to update,
%   because there was never a bound to get wrong.
%
% NOTE: this form reads values. It cannot write them back into cart --
% see cart_discount_bug.m for what happens when you try.
