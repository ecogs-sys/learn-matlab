% savings_goal_infinite_bug.m
%
% *** WARNING: THIS FILE RUNS FOREVER ON PURPOSE. ***
% This is the "break it live" demo from the video. The line that updates
% balance has been commented out, so the control variable never changes
% and the condition can never become false.
%
% Run this, watch the Command Window print "Balance: 1000.00" forever,
% then click into the Command Window and press Ctrl+C to stop it.

balance = 1000;
goal = 1200;
rate = 0.05;

while balance < goal
    % balance = balance * (1 + rate);   <-- BUG: forgot to update balance
    fprintf('Balance: %.2f\n', balance);
end

fprintf('Final balance: %.2f\n', balance);
