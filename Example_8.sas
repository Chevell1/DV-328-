 
 ods excel file="c:\temp\passwords.xlsx";
 proc print data=sashelp.class;
 run;
 ods excel close;      
  
 proc fcmp;
 declare object py(python);
 submit into py;
 def AddPass():
    "Output: MyKey" 
    from openpyxl import load_workbook
    wb = load_workbook('c:\\temp\\passwords.xlsx') 
	ws=wb.active
	ws.protection.set_password('test')
    print(wb)
    wb.save('c:\\temp\\password_update.xlsx') 
endsubmit;
rc = py.publish();
rc = py.call("AddPass");
run;
