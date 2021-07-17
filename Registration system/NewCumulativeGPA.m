function NewCumulativeGPA(Table1,Table2,Table3,R,R2,R3)
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
        if Degreesto100(y)>=93
           Points(a)=4;
        elseif Degreesto100(y)>=89
           Points(a)=3.7;
        elseif Degreesto100(y)>=84
           Points(a)=3.3;
        elseif Degreesto100(y)>=80
           Points(a)=3;
        elseif Degreesto100(y)>=76
           Points(a)=2.7;
        elseif Degreesto100(y)>=73
           Points(a)=2.3;
        elseif Degreesto100(y)>=70
           Points(a)=2;
        elseif Degreesto100(y)>=67
           Points(a)=1.7;
        elseif Degreesto100(y)>=64
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
fprintf('1)Excel File    2)Command window\n');
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
   disp('Table of the New Cumulative GPA');
   fprintf('StudentID      OldGPA      OldCHS     NewGPA\n');
   for i=1:R2-1
       fprintf(' %d        %2.2f         %d        %2.2f\n',Table2(i,1),Table2(i,2),Table2(i,3),GPA(i)');
   end
end
end