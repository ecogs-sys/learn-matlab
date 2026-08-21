% cart_total_while.m
% Companion code for "MATLAB for Loops Don't Have to Count" (YouTube)
%
% The same cart total, written as a while loop. This file is CORRECT --
% it prints 30, exactly like the other two. It is here to show you what
% for does on your behalf.
%
% Three lines of bookkeeping, and every one of them is a chance to be
% wrong:
%   1. you create the counter yourself
%   2. you get the stopping test right yourself
%   3. you move the counter on yourself

cart  = [4 12 3 9 2];
total = 0;

i = 1;                        % (1) start it at 1, not 0
while i <= length(cart)       % (2) <= not <, or you drop the last item
    total = total + cart(i);
    i = i + 1;                % (3) forget this and it never ends
end

fprintf('Cart total: %d dollars\n', total);

% Expected output:
%   Cart total: 30 dollars
%
% TRY THIS, one at a time, and put each one back afterwards:
%   - change  i = 1;  to  i = 0;      -> a hard error on cart(0): array
%                                        indices must be positive
%   - change  <=  to  <               -> prints 28. No error at all.
%   - delete  i = i + 1;              -> infinite loop. Control-C.
%
% Now count the ways the for loop version can go wrong the same way.
% There aren't any. That is the point.
%
% Use while when you do not know how many passes there will be -- the
% savings-goal example from the while loop video. Use for when you
% already have the list in your hand.
