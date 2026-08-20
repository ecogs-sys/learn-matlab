% vend_takes_coins.m
% Companion code for "MATLAB Functions Can't Touch Your Variables" (YouTube)
%
% The break-it-on-purpose version. Identical to vend.m except for ONE
% extra line at the bottom: "the machine took my money, so empty the coin
% slot". It does exactly nothing to the caller's wallet.
%
% Called by buy_snack_wallet_bug.m -- don't Run this file directly.

function change = vend_takes_coins(coins)

    price = 1.50;

    if coins >= price
        change = coins - price;
    else
        change = coins;
    end

    % THE BUG. Note where it sits: AFTER the change has been worked out,
    % so the answer this function hands back is still perfectly correct.
    % That is what makes it dangerous. `coins` is this function's own copy;
    % setting it to 0 zeroes the copy, and then the copy is deleted along
    % with everything else in here. The caller's wallet never moved.
    %
    % The Editor may draw a squiggle under this line -- that is a static
    % hint that the value is never used again, not an error. Run the
    % script and the Command Window shows no error and no warning at all.
    coins = 0;

end
