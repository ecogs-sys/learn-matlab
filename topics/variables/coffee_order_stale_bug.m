% coffee_order_stale_bug.m
% The break-it-on-purpose version from the video.
%
% This is the bug you write by accident, not the one you write on
% purpose: the price changes AFTER the total has already been worked
% out, and nobody works it out again.
%
% There is no error and no warning. The script runs perfectly and
% charges the customer 50 cents too little.
%
% (fprintf prints one line to the Command Window. Inside its quote
% marks, %.2f is a slot where a number gets dropped in, shown to 2
% decimal places -- not the start of a comment. A percent sign only
% starts a comment when it sits outside quote marks.)

drinkName = 'Latte';
isMember  = true;
price     = 3.50;
extraShot = 0.80;

total = price + extraShot;   % runs ONCE, here, while price is 3.50

% The shop puts the price up.
price = 4.00;

% ...and that is the whole bug. "total" is a number, not a formula.
% It isn't watching price. Changing price changed exactly one box.
fprintf('Order: %s\n', drinkName);
fprintf('Price: %.2f\n', price);    % 4.00
fprintf('Total: %.2f\n', total);    % 4.30  <-- should be 4.80

% THE FIX: uncomment the line below and run it again.
% total = price + extraShot;
% fprintf('Total, recomputed: %.2f\n', total);   % 4.80
