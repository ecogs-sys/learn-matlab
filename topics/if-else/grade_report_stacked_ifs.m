% grade_report_stacked_ifs.m
% Companion code for "if / elseif / else actually work like this" (YouTube)
%
% Contrast with grade_report.m: these are three SEPARATE if statements, not
% one elseif chain. Each is its own independent decision with no memory of
% the others, so for score = 95, all three conditions are true and all three
% print. An elseif chain would have stopped after the first match.

score = 95;

if score >= 90
    disp('Grade: A');
end
if score >= 80
    disp('Grade: B');
end
if score >= 70
    disp('Grade: C');
end
