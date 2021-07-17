function [Table2,R2]=Addrow2T2(Table2,R2)
row1T2=input('Add arow to table2:');
while length(row1T2)~=3
      row1T2=input('Add a row to table 2 with only 3 elements');
end
Table2(R2,:)=row1T2;
R2=R2+1;
end