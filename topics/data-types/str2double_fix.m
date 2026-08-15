% str2double_fix.m
% The repair from the video, and the habit worth stealing.
%
% The arithmetic in coffee_order_quotes_bug.m was never wrong. The TYPE
% was wrong. So that is what you fix.
%
% (fprintf prints one line to the Command Window. Inside its quote marks,
% %s is a slot for text and %.2f a slot for a number to 2 decimal places
% -- not the start of a comment.)

drinkName = 'Latte';
isMember  = true;
price     = '5';          % text, by accident
extraShot = 0.80;

% ---- the habit -------------------------------------------------------
% When a number comes out wrong and there is no error anywhere, ask what
% type you are actually holding BEFORE you touch the arithmetic. The
% arithmetic is almost never the problem.
fprintf('before: price is %s\n', class(price));   % char

% ---- the fix ---------------------------------------------------------
% str2double takes text and hands back a number. Read the name as
% "string to double": text in, number out.
price = str2double(price);

fprintf('after:  price is %s\n', class(price));   % double

total = price + extraShot;
fprintf('Total: %.2f\n', total);   % 5.80  -- correct at last

% ---- the other direction ---------------------------------------------
% num2str takes a number and hands back text. Useful when you want to
% build a label rather than do sums with it.
label = num2str(price);
fprintf('label is %s, and its class is %s\n', label, class(label));   % 5, char

% One thing to know before you meet it by surprise: if you hand
% str2double something that is not a number at all, such as
% str2double('Latte'), it does not error either. It hands back NaN,
% MATLAB's marker for "not a number".
