% vend_two_outputs.m
% Companion code for "MATLAB Functions Can't Touch Your Variables" (YouTube)
%
% The same vend, upgraded to hand back TWO things -- a snack and the
% change -- the way a real vending machine does. In the video this is
% still just "vend"; the longer file name keeps it beside the one-output
% version so you can compare them.
%
% Two outputs means square brackets round them in the function line.
% Called by buy_snack_two_outputs.m -- don't Run this file directly.

function [snack, change] = vend_two_outputs(coins)

    price = 1.50;

    if coins >= price
        snack  = 'Chips';
        change = coins - price;
    else
        snack  = 'Nothing';       % not enough money
        change = coins;           % every coin handed straight back
    end

    % The ORDER these are listed in on the function line above is what
    % decides which is which at the call. Not the names. Ask for one
    % output and you get `snack`, whatever you happen to call it out there.

end
