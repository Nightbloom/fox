clos all
do rmlcash
do rmlsale
do odmail
do expmail

proc rmlsale
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record
STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn

sele a
use supplier
set order to tag s_name
set order to tag s_code
sele b
use item
set order to tag item 
set order to tag i_code
set order to tag b_code
set order to tag pd_code
sele c
use sale
sele d
use dealer
DO pdialog1
If m.prnt_btn = 2
   RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')

sele c
go top
flname=space(8)
flname=sys(3)	
copy to &flname with cdx
use
use &flname
repl all sl_amt with sl_amt-(sl_amt*t_per/(100+t_per)) for t_per#0
repl all ex_amt with ex_amt-(ex_amt*t_per/(100+t_per)) for t_per#0	
saledet=alltrim(str(val(flname)+1))
set order to tag sib_code
total on str(s_code)+str(i_code)+str(b_code) to &saledet field sl_qty,sl_amt,ex_amt for inv_dt=date() and cinv#2 and inv_no#0
sele a
set order to tag s_code
sele b
set order to tag b_code	
sele c
use &saledet
set rela to b_code into b,s_code into a
go top
*m.p_output=1
*m.pr_out=IIF(m.p_output=1,'TO PRINT NOCONSOLE','PREVIEW')

STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn
STORE RECNO() TO saverec
m.solderror=ON('error')
m.s_code=0
REPO FORM rslmail &pr_out
retu


proce pdialog1
DEFINE WINDOW _qjn12z;
	AT  0.000, 0.000;
	SIZE 24.231,60.800;
	fill file back.bmp;
	icon file icon5.ico;
	FONT "MS Sans Serif", 8;
	TITLE "Sale Profit Status";
	color rgb(0,0,255,255,255,255);
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12z CENTER
ACTIVATE WINDOW _qjn12z	
@0,53.200 SAY "sc.bmp"BITMAP
@ 0.386,15.000 SAY "Sale Profit Status" ;
	   FONT "MS Sans Serif", 12 ;
	   color rgb(0,128,0,255,255,255) ;
	   STYLE "BTIU"   
@ 22.600,0.334 CLEAR TO 24.300,62.334   
m.cpay=0
	m.cpay=1
	 *@9.000,2.000 GET m.cpay ;
		PICTURE "@*Rh \<Retail;\<Institutional;\<Stock Tr.;\<All";
		SIZE 1.308,5.000,0.008 ;
   		DEFAULT 1 ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
		STYLE "BT"
 
@13.846,35.600 SAY "Output:"  ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT"
@ 13.846,4.800 SAY "Print:"  ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT"
  @ 15.692,4.200 GET m.p_recs ;
	PICTURE "@*RVN \<Invoice " ;
	SIZE 1.308,18.500,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT"
@15.692,37.000 GET m.p_output ;
	PICTURE "@*RVN \<Printer;Pre\<view" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
	STYLE "BT"
@21.157,19.600 GET m.prnt_btn ;
	PICTURE "@*HT P\<rint;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ
*	ENDIF
DEACTIVATE WINDOW _qjn12z
retu


proc rmlcash
CLOS ALL
SET DATE BRIT
SET CENT ON
set dele on
set excl off
SET SAFE OFF
SET EXACT ON
SET TALK OFF
flag=.T.
flag1=.T.
PUBLIC mshd_name
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record
STORE 1 TO p_recs,p_output
PRIVATE s_date,l_date,hdlist
s_date={}
l_date={}
STORE 0 TO m.c_amt,s_amt,e_amt,mbal,m.cleg,m.cashhd,m.cashhd1
m.crdr=SPACE(2)

SELE A
USE sale_sum


sele b
use trslsum

SELE c
USE trcsacnt

sele d
use cst_acnt

flname1=space(8)
flname1=sys(3)

