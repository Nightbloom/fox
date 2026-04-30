set date brit
set cent on
set safe off
set exact on
set dele on
set excl off
clos all
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record,voucher
STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn,m.disc_Amt,m.tax_amt,m.tvalue,msno,m.r_output,m.c_code,m.cpay,m.p_rec
STORE RECNO() TO saverec
msno=1
store space(50) to m.c_name
voucher=space(20)
m.solderror=ON('error')
s_date={}
l_date={}
DO pdialog1
If m.prnt_btn = 2
   RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')	
flname=space(8)
flname=sys(3)
sele a
use item
copy to &flname
use 
use &flname excl
alter table &flname add colu sele_item C(1)
repl all sele_item with "     "
sele b
use stock
set order to tag sh_code
go top
flname1=space(8)
flname1=alltrim(str(val(flname)+1))
total on sh_code to &flname1 field receipt,issuse
use 
use &flname1 excl
repl all balance with receipt-issuse
dele all for balance=0
sele c
flname2=space(8)
flname2=alltrim(str(val(flname)+2))
use stshade
copy to &flname2
use 
use &flname2 excl
index on sh_code tag sh_code
repl all updt with 0,qty with 0
sele b
go top
do while not eof()
   sele c
   seek b->sh_code
   if found()
      repl updt with 1,qty with b->qty
    endif
    sele b
    skip
enddo        
sele a
index on b_code tag b_code
sele c
dele all for updt=0
alter table &flname2 add colu item C(50)
alter table &flname2 add colu brand C(50)
alter table &flname2 add colu pack_dt d(8)
set rela to b_code into a
repl all item with a->item,brand with a->brand
index on item+brand+q_code+shade+size tag sitbdsz
repl all pack_dt with it_dob for pack_dt={}
GO TOP
REPO FORM rbarlist &pr_out
clos all
retu

	proce pdialog1
	DEFINE WINDOW _qjn12z ;
		AT  0.000, 0.000  ;
		SIZE 17.231,68.800 ;
		FONT "MS Sans Serif", 8 ;
		TITLE "Barcode List" ;
		icon file icon5.ico;
		fill file back.bmp;
		color rgb(0,0,255,255,255,255) ;
		FLOAT NOCLOSE MINIMIZE SYSTEM
	MOVE WINDOW _qjn12z CENTER
	ACTIVATE WINDOW _qjn12z	
	@0,61.200 SAY "sc.bmp"BITMAP
	@1.546,20.000 SAY "Barcode List"  ;
		   FONT "MS Sans Serif", 12 ;
		   color rgb(0,128,0,255,255,255) ;
		   STYLE "BTU"
@ 6.846,38.300 SAY "Output:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@6.846,7.800 SAY "Print:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@ 8.692,7.200 GET m.p_rec ;
	PICTURE "@*RVN \<Detail";
	SIZE 1.308,18.500,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
	STYLE "BT"
@ 8.692,37.000 GET m.p_output ;
	PICTURE "@*RVN \<Printer;Pre\<view" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
	STYLE "BT"
@ 14.157,19.600 GET m.prnt_btn ;
	PICTURE "@*HT P\<rint;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ
*	ENDIF
DEACTIVATE WINDOW _qjn12z
retu

PROCE entry2
	m.brand=PROMPT()
	DEAC POPUP pbrand
	RETU

PROCE entry3
	m.product=PROMPT()
	DEAC POPUP pproduct
	RETU

proce entry4
        m.c_name=alltrim(prompt())
        m.c_code=c_code
        deac popup psup
        retu