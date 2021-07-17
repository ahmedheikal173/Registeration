clc
clear
Table1=[];
Table2=[];
Table3=[];
R=1;
R2=1;
R3=1;
DisplayChoices
Choose=input('Choose from the previous main menu:');
while Choose~=10
    if Choose==1
        [Table1,R]=Addrow2T1(Table1,R);
    elseif Choose==2
        [Table2,R2]=Addrow2T2(Table2,R2);
    elseif Choose==3
        [Table3,R3]=Addrow2T3(Table3,R3);
    elseif Choose==4
        [Table1,Table2,Table3,R,R2,R3]=LoadTable(Table1,Table2,Table3,R,R2,R3);
    elseif Choose==5
        SaveTable(Table1,Table2,Table3);
    elseif Choose==6
        [Table1,Table2,Table3,R,R2,R3]=DisplayTables(Table1,Table2,Table3,R,R2,R3);
    elseif Choose==7
        GPATable(Table3,Table1,R,R3);
    elseif Choose==8
        NewCumulativeGPA(Table1,Table2,Table3,R,R2,R3);
    elseif Choose==9
        STperCourse(Table1,Table3,R,R3);
    elseif Choose~=1&&Choose~=2&&Choose~=3&&Choose~=4&&Choose~=5&&Choose~=6&&Choose~=7&&Choose~=8&&Choose~=9&&Choose~=10
        disp('You entered an invalid number');
    end
    Choose=input('Choose from the previous main menu:');
end