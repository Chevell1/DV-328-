 
ods excel file="c:\output\data.xlsx" style=ocean;                                                                                       
   proc report data=sashelp.shoes;                                                                                                       
   run;                                                                                                                                  
ods excel close;

proc fcmp;
declare object py(python);
submit into py;
def DataBars(input,output):
	"Output: MyKey"
	from openpyxl import load_workbook
	from openpyxl.formatting.rule import DataBarRule
	wb = load_workbook(input)
	ws = wb.active
	data_bar_rule = DataBarRule(start_type="num",
                               start_value=29000,
                               end_type="num",
                               end_value="130000",
                               color="0000FF") 
	ws.conditional_formatting.add("F2:F365",data_bar_rule)
	wb.save(output)
endsubmit;                                                             
rc = py.publish();                                                   
rc = py.call("DataBars","c:\\output\\data.xlsx","c:\\output\\databars_update.xlsx"); 
run;