sele e
use exp_acnt
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
	CLOS ALL
	RETU
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')
*m.pr_out=IIF(m.p_output=1,'TO PRINT NOCONSOLE','PREVIEW')
s_date=date()
l_date=date()
sele a
flname=space(8)
flname=sys(3)
copy stru to &flname
use
use &flname
appe from sale_sum for inv_dt>=s_date and inv_dt<=l_date and cinv#2 and retail#3

store 0 to m.tsale,m.tccsale,m.tcrsale,m.tchsale,m.cashhd,m.rcashhd,m.rcashout,m.cancelamt,m.canceltrl
store 0 to m.rtsale,m.rtccsale,m.rtcrsale,m.rtchsale,m.expamt,m.disc_amt,m.tbkout1,m.tbkout2,m.tbkout3
store 0 to m.tbkout4,m.tbkout5,m.tbkout6,m.tupiamt,m.rtupiamt,m.oupiamt,m.orupiamt

sele a
sum gtotal to m.tsale for inv_dt>=s_date and inv_dt<=l_date and cinv#2
sum ccamt+ccamt1 to m.tccsale for inv_dt>=s_date and inv_dt<=l_date and cinv#2
sum chamt+chamt1 to m.tchsale for inv_dt>=s_date and inv_dt<=l_date and cinv#2
sum disc_amt to m.disc_amt for inv_dt>=s_date and inv_dt<=l_date and cinv#2
sum upi_amt+upi_amt1 to m.tupiamt for inv_dt>=s_date and inv_dt<=l_date and cinv#2

sele b
sum gtotal to m.rtsale for inv_dt>=s_date and inv_dt<=l_date and cinv#2
sum ccamt+ccamt1 to m.rtccsale for inv_dt>=s_date and inv_dt<=l_date and cinv#2
sum chamt+chamt1 to m.rtchsale for inv_dt>=s_date and inv_dt<=l_date and cinv#2
sum upi_amt+upi_amt1 to m.rtupiamt for inv_dt>=s_date and inv_dt<=l_date and cinv#2

sele d
sum amount to m.tbkamt1 for date>=s_date and date<=l_date and mpy=3 and date=inv_dt and retail#3 and bk_code=1 or bk_code1=1 
sum amount to m.tbkamt2 for date>=s_date and date<=l_date and mpy=3 and date=inv_dt and retail#3 and bk_code=2 or bk_code1=2 
sum amount to m.tbkamt5 for date>=s_date and date<=l_date and mpy=3 and date=inv_dt and retail#3 and bk_code=3 or bk_code1=3 

sele c
sum amount to m.tbkamt3 for date>=s_date and date<=l_date and mpy=3 and date=inv_dt and bk_code=1 or bk_code1=1 
sum amount to m.tbkamt4 for date>=s_date and date<=l_date and mpy=3 and date=inv_dt and bk_code=2 or bk_code1=2 
sum amount to m.tbkamt6 for date>=s_date and date<=l_date and mpy=3 and date=inv_dt and bk_code=3 or bk_code1=3 

sele d
sum amount to m.tbkout1 for date>=s_date and date<=l_date and mpy=3 and bk_code=1  and date#inv_dt and retail#3
sum amount to m.tbkout2 for date>=s_date and date<=l_date and mpy=3 and bk_code=2  and date#inv_dt and retail#3
sum amount to m.tbkout3 for date>=s_date and date<=l_date and mpy=3 and bk_code=3  and date#inv_dt and retail#3

sele c
sum amount to m.tbkout5 for date>=s_date and date<=l_date and mpy=3 and bk_code=1  and date#inv_dt 
sum amount to m.tbkout6 for date>=s_date and date<=l_date and mpy=3 and bk_code=2  and date#inv_dt 
sum amount to m.tbkout7 for date>=s_date and date<=l_date and mpy=3 and bk_code=3  and date#inv_dt 


