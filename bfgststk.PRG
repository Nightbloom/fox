SET DATE BRIT

SET CENT ON
SET SAFE OFF
SET EXACT ON
set dele on
set excl off
SET DELE ON
CLOS ALL
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record,voucher
STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn,m.b_code,m.sh_code,m.pd_code,msno,m.r_output,m.s_code,m.i_code
STORE 0 TO m.qty1,m.qty,m.value,m.value1,m.pi_code,m.ps_code,m.p_rec,m.ans,m.ans1,m.ans3
STORE RECNO() TO saverec
msno=1
STORE SPACE(50) TO m.s_name,m.brand,m.item
STORE SPACE(20) TO m.size,m.shade
sivalue=space(8)
voucher=SPACE(20)
s_date={}
m.solderror=ON('error')
SELE A
USE supplier
SELE B
USE item
SELE C
USE stshade
DO pdialog
IF m.prnt_btn = 2
	RETURN
ENDIF
DO pdialog1
IF m.prnt_btn = 2
	RETURN
ENDIF
sele d
use lystopen excl
index on sh_code tag sh_code
flname=space(8)
flname=sys(3)
total on sh_code to &flname field qty
use
use &flname excl
sele e
use lysale excl
index on sh_code tag sh_code
flname1=space(8)
flname1=alltrim(str(val(flname)+1))
total on sh_code to &flname1 field sl_qty for cinv#2 and inv_dt>{30/06/2017}
use
use &flname1
go top
do while not eof()
   sele d
   loca for sh_code=e->sh_code
   if found()
      repl sl_qty with e->sl_qty
   endif
   sele e
   skip
enddo
sele d
index on sh_code tag sh_code
repl all qty with sl_qty  for sl_qty>qty
repl all qty with qty-sl_qty
flname2=space(8)
flname2=alltrim(str(val(flname)+2))
sele c
copy to &flname2
use
use &flname2 excl
alter table &flname2 add colu gst_per N(5,2)
index on sh_code tag sh_code
repl all qty with 0
set rela to sh_code into d,pd_code into b
repl all qty with d->qty,gst_per with b->t_per                      
m.title="   "
title="Befor GST Inventory Value"        
m.title1="   "            
DO CASE
CASE m.p_recs=1
	SELE A
	set order to TAG s_code
	SELE B
	set order to TAG b_code
	SELE C
	SET ORDER TO
	SET FILTER TO
	SET FILTER TO qty#0
	INDEX ON STR(s_code)+STR(i_code)+STR(b_code)+Q_CODE+ALLTRIM(shade)+ALLTRIM(SIZE) TAG sibsize
	SET RELA TO s_code INTO A,b_code INTO B
CASE m.p_recs=2
	SELE A
	set order to TAG s_code
	SELE B
	set order to TAG b_code
	SELE C
	SET ORDER TO
	SET FILTER TO
	SET FILTER TO s_code=m.s_code AND qty#0
	INDEX ON STR(s_code)+STR(i_code)+STR(b_code)+Q_CODE+ALLTRIM(shade)+ALLTRIM(SIZE) TAG sibsize
	SET RELA TO s_code INTO A,b_code INTO B
CASE m.p_recs=3
	SELE A
	set order to TAG s_code
	SELE B
	set order to TAG b_code
	SELE C
	SET ORDER TO
	SET FILTER TO
	SET FILTER TO s_code=m.s_code AND i_code=m.i_code AND qty#0
	GO TOP
	INDEX ON STR(s_code)+STR(i_code)+STR(b_code)+Q_CODE+ALLTRIM(shade)+ALLTRIM(SIZE) TAG sibsize
	SET RELA TO s_code INTO A,b_code INTO B
CASE m.p_recs=4
	SELE A
	set order to TAG s_code
	SELE B
	set order to TAG b_code
	SELE C
	SET ORDER TO
	SET FILTER TO
	SET FILTER TO s_code=m.s_code AND i_code=m.i_code AND b_code=m.b_code AND qty#0
	GO TOP
	INDEX ON STR(s_code)+STR(i_code)+STR(b_code)+Q_CODE+ALLTRIM(shade)+ALLTRIM(SIZE) TAG sibsize
	SET RELA TO s_code INTO A,b_code INTO B
