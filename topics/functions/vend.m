% vend.m
% Companion code for "MATLAB Functions Can't Touch Your Variables" (YouTube)
%
% A function lives in a file of its OWN, and MATLAB finds it by the FILE
% name. That is why this file has to be called vend.m for `vend(...)` to
% find it, and why it has to sit in the folder you are working in.
%
% DON'T press Run on this file. There is no `coins` for it to work with,
% so MATLAB stops with "Not enough input arguments". Run buy_snack.m
% instead -- that is the script that calls this function.

function change = vend(coins)

    % `coins` is a brand-new box, in this function's OWN workspace, holding
    % a COPY of whatever value was passed in. It is not the caller's
    % variable, whatever the caller happens to have called it.

    price = 1.50;              % created in here -- gone when this function ends

    if coins >= price
        change = coins - price;
    else
        change = coins;        % not enough money: hand every coin straight back
    end

    % Whatever is sitting in `change` when MATLAB reaches `end` is what gets
    % handed back. If some path through this function left `change` unset,
    % MATLAB would stop with:
    %   Output argument "change" (and maybe others) not assigned during
    %   call to "vend".
    % Both branches above assign it, so that cannot happen here.

end
