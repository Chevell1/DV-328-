 title "Study of Heart Health and Weight "; 

ods excel file="c:\temp\example3.xlsx" options(embedded_titles="yes"
                     autofilter="1" 
                     sheet_name="Heart Health"
                     sheet_interval="none"
                     tab_color="red") style=analysis;

   data _null_;
     declare odsout obj();
     obj.image(file:"c:\output\heart.jpg");
     obj.table_start();
     obj.head_start();
     obj.row_start();
          obj.format_cell(data:"Subjects");  
          obj.format_cell(data:"AVG Weight");  
     obj.row_end();
     obj.head_end();
     obj.row_start();
          obj.format_cell(data:"=count(c:c)");
          obj.format_cell(data:"=average(c:c)");
     obj.row_end();
     obj.table_end();
   run;

   title "Study of Heart Health and Weight ";
   proc report data=sashelp.heart(obs=100);
   where weight_status="Overweight";
   column sex height weight weight_status chol_status BMI;
   define BMI / computed style(column)={tagattr="formula:=RC[-3]/RC[-4]/RC[-4]*703"};

   compute chol_status;
      if weight_status="Overweight" and chol_status="High" then call   
           define(_row_,"style","style=[background=pink]");
	  else if weight_status="Overweight" and chol_status="Borderline" then 
              call define(_row_,"style","style=[background=yellow]");
   endcomp;
   run;
   ods excel close;
