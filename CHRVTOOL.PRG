nrec=0
SET EXACT ON
@23,2 CLEAR TO 27.500,80
SELE F
set order to TAG rv_no
SELE E
set order to TAG rv_no
GO BOTT
minv_no=rv_no
minv_dt=rv_dt
DO vdisp
STORE 0  TO m.add_btn,m.next_btn,m.back_btn,m.top_btn,m.end_btn,m.locate_btn,m.edit_btn,m.print_btn,m.close_btn,m.del_btn,m.dup_btn,m.tsum_btn,m.crd_btn
store 0 to m.pok_btn,m.jb_btn
@25,1 GET m.next_btn ;
	PICTURE "@*hn \<Next" ;
	SIZE 2.200,4.900,8.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('NEXT') ;
	STYLE "B"
@25,7 GET m.back_btn ;
	PICTURE "@*HN \<Prev" ;
	SIZE 2.200,4.900,8.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('BACK') ;
	STYLE "B"
@25,13 GET m.top_btn ;
	PICTURE "@*hn \<Top" ;
	SIZE 2.200,4.900,8.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('TOP') ;
	STYLE "B"
@25,18.000 GET m.end_btn ;
	PICTURE "@*hn \<End" ;
	SIZE 2.200,4.850,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('END') ;
	STYLE "B"
@25,23.000 GET m.locate_btn ;
	PICTURE "@*hn \<Locate" ;
	SIZE 2.200,4.400,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('LOCATE') ;
	STYLE "B"
@25,31.000 GET m.add_btn ;
	PICTURE "@*HN \<Add" ;
	SIZE 2.200,4.900,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('ADD') ;
	STYLE "B"
@25,36.000 GET m.edit_btn ;
	PICTURE "@*hn Ed\<it" ;
	SIZE 2.300,4.900,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('EDIT') ;
	STYLE "B"
@25.000,41.000 GET m.print_btn ;
	PICTURE "@*hn P\<rint" ;
	SIZE 2.300,5.700,13.800 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('PRINT') ;
	STYLE "B"
@25,47.000 GET m.del_btn ;
	PICTURE "@*hn \<Delete" ;
	SIZE 2.300,5.900,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('DELETE') ;
	STYLE "B"
@25,54.500 GET m.close_btn ;
	PICTURE "@*hn \<Close" ;
	SIZE 2.300,5.900,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('CLOSE') ;
	STYLE "B"
READ CYCLE
flag=.F.
IF eflag=.T. and dflag=.t.
	minv_no=0
	DO vdisp
	SELE E
	SET ORDER TO TAG rv_no
	IF eflag=.F.
		@0.200,2 SAY "Edit Screen" ;
			FONT "MS Sans Serif", 10 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(0,128,0,255,255,255)
	ENDIF
ELSE
	DO vdisp
	SELE E
	SET ORDER TO TAG rv_no
	arr1(1,1)=minv_no
	m.inv_no=arr1(1,1)
ENDIF

PROCEDURE btn_val
PARAMETER m.btnname
SELE E
SET ORDER TO
SET ORDER TO TAG rv_no
*loca for inv_no=minv_no and inv_dt=minv_dt and c_code=mc_Code
DO CASE
CASE m.btnname='ADD'
	SHOW GETS DISABLE
	CLEAR READ
CASE  m.btnname='NEXT'
	IF !EOF()
		SKIP 1
		minv_no=rv_no
		minv_dt=rv_dt
	ENDIF
	IF EOF()
		WAIT WINDOW "End of the file" NOWAIT
		GO BOTTOM
		minv_no=rv_no
		minv_dt=rv_dt
	ENDIF
	DO vdisp
CASE  m.btnname='BACK'
	IF !EOF()
		SKIP - 1
		minv_no=rv_no
		minv_dt=rv_dt
	ENDIF
	IF BOF()
		WAIT WINDOW "Top of the file" NOWAIT
		GO TOP
		minv_no=rv_no
		minv_dt=rv_dt
	ENDIF
	DO vdisp
CASE  m.btnname='TOP'
	GO TOP
	WAIT WIND "Top of the file" NOWAIT
		minv_no=rv_no
		minv_dt=rv_dt
	DO vdisp
CASE  m.btnname='END'
	GO BOTT
	WAIT WIND "End of the file" NOWAIT
		minv_no=rv_no
		minv_dt=rv_dt
	DO vdisp
CASE m.btnname='LOCATE'
	SET FILTER  TO
	DO rlocate
CASE m.btnname='POK'
	SET FILTER  TO
	DO pokdt
CASE m.btnname='JB'
	SET FILTER  TO
	DO updisc
CASE m.btnname='TSUM'
	SET FILTER  TO
	DO totsum
