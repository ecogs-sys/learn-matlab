% savings_goal_zero_iterations.m
% Companion code for "How the while loop actually works" (YouTube)
%
% Same loop as savings_goal.m, but the starting balance is already past
% the goal. The condition is false on the very first check, so the body
% never runs -- not even once. Proves the loop checks BEFORE it runs.

balance = 1500;
goal = 1200;
rate = 0.05;

while balance < goal
    balance = balance * (1 + rate);
    fprintf('Balance: %.2f\n', balance);
end

fprintf('Final balance: %.2f\n', balance);
