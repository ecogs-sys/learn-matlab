% logical_arithmetic.m
% The third type in the coffee order, and the rule behind the whole video.
%
% isMember has been sitting in the Workspace since the variables video
% without ever being explained. It is a logical: it holds true or false,
% and nothing else.
%
% A logical does arithmetic too. true counts as 1, false counts as 0.
%
% (fprintf prints one line to the Command Window. Inside its quote marks,
% %s, %.2f and %d are slots for values -- not the start of a comment.)

price     = 5.00;
extraShot = 0.80;
isMember  = true;

total = price + extraShot;
fprintf('Total: %.2f\n', total);              % 5.80
fprintf('isMember is %s\n', class(isMember)); % logical

% ---- true is 1, false is 0 -------------------------------------------
fprintf('true  plus 0 is %d\n', true + 0);    % 1
fprintf('false plus 0 is %d\n', false + 0);   % 0

% ---- so a member discount is one line --------------------------------
% isMember is true, so 0.50 * isMember is 0.50 * 1, which is 50 cents
% off. If isMember were false it would be 0.50 * 0, which is nothing off.
% Same line either way, no decision written out.
total = total - 0.50 * isMember;
fprintf('Member total: %.2f\n', total);       % 5.30

% Once you have met if and else you will often write a discount as a
% proper decision instead, and that is fine. This line is here to show
% what the conversion actually does, not as the only way to write it.
%
% ---- the rule --------------------------------------------------------
% MATLAB would rather convert than complain:
%
%     logical -> 1 or 0              usually exactly what you wanted
%     char    -> its character code  almost never what you wanted
%
% Same mechanism, both times. Only one of them is ever a good day. Which
% is why class() is the first thing to reach for when a number is wrong
% and nothing errored.
