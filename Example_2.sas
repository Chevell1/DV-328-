
options nodate nonumber;
ods pdf file="c:\output\temp10.pdf" ACCESSIBLE startpage=no; 
options nocenter; 
data _null_;  
   declare odsout obj();
	obj.format_text(data:"JNJ-56021927 (apalutamide)");
      obj.format_text(data:"Clinical Study Report ARN-509-003",   
             style_attr:"just=r width=8.5in");
      obj.line();
      obj.format_text(data:"Aragon Pharmaceuticals, Inc*",
             style_attr:"just=c fontsize=14pt width=8.5in");
	obj.format_text(data:" ",row_span:3); 
      obj.format_text(data:"Clinical Study Report",
             style_attr:"just=c fontsize=10pt width=8.5in");
	obj.line();
	obj.format_text(data:"A Multicenter, Randomized, Double-Blind,
      Placebo-Controlled, Phase III Study",
             style_attr:"just=c fontsize=12pt width=8.5in");
       obj.format_text(data:" ");
       obj.format_text(data:"Selective Cholesterol Targeting with ARN   
          509",style_attr:"just=c fontsize=10pt width=8.5in");
       obj.line();
       obj.format_text(data:" ");
	 obj.format_text(data:"Protocol ARN-509-003; Phase 3",
           style_attr:"just=c fontsize=10pt width=8.5in");
run;

ods layout absolute width=8.5in height=11in; 
   ods region x=0in y=.3in;  
   proc report data=sashelp.heart(where=(sex="Male"));
   column sex chol_status BP_Status systolic cholesterol;
   define sex / group;
   define bp_status / group;
   define chol_status / group;
   define systolic / mean;
   define cholesterol / mean;   
   run;
 
  ods region x=3.5in y=.5.5in;   
  ods graphics / height=1.5in width=3in; 
  proc sgplot data=sashelp.heart;                                                                                                         
   vbar bp_status / group=sex response=systolic stat=mean;                                                                              
  run; 

  proc odstext;
      p "The researchers used a 3-sample randomization analysis of          
         participants who were registered." /style={fontsize=9pt};
      p "There were three groups in the analysis:" / style={fontsize=9pt  
         fontweight=bold};;
      list / style={liststyletype="disc" fontsize=9pt};
           item "130 people had high cholesterol (LDL-C)";
	     item "150 people had elevated systolic blood pressure (SBP)";
	     item "170 people had coronary heart disease";
     end; 
  run; 

  ods layout end;
  ods pdf close;
