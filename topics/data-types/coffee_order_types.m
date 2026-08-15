% coffee_order_types.m
% Companion code for "MATLAB data types: '5' is not 5" (YouTube)
%
% The coffee shop order from the "variables" video, with one new question
% asked of it: what KIND of thing is in each box?
%
% "variables" said a box holds exactly ONE value right now. This is the
% other half of that sentence: it also holds exactly one KIND of value.
% That kind is called the variable's TYPE, and class() is how you ask.
%
% Anything after a % on a line is a comment -- a note for you, which
% MATLAB ignores. (Every line in this block is a comment.)
%
% ONE EXCEPTION, so it doesn't trip you up below: some lines call
% fprintf, which prints one line to the Command Window. Inside fprintf's
% quote marks, %s is a slot where a piece of text gets dropped in, %.2f
% is a slot for a number shown to 2 decimal places, and \n means "end
% the line here". A percent sign only starts a comment when it sits
% OUTSIDE quote marks.

% ---- the order, exactly as it was in the variables video --------------
drinkName = 'Latte';
isMember  = true;
price     = 3.50;
extraShot = 0.80;

total = price + extraShot;

fprintf('Order: %s\n', drinkName);
fprintf('Total: %.2f\n', total);        % 4.30

% ---- now ask each box what it is -------------------------------------
% class(name) answers with the type of whatever is in that box right now.
fprintf('\n');
fprintf('drinkName is %s\n', class(drinkName));   % char
fprintf('isMember  is %s\n', class(isMember));    % logical
fprintf('price     is %s\n', class(price));       % double
fprintf('extraShot is %s\n', class(extraShot));   % double
fprintf('total     is %s\n', class(total));       % double

% char    -- short for "character". MATLAB's word for text. You get it by
%            putting quote marks round something.
% logical -- true or false, and nothing else.
% double  -- MATLAB's ordinary number. Whole ones and decimals alike:
%            3.50 is a double and so is 5.
%
% Three different kinds of thing sitting in one Workspace, and nothing on
% the screen told you which was which until you asked.
%
% Try it at the Command Window too, without the fprintf wrapper:
%
%     >> class(price)
%     ans =
%         'double'
%
% MATLAB worked something out and you didn't give the answer a name, so
% it dropped it in a box called ans. That is all ans ever means.
%
% Next: coffee_order_quotes_bug.m, where one pair of quote marks quietly
% ruins the total.
