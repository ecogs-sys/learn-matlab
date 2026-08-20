% buy_snack_inside_gone.m
% Companion code for "MATLAB Functions Can't Touch Your Variables" (YouTube)
%
% The OTHER direction of the same rule: a variable created inside a
% function does not exist once the function has ended.
%
% THIS SCRIPT STOPS WITH AN ERROR ON PURPOSE. That is the whole point.

wallet = 2.00;

change = vend(wallet);

fprintf('Change: %.2f\n', change);

% vend.m created a variable called `price`, holding 1.50. It lived inside
% vend's own workspace while vend was running, and it was thrown out along
% with `coins` the instant vend reached `end`.
%
% So the next line stops with:
%
%   Unrecognized function or variable 'price'.
%
% Same error you met in the "variables" video, and this time it is telling
% you the plain truth: out here, there is no price.
%
% Notice how much friendlier this failure is than the one in
% buy_snack_wallet_bug.m. This one shouts. That one said nothing.
fprintf('Price: %.2f\n', price);

% THE FIX: if you want it out here, hand it back as an output. See
% vend_two_outputs.m for a function that hands back two things at once.
