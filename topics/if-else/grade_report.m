% grade_report.m
% Companion code for "if / elseif / else actually work like this" (YouTube)
%
% Extends pass_fail.m to more than two outcomes with elseif. MATLAB checks
% these top to bottom and stops at the first one that's true -- score 72
% never reaches the >= 80 or >= 90 checks, and it never reaches else either.

score = 72;

if score >= 90
    disp('Grade: A');
elseif score >= 80
    disp('Grade: B');
elseif score >= 70
    disp('Grade: C');
else
    disp('Grade: F');
end
