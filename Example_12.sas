ods noresults;
ods excel file="c:\output\validate.xlsx";
proc print data=sashelp.shoes;
run;
ods excel close;

proc fcmp;                                                                                                                              
declare object py(python);                                                                                                              
submit into py;                                                                                                                         
def Validate(input,output):                                                                                                            
      "Output: MyKey"                                                                                                                   
      from openpyxl import load_workbook                                                                                                
      from openpyxl.worksheet.datavalidation import DataValidation                                                                      
      wb = load_workbook(input)                                                                                                         
      ws = wb.active                                                                                                                    
      dv = DataValidation(type="list",formula1='"Boot,Sandal,Slipper"')                                                                 
      dv.error ='Your entry is not in the list'                                                                                         
      dv.errorTitle = 'Invalid Entry' 
      ws.add_data_validation(dv)                                                                                                        
      dv.add('C2:C365')                                                                                                                 
      wb.save(output)                                                                                                                   
endsubmit;                                                                                                                              
rc = py.publish();                                                                                                                      
rc = py.call("Validate","c:\\output\\validate.xlsx","c:\\output\\validate_update.xlsx");                                                       
run;  

