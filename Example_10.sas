ods noresults;
ods excel file="c:\temp\filter_test.xlsx";
proc print data=sashelp.shoes;
run;
ods excel close;

proc fcmp;
declare object py(python);
submit into py;
def PyProduct(input,output):
    "Output: MyKey"
    from openpyxl import load_workbook
    wb = load_workbook(input)
    sheet=wb.active
    sheet.auto_filter.ref = 'A1:E365'
    sheet.auto_filter.add_filter_column(1, ['Africa','Asia','Canada'])
    sheet.auto_filter.add_sort_condition('D1:D365')
    wb.save(output)
endsubmit;                                     
rc = py.publish();                                                   
rc = py.call("PyProduct","c:\\temp\\filter_test.xlsx","c:\\temp\\filter_update.xlsx");  
un;
