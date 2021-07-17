function STperCourse(Table1,Table3,R,R3)
n=1;
for i=1:R-1
    c=0;
    for d=2:R3-1
        if Table1(i,1)==Table3(d,2)
            c=c+1;
        end
    end
    NumberofSTperCourses(n)=c;
    n=n+1;
end
fprintf('1)Excel     2)Command window\n');
Choosein9=input('Would you like to display the table of (Number of students per course) on excel or command window?');
while Choosein9~=1 && Choosein9~=2
      Choosein9=input('Choose either from 1 or 2');
end
if Choosein9==1
   Header={'CourseID','No of sts'};
   xlswrite('Table9',Header,'Section1');
   xlswrite('Table9',Table1(:,1),'Section1','A2');
   xlswrite('Table9',NumberofSTperCourses','Section1','B2');
elseif Choosein9==2
   disp('Table of students per course');
   fprintf('CourseID     Number of registered in this course\n');
   for i=1:R-1
       fprintf('   %d                         %d\n',Table1(i,1),NumberofSTperCourses(i));
   end
end
end