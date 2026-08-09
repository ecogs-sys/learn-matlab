% grade_report_bug.m
% Companion code for "if / elseif / else actually work like this" (YouTube)
%
% Same four grades as grade_report.m, same score. The only change is the
% ORDER of the conditions: loosest (>= 70) is written first. For score = 95
% this silently prints "Grade: C" instead of "Grade: A" -- no error, no
% warning, because MATLAB found a true condition and stopped looking, exactly
% as instructed. The bug is in the ordering, not in any single line.

score = 95;

if score >= 70
    disp('Grade: C');
elseif score >= 80
    disp('Grade: B');
elseif score >= 90
    disp('Grade: A');
else
    disp('Grade: F');
end