CASE m.btnname='CARD'
	SET FILTER  TO
	DO carddt
CASE m.btnname='EDIT'
		eflag=.f.		
		SHOW GETS DISABLE		
		do vedit
CASE m.btnname='PRINT'
	minv_no=rv_no
	minv_dt=rv_dt
	DO rtprint
CASE m.btnname='DELETE'
	DO vdel
CASE m.btnname='CLOSE'
	fexit=.F.
	CLEA READ
CASE m.btnname='INST'
	fexit=.F.
	pflag=.f.
	CLEA READ	
CASE m.btnname='STOCK'
	fexit=.F.
	stkflag=.f.
	CLEA READ		
ENDCASE
RETU

PROCE rlocate
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record,voucher
STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn,m.tax_amt,m.tvalue,msno,m.r_output,m.shd_code,m.prntbtn
STORE 0 TO s_no,l_no
STORE RECNO() TO saverec
m.ldate={}
store 0 to m.lsman_code,m.lsh_code,s_no,l_no,m.ls_code
l_date={}
s_date={}
m.lq_code=space(20)
m.lsman_name=space(30)
do pdialog
if m.prntbtn=2
   retu
endif   
do pdialog1
DEFINE WINDOW wzlocate FROM 2,1 TO 25,54;
    icon file icon5.ico;
	SYSTEM GROW CLOSE ZOOM FLOAT FONT "MS Sans Serif",8 in wind cvwind
MOVE WINDOW wzlocate CENTER
SELE e
SET ORDER TO TAG rv_no
do case
CASE m.p_recs=1
    BROWSE WINDOW wzlocate NOEDIT NODELETE;
	NOMENU TITLE "Challa Receive Detail" FIELDS rv_no :H='Challan No.',rv_dt :H='Date',tqty :H ='Qty.',tamount :H ='Amount' for rv_no>=s_no AND rv_no<=l_no 
CASE m.p_recs=2
    BROWSE WINDOW wzlocate NOEDIT NODELETE;
	NOMENU TITLE "Challa Receive Detail" FIELDS rv_no :H='Challan No.',rv_dt :H='Date',tqty :H ='Qty.',tamount :H ='Amount'	FOR	 rv_dt>=s_date AND rv_dt<=l_date 
CASE m.p_recs=3
    sele f    
	BROWS WINDOW wzlocate NOEDIT NODELETE ;
	NOMENU title "Challan Receive Detail" FIELDS is_no :H = 'Challan No.',is_dt :H = 'Date',;
	shade,size,qty,rate,amount  for q_code=m.lq_code and rv_dt>=s_date AND rv_dt<=l_date 
CASE m.p_recs=4
    sele f    
    store 0 to m.bcamt,m.bcqty
    sum qty to m.bcqty for sh_code=m.lsh_code and rv_dt>=s_date AND rv_dt<=l_date 
	BROWS WINDOW wzlocate NOEDIT NODELETE ;
	NOMENU title "Bar code"+space(2)+alltrim(str(m.lsh_code))+space(2)+"Qty."+space(1)+str(m.bcqty,6,2) FIELDS rv_no :H = 'Challan No.',rv_dt :H = 'Date',;
	shade,size,qty,amt :H="Amount" for sh_code=m.lsh_code and rv_dt>=s_date AND rv_dt<=l_date
CASE m.p_recs=5
	BROWS WINDOW wzlocate NOEDIT NODELETE ;
	NOMENU TITLE "Challa Receive Detail" FIELDS is_no :H='Challan No.',is_dt :H='Date',tqty :H ='Qty.',tamount :H ='Amount'
ENDCASE
SET FIELDS OFF
RELEASE WINDOW wzlocate
minv_no=rv_no
minv_dt=rv_dt
sele e
set filter to 
DO vdisp
RETURN

PROCEDURE pdialog
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 20.231,54.800 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Challan Receive Detail" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh NOSHOW
@0,47.200 SAY "sc.bmp"BITMAP
@ 0.846,5.000 SAY "Challan Receive Detail"  ;
	FONT "MS Sans Serif", 12 ;
	COLOR RGB(0,128,0,255,255,255) ;
	STYLE "BTIU"
@ 3.092,9.000 GET m.p_recs;
	PICTURE "@*RVN Selected N\<umber;Selected \<Date;Selected \<Quality Code;Selected \<Bar code;\<All Challan";
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R ;
	STYLE "BT"
@ 15.154,11.600 GET m.prntbtn ;
	PICTURE "@*HT \<OK;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "B"
ACTIVATE WINDOW _qjn12zbvh
READ CYCLE MODAL
IF READKEY()=12
	m.prnt_btn=2
ENDIF
RELEASE WINDOW _qjn12zbvh
RETURN


