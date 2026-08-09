% pass_fail.m
% Companion code for "if / elseif / else actually work like this" (YouTube)
%
% The simplest form: just if and else. MATLAB runs exactly one of the two
% blocks below, never both, never neither. Try changing score to something
% below 60 and re-run.

score = 72;
threshold = 60;

if score >= threshold
    disp('Pass');
else
    disp('Fail');
end