sele d
sum amount to m.cashhd for date>=s_date and date<=l_date and mpy=1 and ch_amt=0 and inv_dt=date and retail#3
sum ch_amt to m.cashhd1 for date>=s_date and date<=l_date and mpy=1 and ch_amt#0 and inv_dt=date and retail#3

sum amount to m.cashout for date>=s_date and date<=l_date and mpy=1 and ch_amt=0 and inv_dt#date and retail#3
sum ch_amt to m.cashout1 for date>=s_date and date<=l_date and mpy=1 and ch_amt#0 and inv_dt#date and retail#3

sum amount to m.oupiamt for date>=s_date and date<=l_date and mpy=2 and inv_dt#date and retail#3

m.cashhd=m.cashhd+m.cashhd1
m.cashout=m.cashout+m.cashout1
*m.tupiamt=m.tupiamt+m.oupiamt

*m.tbkout1=m.tbkout1+m.tbkout5
*m.tbkout2=m.tbkout2+m.tbkout6
*m.tbkout3=m.tbkout3+m.tbkout7

sele c
sum amount to m.rcashhd for date>=s_date and date<=l_date and mpy=1 and inv_dt=date
sum amount to m.rcashout for date>=s_date and date<=l_date and mpy=1 and inv_dt#date
sum amount to m.orupiamt for date>=s_date and date<=l_date and mpy=2 and inv_dt#date and retail#3

*m.rtupiamt=m.rtupiamt+m.orupiamt

sele e
sum amount to m.expamt for date>=s_date and date<=l_date
sele a
set order to
set filter to
use sale_sum
sum gtotal to m.cancelamt for inv_dt>=s_date and inv_dt<=l_date and cinv=2
sele b
set order to
set filter to
use trslsum
sum tamt to m.canceltrl for inv_dt>=s_date and inv_dt<=l_date and cinv=2

REPO FORM rchmail &pr_out 	   	  
clos all
retu

PROCEDURE pdialog3
SET CONF ON
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 21.231,60.800 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Cash in Hand" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh
s_date=date()
l_date=date()
@0,53.400 SAY "sc.bmp"BITMAP
@0.2,15 SAY "Cash in hand on" ;
	FONT "MS Sans Serif", 12 ;
	STYLE "BTUI" ;
	COLOR RGB(0,128,0,255,255,255)
@ 8.846,35.600 SAY "Output:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@ 8.846,4.800 SAY "Print:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@4.8,8 SAY "From";
   FONT "MS Sans Serif", 10 ;
   STYLE "BT" 
@4.8,37 say "To" ;
   FONT "MS Sans Serif", 10 ;
   STYLE "BT" 
@4.8,17 GET s_date pict "@E" ;
	COLOR ,RGB(255,0,0,255,255,255) ;
   FONT "MS Sans Serif", 10 

@4.8,43 GET l_date pict "@E" ;
    COLOR ,RGB(255,0,0,255,255,255) ;
   FONT "MS Sans Serif", 8 
@ 11.692,4.200 GET m.p_recs ;
	PICTURE "@*RVN \<Cash in hand" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 11.692,37.000 GET m.p_output ;
	PICTURE "@*RVN \<Printer;Pre\<view" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 18.154,16.600 GET m.prnt_btn ;
	PICTURE "@*HT P\<rint;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ  
*flag1=.f.
SET CONF OFF
RELEASE WINDOW _qjn12zbvh
RETURN

proc expmail
clos all
SET DATE BRIT
SET CENT ON
SET SAFE OFF
SET EXACT ON
set dele on
set excl off
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
	DO pdialog14
If m.prnt_btn = 2
   RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')

	s_date=date()
	l_date=date()
	flname=space(8)
	flname=sys(3)
	sele a
	set order to tag e_code
	sele b
	set order to tag dte_code
	set rela to e_code into a
	GO TOP
	REPO FORM rexpmail &pr_out for date>=s_date and date<=l_date
	CLOSE ALL

