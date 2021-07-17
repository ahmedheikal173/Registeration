function SaveTable(Table1,Table2,Table3)
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
end