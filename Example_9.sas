 ods listing gpath="c:\temp";
 proc sgplot data=sashelp.cars;
 title "Price by Car Type";
 hbox msrp / category=type;
run;

 ods excel file="c:\temp\images.xlsx" options(start_at="A4");
 proc print data=sashelp.heart(obs=100);
 var Sex Height	Weight Diastolic Systolic Smoking;
 run;
 ods excel close;      
  
 proc fcmp;
 declare object py(python);
 submit into py;
 def AddImg():
    "Output: MyKey" 
    from openpyxl import load_workbook
	from openpyxl.drawing.image import Image
    wb = load_workbook('c:\\temp\\images.xlsx') 
    ws=wb.active
    img = Image('c:\\output\\sas.png')
    ws.add_image(img,"b1")
	img1 = Image('c:\\temp\\SGPlot.png')
    ws.add_image(img1,"e4")
    wb.save('c:\\temp\\images_update.xlsx')
endsubmit;
rc = py.publish();
rc = py.call("AddImg");
run;
