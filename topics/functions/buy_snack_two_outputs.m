% buy_snack_two_outputs.m
% Companion code for "MATLAB Functions Can't Touch Your Variables" (YouTube)
%
% Catching two outputs, and what happens when you silently drop one.

wallet = 2.00;

% Catch both: square brackets in the function line, square brackets here.
[snack, change] = vend_two_outputs(wallet);

fprintf('Snack:  %s\n', snack);
fprintf('Change: %.2f\n', change);

% Now ask for ONE output. This is legal. MATLAB does not complain, does
% not warn, and does not guess what you meant. It hands you the FIRST
% output on the function line -- which is the snack.
change = vend_two_outputs(wallet);

% No semicolon: type a name and MATLAB shows you what is in that box.
% The box is called `change` and it is holding the word Chips.
change

fprintf('Wallet: %.2f\n', wallet);

% Expected output (MATLAB's default `format loose` also puts a blank line
% above and below the `change =` display -- left out here for readability):
%   Snack:  Chips
%   Change: 0.50
%   change =
%       'Chips'
%   Wallet: 2.00
%
% A variable called `change` now holds the word Chips, and `wallet` is
% still 2.00 -- both of the video's rules in four lines. Position decides
% which output is which. Never the name.
