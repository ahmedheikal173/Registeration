function [Table3,R3]=Addrow2T3(Table3,R3)
row1T3=input('Add arow to table3:');
while length(row1T3)~=4
      row1T3=input('Add a row to table 3 with only 4 elements');
end
Table3(R3,:)=row1T3;
R3=R3+1;
end