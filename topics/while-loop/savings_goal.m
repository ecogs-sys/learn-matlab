% savings_goal.m
% Companion code for "How the while loop actually works" (YouTube)
%
% This is the main example from the video: keep adding interest to a
% balance until it reaches a savings goal. We don't know in advance how
% many times the loop will run -- that depends on the rate and the goal.

balance = 1000;
goal = 1200;
rate = 0.05;

while balance < goal
    balance = balance * (1 + rate);
    fprintf('Balance: %.2f\n', balance);
end

fprintf('Final balance: %.2f\n', balance);