PROCEDURE pdialog14
SET CONF ON
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 21.231,60.800 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Account Summary" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh
s_date=date()
l_date=date()
@0,53.400 SAY "sc.bmp"BITMAP
@0.2,15 SAY "Account Summary" ;
	FONT "MS Sans Serif", 12 ;
	STYLE "BTUI" ;
	COLOR RGB(0,128,0,255,255,255)
@ 8.846,35.600 SAY "Output:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@ 8.846,4.800 SAY "Print:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@ 11.692,4.200 GET m.p_recs ;
	PICTURE "@*RVN \<Account Summary" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 11.692,37.000 GET m.p_output ;
	PICTURE "@*RVN \<Printer;Pre\<view" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 18.154,16.600 GET m.prnt_btn ;
	PICTURE "@*HT P\<rint;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ  
*flag1=.f.
SET CONF OFF
RELEASE WINDOW _qjn12zbvh
RETURN

proc upemail1
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 8.231,60.800 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Cash in Hand" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh
avf=.f.
do while .t.
	avf=file("d:\Emaildoc\visual foxpro.pdf")
	inval1=inkey()
	IF inval1 = 13
	   exit
	endif
	if avf=.t.
	   exit
	endi   
enddo
m.ans=0
@ 1.154,16.600 GET m.ans ;
	PICTURE "@*HT \<Email" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ  
if readkey()=12 
DEACTIVATE WINDOW _qjn12zbvh
retu
endif


avf=file("d:\Emaildoc\visual foxpro.pdf")
if avf=.t.
	copy file d:\emaildoc\*.pdf to d:\emaildoc\sale.pdf
	dele file d:\emaildoc\v*.pdf
endif
DEACTIVATE WINDOW _qjn12zbvh
retu


proc upemail2
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 8.231,60.800 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Sale Profit" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh
avf=.f.
do while .t.
	avf=file("d:\Emaildoc\visual foxpro.pdf")
	inval1=inkey()
	IF inval1 = 13
	   exit
	endif
	if avf=.t.
	   exit
	endi   
enddo
m.ans=0
@ 1.154,16.600 GET m.ans ;
	PICTURE "@*HT \<Email" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ  
if readkey()=12 
DEACTIVATE WINDOW _qjn12zbvh
retu
endif
avf=file("d:\Emaildoc\visual foxpro.pdf")
if avf=.t.
	copy file d:\emaildoc\v*.pdf to d:\emaildoc\profit.pdf
	dele file d:\emaildoc\v*.pdf
endif
DEACTIVATE WINDOW _qjn12zbvh
retu


proc upemil3
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 8.231,60.800 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Order Detail" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh
avf=.f.
do while .t.
	avf=file("d:\Emaildoc\visual foxpro.pdf")
	inval1=inkey()
	IF inval1 = 13
	   exit
	endif
	if avf=.t.
	   exit
	endi   
enddo
m.ans=0
@ 1.154,16.600 GET m.ans ;
	PICTURE "@*HT \<Email" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ  
if readkey()=12 
DEACTIVATE WINDOW _qjn12zbvh
retu
endif
avf=file("d:\Emaildoc\visual foxpro.pdf")
if avf=.t.
	copy file d:\emaildoc\v*.pdf to d:\emaildoc\order.pdf
	dele file d:\emaildoc\v*.pdf
endif
DEACTIVATE WINDOW _qjn12zbvh
retu


proc upemail
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 8.231,60.800 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Expense Detail" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh
avf=.f.
do while .t.
	avf=file("d:\Emaildoc\visual foxpro.pdf")
	inval1=inkey()
	IF inval1 = 13
	   exit
	endif
	if avf=.t.
	   exit
	endi   
enddo
m.ans=0
@ 1.154,16.600 GET m.ans ;
	PICTURE "@*HT \<Email" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ  
if readkey()=12 
DEACTIVATE WINDOW _qjn12zbvh
retu
endif

