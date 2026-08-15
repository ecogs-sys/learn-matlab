% coffee_order_quotes_bug.m
% The break-it-on-purpose file from the video.
%
% THIS FILE IS MEANT TO MISLEAD, NOT TO ERROR. It runs perfectly, prints
% a sensible looking total, and charges the customer 53 dollars 80 for a
% latte.
%
% The story: the shop puts the price up to 5 dollars, and you type it in
% with quote marks round it -- an easy slip, because your fingers are
% already in the habit from typing 'Latte'.
%
% (fprintf prints one line to the Command Window. Inside its quote marks,
% %s is a slot for text, %.2f a slot for a number to 2 decimal places,
% and %d a slot for a whole number -- not the start of a comment. A
% percent sign only starts a comment outside quote marks.)

drinkName = 'Latte';
isMember  = true;
price     = '5';          % <-- THE BUG. The quote marks make this TEXT.
extraShot = 0.80;

fprintf('price is %s\n', class(price));   % char, where it used to be double

% Recomputing the total after changing the price is exactly the right
% habit -- it is what the variables video drilled. Here it is also what
% makes the damage visible.
total = price + extraShot;

fprintf('Total: %.2f\n', total);   % 53.80   <-- should be 5.80
fprintf('total is %s\n', class(total));

% ---- where 53 came from ----------------------------------------------
% MATLAB cannot store the shape of a character. It stores a NUMBER for
% every character, from a fixed list that never changes:
%
%     ' ' is 32      '0' is 48      'A' is 65      'a' is 97
%
% The digits run in order from 48, so '1' is 49, '2' is 50, and '5' is 53.
fprintf('the character 5 is stored as %d\n', double('5'));   % 53

% So price + extraShot was really 53 + 0.80.
%
% Note the word double doing two jobs there. As a TYPE it is MATLAB's
% ordinary number. As an INSTRUCTION, double(...) means "turn this into a
% plain number", which is how you can see the character code yourself.
%
% ---- a deliberate limit of this file ---------------------------------
% Every bit of text here is one character long, on purpose. If you try a
% longer piece of text, like price = '3.50', you get one answer per
% character -- four numbers back instead of one. Same trap, more of it.
% Handling several values at once is the arrays video's job, so leave
% that experiment until then if it confuses you.
%
% THE FIX: str2double_fix.m, in this folder.
