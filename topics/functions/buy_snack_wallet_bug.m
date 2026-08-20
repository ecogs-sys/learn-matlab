% buy_snack_wallet_bug.m
% Companion code for "MATLAB Functions Can't Touch Your Variables" (YouTube)
%
% Calls vend_takes_coins.m, which sets `coins = 0` inside itself, and then
% checks the wallet. No error, no warning -- and the wallet is untouched.

wallet = 2.00;

change = vend_takes_coins(wallet);

fprintf('Change: %.2f\n', change);
fprintf('Wallet after the call: %.2f\n', wallet);

% Expected output:
%   Change: 0.50
%   Wallet after the call: 2.00
%
% Not 0. Two. The function set ITS OWN COPY to zero.
%
% If you really want the function to change your wallet, there is exactly
% one road: hand a value back, and catch it.
%
%   wallet = vend(wallet);   % now wallet holds the change, 0.50
%
% Try that line and print wallet again.