PROCE pdialog1
DEFINE WINDOW _qjn12z ;
	AT  0.000, 0.000  ;
	SIZE 22.231,85.800 ;
	FONT "MS Sans Serif", 8 ;
	TITLE "Challan Receive Detail"  ;
	icon file icon5.ico;
	fill file back.bmp;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12z CENTER
ACTIVATE WINDOW _qjn12z
@0,77.200 SAY "sc.bmp"BITMAP
@ 0.846,12.000 SAY "Challan Receive Detail" ;
	FONT "MS Sans Serif", 12 ;
	COLOR RGB(0,128,0,255,255,255) ;
	STYLE "BTIU"
IF m.p_recs=1 
	@5.8,8 SAY "From";
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@5.8,37 SAY "To" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@5.8,17 GET s_no PICT "9999999" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 10
	@5.8,43 GET l_no PICT "9999999" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 8
	READ
	IF READKEY()=12 or readkey()=268
		m.prnt_btn=2
	ENDIF
ENDIF	
IF m.p_recs=2
	@5.8,8 SAY "From";
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@5.8,37 SAY "To" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
    l_date=date()		
	@5.8,17 GET s_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 10
	@5.8,43 GET l_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 8
	READ
	IF READKEY()=12 or readkey()=268
		m.prnt_btn=2
	ENDIF
ENDIF
IF m.p_recs=3
    @5.8,8 say "Quality Code"; 
    	FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@5.8,27 GET m.lq_code PICT "@!";
	    size 1,20;
		COLOR ,RGB(255,0,0,255,255,255);
		FONT "MS Sans Serif", 10
    l_date=date()
	@9.8,8 SAY "From";
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@9.8,37 SAY "To" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@9.8,17 GET s_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 10
	@9.8,43 GET l_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 8
	READ
	IF READKEY()=12 or readkey()=268
		m.prnt_btn=2
	ENDIF
ENDIF
IF m.p_recs=4
    @5.8,8 say "Bar Code"; 
    	FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@5.8,27 GET m.lsh_code PICT "9999999";
	    size 1,9;
		COLOR ,RGB(255,0,0,255,255,255);
		FONT "MS Sans Serif", 10
    l_date=date()
	@9.8,8 SAY "From";
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@9.8,37 SAY "To" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@9.8,17 GET s_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 10
	@9.8,43 GET l_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 8
	READ
	IF READKEY()=12 or readkey()=268
		m.prnt_btn=2
	ENDIF
ENDIF
DEACTIVATE WINDOW _qjn12z
RETU

proce lentry3
m.ls_code=D_code
m.lsman_name=alltrim(D_name)
DEAC POPUP lhsup
RETU


proc rtprint
SET DATE BRIT
SET SAFE OFF
SET EXACT ON
*clos all
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record,voucher
STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn,m.s_amt,m.s_per,m.tamt,m.gtotal
STORE RECNO() TO saverec
msno=1
m.shd_name=SPACE(50)
voucher=SPACE(20)
m.solderror=ON('error')
SELE B
set order to TAG pd_code
SELE E
set order to TAG rv_no
SELE F
set order to TAG rv_no
set rela to pd_code into b
DO pdialog3
IF m.prnt_btn = 2
	RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')
SELE E
LOCA FOR rv_no=minv_no
IF FOUND()
	scat memvar memo
ENDIF
SELE f
REPO FORM rchrvdt &pr_out FOR rv_no=minv_no
RETU

PROCEDURE pdialog3
	DEFINE WINDOW _qjn12zbvh ;
		AT  0.000, 0.000  ;
		SIZE 12.231,50.800 ;
		fill file back.bmp;
		title "Challan Receive Print & View";
		icon file icon5.ico;		
		FONT "MS Sans Serif", 8 ;
		FLOAT NOCLOSE MINIMIZE SYSTEM
	MOVE WINDOW _qjn12zbvh CENTER
	ACTIVATE WINDOW _qjn12zbvh
	@ 2.846,35.300 SAY "Output:"  ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT"
	@ 2.846,4.800 SAY "Print:"  ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT"
	@ 4.692,4.200 GET m.p_recs ;
		PICTURE "@*RVN \<Challan" ;
		SIZE 1.308,18.500,0.308 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT"
	@ 4.692,34.000 GET m.p_output ;
		PICTURE "@*RVN \<Printer;Pre\<view" ;
		SIZE 1.308,12.000,0.308 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT"
	@ 9.154,16.600 GET m.prnt_btn ;
		PICTURE "@*HT P\<rint;Ca\<ncel" ;
		SIZE 1.769,8.667,0.667 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "B"
	READ
	RELEASE WINDOW _qjn12zbvh
	RETURN

