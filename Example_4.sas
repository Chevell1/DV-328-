 ods powerpoint file="c:\temp\example4.pptx"
      options(transition="push" effect_option="from_left"
              backgroundimage="linear-gradient(90deg ,#c0c0c0, #FFFFFF)"); 

   title "Study of Heart Health";
   proc reg data=sashelp.heart;
   model cholesterol=height Weight diastolic systolic
         / selection=forward;   
   run;
   quit;
   ods powerpoint close;

