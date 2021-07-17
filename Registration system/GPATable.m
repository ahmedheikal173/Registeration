function GPATable(Table3,Table1,R,R3)
Table3(:,3)=Table3(:,3)+Table3(:,4);
for j=1:R3-1
    for s=1:R-1
        if Table3(j,2)==Table1(s,1)
           Table3(j,3)=Table3(j,3)*100/Table1(s,3);
        end
    end
end
for i=1:R3-1
    if Table3(i,3)>=97
       Table3(i,3)='A';
       Table3(i,4)='+';
       Grade(i)=1;
    elseif Table3(i,3)>=93
       Table3(i,3)='A';
       Table3(i,4)=' ';
       Grade(i)=2;
    elseif Table3(i,3)>=89
       Table3(i,3)='A';
       Table3(i,4)='-';
       Grade(i)=3;
    elseif Table3(i,3)>=84
       Table3(i,3)='B';
       Table3(i,4)='+';
       Grade(i)=4;
    elseif Table3(i,3)>=80
       Table3(i,3)='B';
       Table3(i,4)=' ';
       Grade(i)=5;
    elseif Table3(i,3)>=76
        Table3(i,3)='B';
        Table3(i,4)='-'; 
        Grade(i)=6;
    elseif Table3(i,3)>=73
        Table3(i,3)='C';
        Table3(i,4)='+';
        Grade(i)=7;
    elseif Table3(i,3)>=70
        Table3(i,3)='C';
        Table3(i,4)=' ';
        Grade(i)=8;
    elseif Table3(i,3)>=67
        Table3(i,3)='C';
        Table3(i,4)='-';
        Grade(i)=9;
    elseif Table3(i,3)>=64
        Table3(i,3)='D';
        Table3(i,4)='+';
        Grade(i)=10;
    elseif Table3(i,3)>=60
        Table3(i,3)='D';
        Table3(i,4)=' ';
        Grade(i)=11;
    else
        Table3(i,3)='F';
        Table3(i,4)=' ';
        Grade(i)=12;
    end
end
Table3E=[Table3(:,1),Table3(:,2),Grade'];
disp('1)Excel   2)Command Window');
Choosein7=input('Would you like to display the table3 on excel or on the command window:');
if Choosein7==1
   Header={'StudentID','CourseID','Grade'};
   xlswrite('Table7',Header,'Section1');
   xlswrite('Table7',Table3E,'Section1','A2')
elseif Choosein7==2
   fprintf('StudentID CourseID Grade\n');
   for i=1:R3-1
       fprintf('%d      %d      %c%c\n',Table3(i,1),Table3(i,2),Table3(i,3),Table3(i,4));
   end
end
end