set date brit
set talk off
set cent on
set safe off
set exact on
clos all
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record,voucher
STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn,m.fee_code,msno,m.r_output,m.late_feee,m.qty,m.other_fee,m.cl_code,m.sc_code
STORE RECNO() TO saverec
msno=1
store space(50) to m.class_name,m.Section,m.title
store space(250) to m.smsmsg,m.smsmsg1
voucher=space(20)
m.solderror=ON('error')
s_date={}
l_date={}
m.title="Fee Receipt Summary"
DO pdialog2
If m.prnt_btn = 2
   RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')		
clos all
retu

proce pdialog2
DEFINE WINDOW _qjn12z ;
	AT  0.000, 0.000 ;
	SIZE 32.231,140.800;
	FONT "MS Sans Serif", 8;
	TITLE "Group wise send e-mail";
	color rgb(0,0,255,255,255,255);
	icon file icon5.ico;	
	fill file back.bmp;
	FLOAT NOCLOSE SYSTEM
	MOVE WINDOW _qjn12z CENTER
	ACTIVATE WINDOW _qjn12z	
for a1=1 to 1
clea	
bossflg=.t.
store 0 to m.ans,m.ans1,m.ans2	
m.prnt_btn=0	
@0,132.600 SAY "bsc.bmp"BITMAP
@0.846,45.000 SAY "Group wise send e-mail";
   FONT "MS Sans Serif", 12 ;
   color rgb(0,128,0,255,255,255) ;
   STYLE "BTU"   
	@30.200,0.334 CLEAR TO 32.923,140.334
	@30.200,0.334 TO 32.923,140.334 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(128,,,255,255,255)
	@30.200,0.334 FILL TO 32.923,140.334 ;
		COLOR RGB(,,,255,255,128)
	@30.200,1 SAY "msign2.bmp"BITMAP;
		FONT "MS Sans Serif", 8;
		STYLE "BT" ;
		COLOR RGB(,,255,128,128,0)
	@30.500,17 SAY "for return,Enter the email";
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		COLOR RGB(,,255,128,128,0)
	@30.500,8 SAY "<Esc>";
		FONT "MS Sans Serif", 8;
		STYLE "BT";
		COLOR RGB(255,0,0,128,128,0)	
	@3.5,2 SAY "Subject :" ;
    	 FONT "MS Sans Serif", 10 ;
		 STYLE "BT"
	@3.5,18 GET m.smsmsg PICT "@X" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "NT" ;
		COLOR ,RGB(255,0,0,255,255,255)	
	@5.5,2 SAY "Content :" ;
    	 FONT "MS Sans Serif", 10 ;
		 STYLE "BT"
	@5.5,18 GET m.smsmsg1 PICT "@X" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "NT" ;
		COLOR ,RGB(255,0,0,255,255,255)			
	read	 	
	if readkey()=12 or readkey()=268 or (m.smsmsg="    " and m.smsmsg1="   ")
    	 m.prnt_btn=2
	     DEACTIVATE WINDOW _qjn12z
	     retu
	endif 	
for a2=1 to 1	    	
@30.200,0.334 CLEAR TO 32.923,140.334
@30.200,0.334 TO 32.923,140.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@30.200,0.334 FILL TO 32.923,140.334 ;
	COLOR RGB(,,,255,255,128)
@30.200,1 SAY "msign2.bmp"BITMAP	;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@30.500,17 SAY "for return,Past the e-mail";
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@30.500,8 SAY "<Esc>";
	FONT "MS Sans Serif", 8;
	STYLE "BT";
	COLOR RGB(255,0,0,128,128,0)	
dele file email.txt	
modi comm email.txt
sele a
use email excl
zap
appe from email.txt deli with tab
go top
nrec=0
count to nrec for email#"   "
  @8.5,0 SAY "No. of email" ;
     FONT "MS Sans Serif", 10 ;
	 STYLE "BT"
  @8.5,30 clea to 9.5,70
  @8.5,30 GET nrec PICT "99999" ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	COLOR ,RGB(255,0,0,255,255,255)
  CLEAR GET
@21.200,0.334 CLEAR TO 32.923,140.334
@21.800,0.334 TO 21.800,140.334 ;
    PEN 1, 8 ;
    STYLE "1" COLOR RGB(0,0,0,0,0,0)
@22.000,1.000 SAY "The above entries are correct";
    SIZE 1.000,25.667;
    FONT "MS Sans Serif", 10;
    STYLE "BT";
    PICTURE "@J";
    COLOR RGB(0,0,0,0,0,0)
@22.000,45 GET m.ans FUNCTION "*H \<No;\<Yes ";
    DEFAULT " ";
    STYLE "BT";
    FONT "MS Sans Serif", 10 ;
    COLOR ,RGB(255,0,0,255,255,255)    
READ
if m.ans=1
   clea
   a1=0
   loop
endif
if nrec=0
   z1=0
   DO MESSAGE WITH z1,"There is no data for sending sms"," "
   DEACTIVATE WINDOW _qjn12z
   clos all
   retu
endif    
@21.200,0.334 CLEAR TO 32.923,140.334   
@21.800,0.334 TO 21.800,140.334 ;
    PEN 1, 8 ;
    STYLE "1" COLOR RGB(0,0,0,0,0,0)
@26.000,1.000 SAY "Are you sure send e-mail";
    SIZE 1.000,25.667;
    FONT "MS Sans Serif", 10;
    STYLE "BT";
    PICTURE "@J";
    COLOR RGB(0,0,0,0,0,0)
@26.000,45 GET m.ans1 FUNCTION "*H \<No;\<Yes ";
    DEFAULT " ";
    STYLE "BT";
    FONT "MS Sans Serif", 10 ;
    COLOR ,RGB(255,0,0,255,255,255)
read
if m.ans1=2 
sele j
use stp excl
m.emailfrom=space(50)
m.emailid=space(50)
m.emailpswd=space(50)
go top
m.emailfrom=alltrim(email_from)
m.emailid=alltrim(email_id)
m.emailpswd=alltrim(email_pswd)
use
use sendmail
dele all
sele a
go top
do while not eof()
   sele j
   appe blank
   repl email_from with m.emailfrom,email_id with m.emailid,email_pswd with m.emailpswd,email_to with alltrim(a->email),emailsbj with m.smsmsg,emailmsg with m.smsmsg1
   sele a
   skip
enddo
sele j	
copy to sendmail.xls type xl5
!sendmail1.exe
dele file sendmail.xls
dele file c:\emaildoc\*.*
endif   
endfor
endfor
DEACTIVATE WINDOW _qjn12z
retu

PROCE entry4
m.group_name=ALLTRIM(PROMPT())
m.gp_code=gp_code
DEAC POPUP psup
RETU

PROCE entry3
m.section=ALLTRIM(PROMPT())
m.sc_code=sc_code
DEAC POPUP psec
RETU

proc entry1
m.sms_group=sms_group
m.sms_gp_cd=sms_gp_cd
deac popup pgroup
retu

proc entry2
m.smsmsg=sms_detail
deac popup pmessage
retu

proc entry5
m.emailfrom=alltrim(email_from)
m.emailid=alltrim(email_id)
m.emailpswd=alltrim(email_pswd)
deac popup pemail
retu