DEACTIVATE WINDOW _qjn12zbvh

***********************************************************************************

 		sele j
		use stp
		m.e_mail=space(50)
		m.cc_mail=space(50)
		m.emailfrom=space(50)
		m.emailid=space(50)
		m.emailpswd=space(50)
		go top
		m.emailfrom=alltrim(email_from)
		m.emailid=alltrim(email_id)
		m.emailpswd=alltrim(email_pswd)
		m.e_mail="shalenderbhargava76@gmail.com"
*		m.e_mail="ajay.kalra5@gmail.com"
		m.cc_mail="shagunbhargava07@gmail.com"		
		M.emailsbj="Ganpati Cash & Expense Report"
		M.emailmsg="."  
		use
		use sendsms
		dele all
		appe blank
		repl email_from with m.emailfrom,email_id with m.emailid,email_pswd with m.emailpswd,email_to with m.e_mail,email_cc with m.cc_mail
		repl emailsbj with m.emailsbj,emailmsg with m.emailmsg
		copy to sendmail.xls type xl5
		avf=file("d:\Emaildoc\visual foxpro.pdf")

	if avf=.t.
		
			copy file d:\emaildoc\v*.pdf to d:\emaildoc\expense.pdf
		
		
			dele file d:\emaildoc\v*.pdf
		
		
		
		endif
		a=file("d:\Emaildoc\sale.pdf")
		if a=.t.
		
	
		
   	*		!sendmail.exe
		   	DECLARE INTEGER ShellExecute IN SHELL32.DLL as ShellExecute ;
			INTEGER nWinHandle,STRING cOperation,STRING cFileName,;
			STRING cParameters,STRING cDirectory,INTEGER nShowWindow

			SendEx = 'sendmail.exe'

 			ShellExecute(0,"Open",SendEx,"","",1)

		else	 
   			ans5=0
			DO MESSAGE WITH ans5,"Can't send the email","  ","CHOICE WINDOW",18
		endif   


******************************************************************************************




proc odmail
clos all
SET DATE BRIT
SET CENT ON
SET SAFE OFF
SET EXACT ON
set dele on
set excl off
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
	USE rditem
	set order to TAG i_code
	SELE B
	USE order
	STORE 1 TO p_recs,p_output
	STORE 0 TO prnt_btn
	STORE RECNO() TO saverec
	m.solderror=ON('error')
	DO pdialog12
If m.prnt_btn = 2
   RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')

	s_date=date()
	l_date=date()
	flname=space(8)
	flname=sys(3)
	sele a
	set order to tag i_code
	sele b
	set order to tag i_code
	total on i_code to &flname field qty,amount for order_dt>=s_date and order_dt<=l_date and od_type=1
	use
	use &flname excl
	alter table &flname add i_name c(50)	
	set rela to i_code into a
	repl all i_name with a->i_Name
	index on i_name tag i_name
	GO TOP
		
	REPO FORM rodmail &pr_out 
	CLOSE ALL

PROCEDURE pdialog12
SET CONF ON
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 21.231,60.800 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Order Detial" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh
s_date=date()
l_date=date()
@0,53.400 SAY "sc.bmp"BITMAP
@0.2,15 SAY "Order Detial" ;
	FONT "MS Sans Serif", 12 ;
	STYLE "BTUI" ;
	COLOR RGB(0,128,0,255,255,255)
@ 8.846,35.600 SAY "Output:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@ 8.846,4.800 SAY "Print:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@ 11.692,4.200 GET m.p_recs ;
	PICTURE "@*RVN Order \<Detail" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 11.692,37.000 GET m.p_output ;
	PICTURE "@*RVN \<Printer;Pre\<view" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 18.154,16.600 GET m.prnt_btn ;
	PICTURE "@*HT P\<rint;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ  
*flag1=.f.
SET CONF OFF
RELEASE WINDOW _qjn12zbvh
RETURN
