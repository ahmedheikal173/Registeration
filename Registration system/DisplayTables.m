function [Table1,Table2,Table3,R,R2,R3]=DisplayTables(Table1,Table2,Table3,R,R2,R3)
fprintf('1)Display table1    2)Display table2    3)Display table3\n');
Choosein6=input('Choose from the previous Submenu:');
while Choosein6~=1 && Choosein6~=2 && Choosein6~=3
      Choosein6=input('Choose only from the previous Submenu:');
end
if Choosein6==1
   fprintf('CourseID   CreditHours   MaxGrade\n');
   for i=1:R-1
       fprintf('   %d          %d           %d\n',Table1(i,1),Table1(i,2),Table1(i,3));
   end
elseif Choosein6==2
   fprintf('StudentID   OldGPA   No.of Completed CHs\n');
   for i=1:R2-1
       fprintf(' %d     %4.2f            %d\n',Table2(i,1),Table2(i,2),Table2(i,3));
   end
elseif Choosein6==3
   fprintf('StudentID   CourseID     CW Grade   Final Exam Grade\n');
   for i=1:R3-1
       fprintf('%d        %d          %d           %d\n',Table3(i,1),Table3(i,2),Table3(i,3),Table3(i,4));
   end
end
end