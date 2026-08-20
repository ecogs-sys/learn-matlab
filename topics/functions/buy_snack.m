% buy_snack.m
% Companion code for "MATLAB Functions Can't Touch Your Variables" (YouTube)
%
% The running example. This script calls vend.m and catches what it hands
% back. Run THIS file, not vend.m.

wallet = 2.00;

% At this call MATLAB does not send `wallet` over. It reads the value
% inside `wallet` -- 2 -- and copies that number into a brand-new box
% called `coins`, inside vend's own workspace. Two boxes, same number,
% no connection between them.
change = vend(wallet);

fprintf('Change: %.2f\n', change);
fprintf('Wallet: %.2f\n', wallet);

% Expected output:
%   Change: 0.50
%   Wallet: 2.00
%
% The name on the LEFT of the equals sign is yours to pick. Try this
% instead and nothing about vend.m has to change:
%
%   myChange = vend(wallet);
%
% The name inside the function and the name outside never meet.