CASE m.p_recs=5
	SELE A
	set order to TAG s_code
	SELE B
	set order to TAG b_code
	SELE C
	SET ORDER TO
	SET FILTER TO
	SET FILTER TO s_code=m.s_code AND i_code=m.i_code AND b_code=m.b_code AND shade=ALLTRIM(m.shade) AND qty#0
	GO TOP
	INDEX ON STR(s_code)+STR(i_code)+STR(b_code)+Q_CODE+ALLTRIM(shade)+ALLTRIM(SIZE) TAG sibsize
	SET RELA TO s_code INTO A,b_code INTO B
CASE m.p_recs=6
	SELE A
	set order to TAG s_code
	SELE B
	set order to TAG b_code
	SELE C
	SET ORDER TO
	SET FILTER TO
	SET FILTER TO s_code=m.s_code AND i_code=m.i_code AND b_code=m.b_code AND shade=ALLTRIM(m.shade) AND ALLTRIM(SIZE)=ALLTRIM(m.size) AND qty#0
	GO TOP
	INDEX ON STR(s_code)+STR(i_code)+STR(b_code)+Q_CODE+ALLTRIM(shade)+ALLTRIM(SIZE) TAG sibsize
	SET RELA TO s_code INTO A,b_code INTO B
ENDCASE
GO TOP
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')
	if m.ans=1
	   REPO FORM stivalue &pr_out FOR qty#0
    else    		 
		SELE A
		set order to TAG s_code
		SELE B
		set order to TAG b_code    
		sele c
		index on str(s_code)+str(i_code)+str(b_code) tag sibcd
		repl all mrp_value with qty*ex_rate
		flname=space(8)
		flname=sys(3)
		total on str(s_code)+str(i_code)+str(b_code) to &flname field qty,mrp_value
		use 
		use &flname
		set rela to s_code into a,b_code into b
		REPO FORM stvalsm &pr_out 
	endif	
CLOS ALL
RETU

PROCEDURE pdialog
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 19.231,55.800 ;
	FONT "MS Sans Serif", 8 ;
	TITLE "Befor GST Stock" ;
	fill file back.bmp;
	icon file icon5.ico;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh NOSHOW
m.r_output=1
@0,47.200 SAY "sc.bmp"BITMAP
@ 0.846,10.000 SAY "Befor GST Stock"  ;
	FONT "MS Sans Serif", 12 ;
	COLOR RGB(0,128,0,255,255,255) ;
	STYLE "BTU"
@ 3.692,9.000 GET m.p_recs ;
	PICTURE "@*RVN \<All Items of All Company ;All Items of selected \<Company;Selected \<Item of Company; Selected \<Brand of Item";
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R ;
	STYLE "BT"
@ 16.154,13.600 GET m.prnt_btn ;
	PICTURE "@*HT \<OK;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
ACTIVATE WINDOW _qjn12zbvh
READ CYCLE MODAL
RELEASE WINDOW _qjn12zbvh
RETURN

PROCE pdialog1
DEFINE WINDOW _qjn12z ;
	AT  0.000, 0.000  ;
	SIZE 30.231,60.800 ;
	fill file back.bmp;
	icon file icon5.ico;
	FONT "MS Sans Serif", 8 ;
	TITLE "Befor GST Stock" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12z CENTER
ACTIVATE WINDOW _qjn12z
@0,53.200 SAY "sc.bmp"BITMAP
@ 0.386,15.000 SAY "Befor GST Stock"  ;
	FONT "MS Sans Serif", 12 ;
	COLOR RGB(0,128,0,255,255,255) ;
	STYLE "BTU"
s_date=date()	
@2.8,15 SAY "Date";
	FONT "MS Sans Serif", 10;
	STYLE "BT"
@ 2.8,24 GET s_date PICT "@E" ;
	COLOR ,RGB(255,0,0,255,255,255) ;
	FONT "MS Sans Serif", 10
READ
IF m.p_recs=1
	@ 5.846,18.000 SAY "All items"  ;
		FONT "MS Sans Serif", 12 ;
		COLOR RGB(0,0,128,255,255,255) ;
		STYLE "BT"
