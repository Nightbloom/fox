SET DATE BRIT
SET CENT ON
SET SAFE OFF
SET EXACT ON
set dele on
set excl off
DO WHILE .T.
	flag=.T.
	flag1=.T.
	PUBLIC mshd_name
	PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
	PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record
	PRIVATE s_date,l_date,hdlist
	s_date={}
	l_date={}
	mcrdr=SPACE(2)
	m.c_name=SPACE(50)
	m.c_code=0
	mopbal=0
	m.cleg=0
	mshd_code=1
	sele a
	USE expense
	set order to TAG e_name
	set order to TAG e_code
	SELE B
	USE exp_acnt
	set order to TAG DATE
	set order to TAG e_code
	SET RELA TO e_code INTO A
	SET ORDER TO TAG DATE
	STORE 1 TO p_recs,p_output
	STORE 0 TO prnt_btn
	STORE RECNO() TO saverec
	m.solderror=ON('error')
	DO pdialog3
	IF flag=.F.
		CLOS ALL
		SET CONF OFF
		RETU
	ENDIF
	IF m.prnt_btn = 2
		flag1=.F.
	ENDIF
	IF flag1=.F.
		CLOS ALL
		SET CONF OFF
		RETU
	ENDIF
	m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')
	flname=space(8)
	flname=sys(3)
	sele a
	set order to tag e_code
	sele b
	set order to tag dte_code
	set rela to e_code into a
	GO TOP
	REPO FORM aclgsum &pr_out for date>=s_date and date<=l_date
	CLOSE ALL
ENDDO

PROCEDURE pdialog3
SET CONF ON
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 18.231,62.200 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Account Summary View & Print" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh
@0.0,18 SAY "Account Summary" ;
	FONT "MS Sans Serif", 12 ;
	STYLE "BTU" ;
	COLOR RGB(0,128,0,255,255,255)
@0,55.000 SAY "sc.bmp"BITMAP
m.cleg=3
@6.8,8 SAY "From";
	FONT "MS Sans Serif", 8 ;
	STYLE "BT"
l_date=date()
@6.8,31 SAY "To" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT"
@ 9.846,38.600 SAY "Output:"  ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT"
@ 9.846,6.800 SAY "Print:"  ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT"
@ 6.8,17 GET s_date PICT "@E" ;
	COLOR ,RGB(255,0,0,255,255,255)
@ 6.8,36 GET l_date PICT "@E" ;
	COLOR ,RGB(255,0,0,255,255,255)
@ 11.692,7.200 GET m.p_recs ;
	PICTURE "@*RVN \<Account Summary" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 11.692,39.000 GET m.p_output ;
	PICTURE "@*RVN \<Printer;Pre\<view" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 15.554,19.600 GET m.prnt_btn ;
	PICTURE "@*HT P\<rint;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B"
READ
IF READKEY()=12
	flag=.F.
	RELEASE WINDOW _qjn12zbvh
	CLOS ALL
	RETU
ENDIF
SET CONF OFF
RELEASE WINDOW _qjn12zbvh
RETURN
