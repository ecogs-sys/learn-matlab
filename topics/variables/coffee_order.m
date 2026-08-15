% coffee_order.m
% Companion code for "MATLAB variables don't update themselves" (YouTube)
%
% The main example from the video: one coffee shop order, built one
% variable at a time. A variable is a box that holds exactly ONE value
% right now. Assigning to it wipes whatever was in there before.
%
% Anything after a % on a line is a comment -- a note for you. MATLAB
% ignores it completely. (Every line in this block is a comment.)
%
% The semicolon at the end of each line means "do it quietly": run the
% line, but don't show the answer. Delete one and run this again to see
% the difference.
%
% ONE EXCEPTION TO THE % RULE, so it doesn't trip you up below: some
% lines here call fprintf, which prints one line to the Command Window.
% Inside fprintf's quote marks, %.2f is NOT the start of a comment -- it
% is a slot where a number gets dropped in and shown to 2 decimal
% places. %s is a slot for text, and \n means "end the line here".
% A percent sign only starts a comment when it sits outside quote marks
% -- which is what the trailing "% 4.30" notes on the lines below are.

% ---- the order -------------------------------------------------------
drinkName = 'Latte';   % a box can hold text, not only numbers
isMember  = true;      % ...and it can hold a plain true or false
price     = 3.50;
extraShot = 0.80;

% The equals sign is an INSTRUCTION, and it runs right to left:
% work out 3.50 + 0.80 first, then put the answer in the box "total".
total = price + extraShot;

fprintf('Order: %s\n', drinkName);
fprintf('Total: %.2f\n', total);   % 4.30

% ---- the shop puts the price up --------------------------------------
price = 4.00;

% 3.50 is now GONE. Not hidden, not stored anywhere -- gone. And notice
% "total" has not moved: it is a number that was worked out once, back
% when price was 3.50. It is not a live formula watching price.
fprintf('Price is now: %.2f\n', price);
fprintf('Total is still: %.2f\n', total);   % 4.30 -- 50 cents too little

% The fix: run the total line again, now that price has changed.
total = price + extraShot;
fprintf('Total, recomputed: %.2f\n', total);   % 4.80

% ---- the customer adds a second shot ---------------------------------
% This line looks like nonsense in maths -- nothing equals itself plus
% 0.80. It isn't a claim, it's an instruction. Right side first, using
% what is in the boxes RIGHT NOW: 4.80 + 0.80 = 5.60. Then 5.60 goes
% into total, wiping the 4.80.
total = total + extraShot;
fprintf('Total with second shot: %.2f\n', total);   % 5.60
