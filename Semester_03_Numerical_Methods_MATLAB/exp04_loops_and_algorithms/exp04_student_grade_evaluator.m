%{
Exp 4.5
find a grade of a student who scored 81 marks
if A(>=90) and B(<90 and>=80) and C(>=70 and <80) 
and D(>=60 and <70) else F.
%}

mark = 81; %define=d the marks

% Determine the grade based on the marks
if mark >= 90
    grade = 'A';
elseif mark >= 80
    grade = 'B';
elseif mark >= 70
    grade = 'C';
elseif mark >= 60
    grade = 'D';
else
    grade = 'F';
end

%display the grade
disp('garde = '); disp(grade);