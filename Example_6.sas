
ods document name=test; 
proc print data=sashelp.shoes;
run;
ods document close;

filename f_pdf filesrvc parenturi="&SYS_JES_JOB_URI" name='Class.pdf' 
	                contenttype='application/pdf';

ods pdf file=f_pdf style=HTMLBlue;
proc document name=test;
  replay;
quit;

ods pdf close;

%let PDF_LINK=%bquote(<a href=""&_FILESRVC_F_PDF_URI/content"" target=""_Self""> PDF</a>);

filename f_htm filesrvc parenturi="&SYS_JES_JOB_URI" name='_webout.htm'; 
ods html5 file=f_htm text="<span>^{style systemtitle &PDF_LINK}</span>";

proc document name=test;
replay;
run;
quit;

ods html5 close;

