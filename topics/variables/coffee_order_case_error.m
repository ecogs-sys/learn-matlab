% coffee_order_case_error.m
% The one hard naming rule: MATLAB cares about capital letters.
%
% THIS FILE IS MEANT TO FAIL. Run it and read the error.
%
% (The last line calls fprintf, which prints one line to the Command
% Window. Inside its quote marks, %.2f is a slot where a number gets
% dropped in, shown to 2 decimal places -- not the start of a comment.
% A percent sign only starts a comment when it sits outside quote marks,
% like this whole block.)

price     = 3.50;
extraShot = 0.80;

% There is a box called "price". There is no box called "Price".
% MATLAB does not guess, and it does not look for something close:
%
%     Unrecognized function or variable 'Price'.
%
total = Price + extraShot;

fprintf('Total: %.2f\n', total);

% To fix it, change Price to price on the line above.
% price and Price are two different names, so they would be two
% different boxes.
