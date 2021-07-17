function [Table1,Table2,Table3,R,R2,R3]=LoadTable(Table1,Table2,Table3,R,R2,R3)
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
end