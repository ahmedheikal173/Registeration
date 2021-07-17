function [Table1,R]=Addrow2T1(Table1,R)
row1T1=input('Add arow to table1:');
while length(row1T1)~=3
      row1T1=input('Add a row to table 1 with only 3 elements');
end
Table1(R,:)=row1T1;
R=R+1;
end