ods html5 path="c:\temp" file="examp1e1.html"                                                                                             
 headtext="<style> thead {position: sticky;top:0 }</style>"                                                                            
 metatext='name="viewport" content="width=device-width, initial-scale=1"';                                                             
                                                                                                                                        
proc odstext;                                                                                                                           
  h1 "Study of Blood Pressure Status" / style=systemtitle[just=c];                                                                      
run;                                                                                                                                    
                                                                                                                                        
proc report data=sashelp.heart(obs=100);                                                                                               
column Sex diastolic Systolic height weight BP_Status weight_status;                                                                  
   compute weight_status;                                                                                                                 
    if bp_status="High" and Weight_status="Overweight" then    
      do;                                                                         
          call define(_row_,"style","style={background=#f0f5f5}");                                                                         
          call define(_col_,"url","https://www.cdc.gov/ 
                   healthyweight/tools/index.html");                                                   
       end;                                                                                                                                
    endcomp;                                                                                                                  
run; 
ods html5 close; 
