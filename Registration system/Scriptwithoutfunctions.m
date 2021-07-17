clc
clear
Table1=[];
R=1;
R2=1;
R3=1;
fprintf('Choose from this menu\n');
fprintf('1)Add row to table 1   2)Add row to table \n');
fprintf('3)Add row to table 3   4)Load a table\n');
fprintf('5)Save a table         6)Save a table\n');
fprintf('7) Compute a table for the GPAs of each course for each student during the current semester\n');
fprintf('8)Compute a table for the new cumulative GPAs\n');
fprintf('9)Compute a table showing how many students were registered per course this semester\n');
fprintf('10)End the program\n');
Choose=input('Choose from the previous menu:');
while Choose~=10
    if Choose==1
        row1T1=input('Add arow to table1:');
        while length(row1T1)~=3
          row1T1=input('Add a row to table 1 but its length is 3');
        end
        Table1(R,:)=row1T1;
        R=R+1;
    elseif Choose==2
        row1T2=input('Add arow to table2:');
        while length(row1T2)~=3
          row1T2=input('Add a row to table 2 but its length is 3');
        end
        Table2(R2,:)=row1T2;
        R2=R2+1;
    elseif Choose==3
        row1T3=input('Add arow to table3:');
        while length(row1T3)~=4
          row1T3=input('Add a row to table 3 but its length is 4');
        end
        Table3(R3,:)=row1T3;
        R3=R3+1;
    elseif Choose==4
        fprintf('1)Table1    2)Table2    3)Table3\n');
        Choosein4=input('Choose which table to load:');
         while Choosein4~=1 && Choosein4~=2 && Choosein4~=3
            Choosein4=input('Choose only from the previous Submenu:');
         end
         if Choosein4==1
            ASK4T1=input('Enter the name of the file containing a table:','s');
            Excel1=xlsread(ASK4T1);
            [E1,T1]=size(Excel1);
            Table1(R:E1+R-1,:)=Excel1;
            R=R+E1;
         elseif Choosein4==2
            ASK4T2=input('Enter the name of the file containing a table:','s');
            Excel2=xlsread(ASK4T2);
            [E2,T2]=size(Excel2);
            Table2(R2:E2+R2-1,:)=Excel2;
            R2=R2+E2;
         elseif Choosein4==3
            ASK4T3=input('Enter the name of the file containing a table:','s');
            Excel3=xlsread(ASK4T3);
            [E3,T3]=size(Excel3);
            Table3(R3:E3+R3-1,:)=Excel3;
            R3=R3+E3;
         end       
    elseif Choose==5
        fprintf('1)Table1    2)Table2    3)Table3\n');
        Choosein5=input('Choose which table you want to save:');
        while Choosein5~=1 && Choosein5~=2 && Choosein5~=3
            Choosein5=input('Choose only from the previous Submenu:');
        end
        if Choosein5==1
            Header4T1={'CourseID','CHs','MaxGrade'};
            Ask4T1toSave=input('Enter the name of the saved excel file:','s');
            xlswrite(Ask4T1toSave,Header4T1,'Section 1');
            xlswrite(Ask4T1toSave,Table1,'Section 1','A2');
        elseif Choosein5==2
            Header4T2={'','StudentID','OldGPA','CompletedCHs'};
            Ask4T2toSave=input('Enter the name of the saved excel file:','s');
            xlswrite(Ask4T2toSave,Header4T2,'Section1');
            xlswrite(Ask4T2toSave,Table2,'Section1','B2');
        elseif Choosein5==3
            Header4T3={'','StudentID','CourseID','CW','Final'};
            Ask4T3toSave=input('Enter the name of the saved excel file:','s');
            xlswrite(Ask4T3toSave,Header4T3,'Section1');
            xlswrite(Ask4T3toSave,Table3,'Section1','B2');
        end
    elseif Choose==6
        fprintf('1)Display table1    2)Display table2    3)Display table3\n');
        Choosein6=input('Choose from the previous Submenu:');
        while Choosein6~=1 && Choosein6~=2 && Choosein6~=3
            Choosein6=input('Choose only from the previous Submenu:');
        end
        if Choosein6==1
            fprintf('CourseID   CreditHours   MaxGrade');
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
    elseif Choose==7
        Table3(:,3)=Table3(:,3)+Table3(:,4);
        for i=1:R3-1
            if Table3(i,3)>=90
                   Table3(i,3)='A';
            elseif Table3(i,3)>=80
                   Table3(i,3)='B';
            elseif Table3(i,3)>=70
                   Table3(i,3)='C';
            elseif Table3(i,3)>=60
                   Table3(i,3)='D';
            else
                   Table3(i,3)='F';
            end        
        end
        Table3=[Table3(:,1),Table3(:,2),Table3(:,3)];
        fprintf('1)Excel   2)Command Window\n');
        Choosein7=input('Would you like to display the table3 on excel or on the command window?:');
        if Choosein7==1
           Header={'StudentID','CourseID','Grade'};
           xlswrite('Table7',Header,'Section1');
           xlswrite('Table7',Table3,'Section1','A2')
        elseif Choosein7==2
            fprintf('StudentID CourseID Grade\n');
           for i=1:R3-1
                fprintf('%d      %d      %c\n',Table3(i,1),Table3(i,2),Table3(i,3));
            end
        end 
    elseif Choose==8
        G=1;
        X=1;
        for i=1:R2-1
            StudentID=Table2(i,1);
            k=1;
            n=1;
            for j=1:R3-1
                if Table3(j,1)==StudentID
                    CourseIDT3(k)=Table3(j,2);
                    CourseIndex(n)=j;
                    k=k+1;
                    n=n+1;
                end
            end
            S=1;
            for c=1:length(CourseIndex)
                z=CourseIndex(c);
                Degrees(S)=Table3(z,3)+Table3(z,4);
                S=S+1;
            end
            f=1;
            for T=1:length(CourseIDT3)
                for q=1:R-1
                    if Table1(q,1)==CourseIDT3(T)
                        Maxdegree(f)=Table1(q,3);
                        f=f+1;
                    end
                end
            end
            Degreesto100=(Degrees./Maxdegree)*100;
            a=1;
            for y=1:length(Degrees)
                if Degreesto100(y)>=94
                   Points(a)=4;
                elseif Degreesto100(y)>=90
                   Points(a)=3.7;
                elseif Degreesto100(y)>=87
                   Points(a)=3.3;
                elseif Degreesto100(y)>=83
                   Points(a)=3;
                elseif Degreesto100(y)>=80
                   Points(a)=2.7;
                elseif Degreesto100(y)>=77
                   Points(a)=2.3;
                elseif Degreesto100(y)>=73
                   Points(a)=2;
                elseif Degreesto100(y)>=70
                   Points(a)=1.7;
                elseif Degreesto100(y)>=67
                   Points(a)=1.3;
                elseif Degreesto100(y)>=60
                   Points(a)=1;
                else
                   Points(a)=0;
                end
                a=a+1;
            end
            p=1;
            for T=1:length(CourseIDT3)
                for q=1:R-1
                   if Table1(q,1)==CourseIDT3(T)
                      Credits(p)=Table1(q,2);
                      p=p+1;
                   end
                end
            end
         PointsbyCredits=Points.*Credits;
         TotalPointsbeforeC=Table2(i,2)*Table2(i,3);
         TotalPoints=TotalPointsbeforeC+sum(PointsbyCredits);
         X=X+1;
         GPA(G)=TotalPoints/(Table2(i,3)+sum(Credits));
         G=G+1;
        end
        disp('Table of the New Cumulative GPA');
        fprintf('StudentID      OldGPA      OldCHS     NewGPA\n');
        fprintf('1)Excel File    2)Command window');
        Choosein8=input('Would you like to display the GPA table in excel file or on the command window?');
        while Choosein8~=1 && Choosein8~=2
            Choosein8=input('Choose either from 1 or 2');
        end
        if Choosein8==1
             HeaderGPA={'StudentID','OldGPA','OldCHs','NewGPA'};
             xlswrite('Table8',HeaderGPA,'Section1')
             xlswrite('Table8',Table2,'Section1','A2');
             xlswrite('Table8',GPA','Section1','D2');    
        elseif Choosein8==2
               for i=1:R2-1
                   fprintf(' %d        %2.2f         %d        %2.2f\n',Table2(i,1),Table2(i,2),Table2(i,3),GPA(i)');
               end
        end
    elseif Choose==9
           n=1;
           for i=1:R-1
               c=0;
               for d=1:R3-1
                  if Table1(i,1)==Table3(d,2)
                     c=c+1;
                  end
               end
               NumberofSTperCourses(n)=c;
               n=n+1;
           end
           fprintf('1)Excel     2)Command window\n');
           Choosein9=input('Would you like to display the table of (Number of students per course) on excel or command window');
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
    Choose=input('Choose from the previous menu:');
end