ENDIF
IF m.p_recs#1
	SELE A
	SET ORDER TO TAG s_name
	DEFINE POPUP psup FROM 4.5,18.800 TO 20,60 PROMPT FIELD ALLTRIM(s_name) SCROLL MARGIN MARK CHR(16)
	ON SELE POPUP psup DO entry1
	@4.5,1 SAY "Company  :" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	ACTI POPUP psup
	@4.5,18 GET m.s_name PICT "@!" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "NT" ;
		SIZE 1,40 ;
		COLOR ,RGB(255,0,0,255,255,255)
	CLEAR GET
	IF m.s_name='   '
		m.prnt_btn=2
		DEACTIVATE WINDOW _qjn12z
		RETU
	ENDIF
	IF m.p_recs#2
		SELE B
		SET FILTER TO s_code=m.s_code
		GO TOP
		SET ORDER TO TAG item 
		DEFINE POPUP pitem FROM 6.5,18.800 TO 15,60 PROMPT FIELD ALLTRIM(item) SCROLL MARGIN MARK CHR(16)
		ON SELE POPUP pitem DO entry2
		@6.5,7 SAY "Item :" ;
			FONT "MS Sans Serif", 10 ;
			STYLE "BT"
		ACTI POPUP pitem
		@6.5,18 GET m.item PICT "@s50!" ;
			FONT "MS Sans Serif", 10 ;
			STYLE "N" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEAR GET
		IF m.item='   '
			m.prnt_btn=2
			DEACTIVATE WINDOW _qjn12z
			RETU
		ENDIF
		IF m.p_recs#3
			SELE B
			SET FILTER TO
			SET ORDER TO
			SET FILTER TO s_code=m.s_code AND i_code=m.i_code
			GO TOP
			SET ORDER TO TAG brand 
			@8.5,5 SAY "Brand :" ;
				FONT "MS Sans Serif", 10 ;
				STYLE "BT"
			DEFINE POPUP pproduct FROM 8.5,18.800 TO 22,60 PROMPT FIELD ALLTRIM(brand) SCROLL MARGIN MARK CHR(16) ;
				TITLE "Brand"
			ON SELE POPUP pproduct DO entry3
			ACTI POPUP pproduct
			IF m.brand=" "
				m.prnt_btn=2
				DEACTIVATE WINDOW _qjn12z
				RETU
			ENDIF
			SELE C
			SET FILTER TO
			SET ORDER TO
			@ 8.5,18 GET m.brand PICT "@!s30" ;
				COLOR ,RGB(255,0,0,255,255,255)
			CLEAR GET
		ENDIF
	ENDIF
ENDIF
m.ans3=1
m.ans1=1
m.ans=2
@15.692,15.200 GET m.ans ;
	PICTURE "@*RHN \<Detail;\<Summary";
	SIZE 1.308,8.500,0.108 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R ;
	STYLE "BT"
m.p_rec=1
@ 18.846,38.300 SAY "Output:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@18.846,7.800 SAY "Print:"  ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT"
@20.692,7.200 GET m.p_rec ;
	PICTURE "@*RVN \<Actual";
	SIZE 1.308,18.500,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R ;
	STYLE "BT"
@20.692,37.000 GET m.p_output;
	PICTURE "@*RVN \<Printer;Pre\<view";
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R ;
	STYLE "BT"
@25.157,19.600 GET m.prnt_btn ;
	PICTURE "@*HT P\<rint;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
READ
DEACTIVATE WINDOW _qjn12z
RETU

PROCE entry2
m.item=PROMPT()
m.i_code=i_code
DEAC POPUP pitem
RETU
PROCE entry1
m.s_name=ALLTRIM(PROMPT())
m.s_code=s_code
DEAC POPUP psup
RETU

PROCE entry3
m.brand=brand
m.b_code=b_code
DEAC POPUP pproduct
RETU

PROC entry4
m.shade=shade
DEAC POPUP pshade
RETU

PROC entry5
m.size=SIZE
m.sh_code=sh_code
m.pd_code=pd_code
DEAC POPUP psize
RETU


PROCE ldsvalue
CLEA
@ 2.846,30.000 SAY "Please Wait ...";
	FONT "New Times Roman", 22;
	COLOR RGB(0,0,128,255,255,255);
	STYLE "BTI"
tstock=space(12)
tstock=sys(3)	
*sivalue=sys(3)
sivalue="ajayval"
sivalue=sivalue+".dbf"
COPY FILE stshade.dbf TO &sivalue
SELE A
USE item
set order to TAG i_code
set order to TAG b_code
SELE b
USE stock
set order to TAG sh_code
set filter to DATE<=s_date
go top
total on sh_code to &tstock fields receipt,issuse
sele c
use &tstock  excl
index on sh_code tag sh_code
SELE D
USE &sivalue excl
index on sh_code tag sh_code
REPL ALL qty WITH 0
set rela to sh_code into c
go top
repl all qty with c->receipt-c->issuse
clos all
SELE A
USE supplier
set order to TAG s_code
SELE B
USE item
set order to TAG pd_code
set order to TAG i_code
set order to TAG b_code
SELE C
USE &sivalue excl
retu

