nrec=0
SET EXACT ON
@23,2 CLEAR TO 27.500,80
SELE F
set order to TAG inv_no
SELE E
set order to TAG inv_no
GO BOTT
minv_no=inv_no
mc_code=c_code
minv_dt=inv_dt
DO vdisp
STORE 0  TO m.add_btn,m.next_btn,m.back_btn,m.top_btn,m.end_btn,m.locate_btn,m.edit_btn,m.print_btn,m.close_btn,m.del_btn,m.dup_btn,m.tsum_btn,m.crd_btn
store 0 to m.pok_btn,m.jb_btn
@25,1 GET m.next_btn ;
	PICTURE "@*hn \<Next" ;
	SIZE 2.200,6.900,9.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('NEXT') ;
	STYLE "B"
@25,8 GET m.back_btn ;
	PICTURE "@*HN \<Prev" ;
	SIZE 2.200,6.900,8.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('BACK') ;
	STYLE "B"
@25,15 GET m.top_btn ;
	PICTURE "@*hn \<Top" ;
	SIZE 2.200,6.900,8.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('TOP') ;
	STYLE "B"
@25,22.000 GET m.end_btn ;
	PICTURE "@*hn \<End" ;
	SIZE 2.200,6.850,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('END') ;
	STYLE "B"
@25,29.000 GET m.locate_btn ;
	PICTURE "@*hn \<Locate" ;
	SIZE 2.200,6.400,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('LOCATE') ;
	STYLE "B"
@25,37.000 GET m.add_btn ;
	PICTURE "@*HN \<Add" ;
	SIZE 2.200,6.900,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('ADD') ;
	STYLE "B"
@25,44.000 GET m.edit_btn ;
	PICTURE "@*hn Ed\<it" ;
	SIZE 2.300,6.900,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('EDIT') ;
	STYLE "B"
@25.000,51.000 GET m.print_btn ;
	PICTURE "@*hn P\<rint" ;
	SIZE 2.300,6.700,13.800 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('PRINT') ;
	STYLE "B"
@25,58.000 GET m.del_btn ;
	PICTURE "@*hn \<Delete" ;
	SIZE 2.300,6.900,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('DELETE') ;
	STYLE "B"	
@25,66.00 GET m.close_btn ;
	PICTURE "@*hn \<Close" ;
	SIZE 2.300,6.900,12.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('CLOSE') ;
	STYLE "B"
READ CYCLE
flag=.F.
IF eflag=.T. and dflag=.t.
	minv_no=0
	DO vdisp
	SELE E
	SET ORDER TO TAG inv_no
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
	SET ORDER TO TAG inv_no
	arr1(1,1)=minv_no
	m.inv_no=arr1(1,1)
ENDIF

PROCEDURE btn_val
PARAMETER m.btnname
SELE E
SET ORDER TO
SET ORDER TO TAG inv_no
*loca for inv_no=minv_no and inv_dt=minv_dt and c_code=mc_Code
DO CASE
CASE m.btnname='ADD'
if m.ur_add=1
	SHOW GETS DISABLE
	CLEAR READ
else
   do mright 
endif			
CASE  m.btnname='NEXT'
	IF !EOF()
		SKIP 1
		minv_no=inv_no
		mc_code=c_code
		minv_dt=inv_dt
	ENDIF
	IF EOF()
		WAIT WINDOW "End of the file" NOWAIT
		GO BOTTOM
		minv_no=inv_no
		mc_code=c_code
		minv_dt=inv_dt
	ENDIF
	DO vdisp
CASE  m.btnname='BACK'
	IF !EOF()
		SKIP - 1
		minv_no=inv_no
		mc_code=c_code
		minv_dt=inv_dt
	ENDIF
	IF BOF()
		WAIT WINDOW "Top of the file" NOWAIT
		GO TOP
		minv_no=inv_no
		mc_code=c_code
		minv_dt=inv_dt
	ENDIF
	DO vdisp
CASE  m.btnname='TOP'
	GO TOP
	WAIT WIND "Top of the file" NOWAIT
	minv_no=inv_no
	mc_code=c_code
	minv_dt=inv_dt
	DO vdisp
CASE  m.btnname='END'
	GO BOTT
	WAIT WIND "End of the file" NOWAIT
	minv_no=inv_no
	mc_code=c_code
	minv_dt=inv_dt
	DO vdisp
CASE m.btnname='LOCATE'
*!*		SET FILTER  TO
*!*		DO rlocate
CASE m.btnname='UPDATE'
	SET FILTER  TO
*	do upitmast
CASE m.btnname='JB'
	SET FILTER  TO
	DO updisc
CASE m.btnname='TSUM'
	SET FILTER  TO
	DO totsum
CASE m.btnname='CARD'
	SET FILTER  TO
	DO carddt
CASE m.btnname='DUP'
	IF cinv=2
		ans5=0
		DO MESSAGE WITH ans5,"Cancel cash memo can't edit","  ","CHOICE WINDOW",18
	ELSE
		SHOW GETS DISABLE
		SELE E
		COUNT TO nrec
		IF nrec#0
		   DO vedit
		ENDIF
	ENDIF	
CASE m.btnname='EDIT'
if m.ur_edit=1
	SHOW GETS DISABLE		
	do vedit
else
   do mright 
endif				
CASE m.btnname='PRINT'
	minv_no=inv_no
	mc_code=c_code
	minv_dt=inv_dt
	DO newprnt
	SELE E
	GO BOTT
	minv_no=inv_no
	mc_code=c_code
	minv_dt=inv_dt
	DO vdisp
	*            do tjpinv
CASE m.btnname='DELETE'
if m.ur_dele=1
	DO vdel
else
   do mright 
endif			
	
CASE m.btnname='CLOSE'
	fexit=.F.
	CLEA READ
CASE m.btnname='RETAILS'
	fexit=.F.
	rtflag=.F.
	CLEA READ	
CASE m.btnname='INST'
	fexit=.F.
	pflag=.F.
	CLEA READ		
ENDCASE
RETU

PROCE rlocate
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record,voucher
STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn,m.tax_amt,m.tvalue,msno,m.r_output,m.shd_code
STORE 0 TO s_no,l_no
STORE RECNO() TO saverec
m.ldate={}
store 0 to m.lsman_code,m.lsh_code,s_no,l_no,m.ls_code
l_date={}
s_date={}
m.lq_code=space(20)
m.lsman_name=space(30)
do pdialog
do pdialog1
DEFINE WINDOW wzlocate FROM 10,1 TO 25,145;
    icon file icon5.ico;
	SYSTEM GROW CLOSE ZOOM FLOAT FONT "MS Sans Serif",8 in wind cvwind
MOVE WINDOW wzlocate CENTER
SELE A
SET ORDER TO TAG c_code
SELE e
SET ORDER TO TAG inv_no
SET RELA TO c_CODE INTO A
do case
CASE m.p_recs=1
    m.bcamt=0
	sum gtotal to m.bcamt for inv_no>=s_no AND inv_no<=l_no and inv_no#0 and cinv#2 and retail=3
	BROWSE WINDOW wzlocate NOEDIT NODELETE;
	NOMENU TITLE "Sale Detail"+space(2)+"Amount"+space(1)+str(m.bcamt) FIELDS A->c_name :H='Customer',inv_no :H='Invoice No.',inv_dt :H='Invoice Date',gtotal :H='Total amount',tpymt :H='Payment',balance :H='Balance';
	FOR inv_no>=s_no AND inv_no<=l_no and inv_no#0 and retail=3
CASE m.p_recs=2
   m.bcamt=0
	sum gtotal to m.bcamt for inv_dt>=s_date AND inv_dt<=l_date and inv_no#0 and cinv#2 and retail=3
	BROWSE WINDOW wzlocate NOEDIT NODELETE ;
	NOMENU TITLE "Sale Detail"+space(2)+"Amount"+space(1)+str(m.bcamt) FIELDS A->c_name :H='Customer',inv_no :H='Invoice No.',inv_dt :H='Invoice Date',gtotal :H='Total amount',tpymt :H='Payment',balance :H='Balance';
	FOR inv_dt>=s_date AND inv_dt<=l_date and inv_no#0 and retail=3
CASE m.p_recs=3
    sele f    
    store 0 to m.bcamt,m.bcqty
    sum qty to m.bcqty for q_code=m.lq_code and inv_dt>=s_date AND inv_dt<=l_date  and inv_no#0 and cinv#2 and retail=3
    sum amt-d_amt to m.bcamt for q_code=m.lq_code and inv_dt>=s_date AND inv_dt<=l_date  and inv_no#0 and cinv#2 and retail=3
	BROWS WINDOW wzlocate NOEDIT NODELETE ;
	NOMENU title "Quality code"+space(2)+alltrim(m.lq_code)+space(2)+"Qty."+space(1)+str(m.bcqty,6,2)+space(1)+"Amount"+space(1)+str(m.bcamt) FIELDS inv_no :H = 'Invoice No.',inv_dt :H = 'Date',;
	shade,size,qty,m_r_P,amt :H="Amount" for q_code=m.lq_code and inv_dt>=s_date AND inv_dt<=l_date and inv_no#0 and retail=3
CASE m.p_recs=4
    sele f    
    store 0 to m.bcamt,m.bcqty
    sum qty to m.bcqty for sh_code=m.lsh_code and inv_dt>=s_date AND inv_dt<=l_date  and inv_no#0 and cinv#2 and retail=3
    sum amt-d_amt to m.bcamt for sh_code=m.lsh_code and inv_dt>=s_date AND inv_dt<=l_date  and inv_no#0 and cinv#2 and retail=3
	BROWS WINDOW wzlocate NOEDIT NODELETE ;
	NOMENU title "Bar code"+space(2)+alltrim(str(m.lsh_code))+space(2)+"Qty."+space(1)+str(m.bcqty,6,2)+space(1)+"Amount"+space(1)+str(m.bcamt) FIELDS inv_no :H = 'Invoice No.',inv_dt :H = 'Date',;
	shade,size,qty,m_r_p :H="M.R.P.",amt :H="Amount",d_amt :H="Discount" for sh_code=m.lsh_code and inv_dt>=s_date AND inv_dt<=l_date  and inv_no#0 and retail=3
CASE m.p_recs=5
    m.slamt=0
    sum gtotal to m.slamt for sman_code=m.lsman_code and inv_dt>=s_date AND inv_dt<=l_date and inv_no#0 and cinv#2 and retail=3
	BROWSE WINDOW wzlocate NOEDIT NODELETE ;	
	NOMENU TITLE "Salesman"+space(2)+alltrim(m.lsman_name)+space(1)+"Amount"+space(1)+str(m.slamt) FIELDS A->c_name :H='Customer',inv_no :H='Invoice No.',inv_dt :H='Invoice Date',gtotal :H='Total amount',tpymt :H='Payment',balance :H='Balance';
	FOR sman_code=m.lsman_code and inv_dt>=s_date AND inv_dt<=l_date and inv_no#0 and retail=3
CASE m.p_recs=6
    sele f    
    store 0 to m.bcamt,m.bcqty
    sum qty to m.bcqty for s_code=m.ls_code and inv_dt>=s_date AND inv_dt<=l_date  and inv_no#0 and cinv#2 and retail=3
    sum amt-d_amt to m.bcamt for s_code=m.ls_code and inv_dt>=s_date AND inv_dt<=l_date  and inv_no#0 and cinv#2 and retail=3
	BROWS WINDOW wzlocate NOEDIT NODELETE ;
	NOMENU title "Company"+space(2)+alltrim(m.lsman_name)+space(2)+"Qty."+space(1)+str(m.bcqty,6,2)+space(1)+"Amount"+space(1)+str(m.bcamt) FIELDS inv_no :H = 'Invoice No.',inv_dt :H = 'Date',;
	q_code :H="Quality Code",shade,size,qty,m_r_p :H="M.R.P.",amt :H="Amount",d_amt :H="Discount" for s_code=m.ls_code and inv_dt>=s_date AND inv_dt<=l_date and inv_no#0 and retail=3
CASE m.p_recs=7
    m.slamt=0
    sum gtotal to m.slamt for card_no=m.lsh_code and inv_dt>=s_date AND inv_dt<=l_date and inv_no#0 and cinv#2 and retail=3
	BROWSE WINDOW wzlocate NOEDIT NODELETE ;	
	NOMENU TITLE "Card No"+space(2)+alltrim(str(m.lsh_code))+space(1)+"Amount"+space(1)+str(m.slamt) FIELDS inv_no :H='Invoice No.',inv_dt :H='Invoice Date',tamt :H="Amount",d_tamt :H="Discount",gtotal :H='Total amount',tpymt :H='Payment',balance :H='Balance';
	FOR card_no=m.lsh_code and inv_dt>=s_date AND inv_dt<=l_date and inv_no#0 and cinv#2 and retail=3
ENDCASE
SET FIELDS OFF
RELEASE WINDOW wzlocate
minv_no=inv_no
mc_code=c_code
minv_dt=inv_dt
sele e
set filter to inv_no#0
DO vdisp
RETURN

PROCEDURE pdialog
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 20.231,54.800 ;
	FONT "MS Sans Serif", 8 ;
	fill file back.bmp;
	icon file icon5.ico;
	TITLE "Sale Detail" ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh NOSHOW
m.r_output=1
@0,47.200 SAY "sc.bmp"BITMAP
@ 0.846,10.000 SAY "Sale Detail"  ;
	FONT "MS Sans Serif", 12 ;
	COLOR RGB(0,128,0,255,255,255) ;
	STYLE "BTIU"
@ 3.092,9.000 GET m.p_recs;
	PICTURE "@*RVN Selected N\<umber;Selected \<Date;Selected \<Quality Code;Selected \<Bar code;Selected \<Salesman;Selected Su\<pplier;Selected \<Card No.";
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R ;
	STYLE "BT"
@ 17.154,11.600 GET m.prnt_btn ;
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
	TITLE "Sale Detail"  ;
	icon file icon5.ico;
	fill file back.bmp;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12z CENTER
ACTIVATE WINDOW _qjn12z
@0,77.200 SAY "sc.bmp"BITMAP
@ 0.846,25.000 SAY "Sale Detail" ;
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
	l_no=minv_no	
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
IF m.p_recs=5
    @4.8,8 say "Salesman"; 
    	FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	SELE 12
	SET ORDER TO TAG sman_name
	DEFINE POPUP lhsale FROM 5.800,22 TO 20,62 PROMPT FIELD ALLTRIM(sman_name)+SPACE(2)+ALLTRIM("(")+ALLTRIM(sman_int)+ALLTRIM(")");
	SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Sale man code"
	ON SELE POPUP lhsale DO lentry2	
	acti popup lhsale
	@4.8,25 GET m.lsman_name PICT "@!";
		COLOR ,RGB(255,0,0,255,255,255);
		size 1,30;
		FONT "MS Sans Serif", 10
	clea gets	
    l_date=date()
	@8.8,8 SAY "From";
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@8.8,37 SAY "To" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@8.8,17 GET s_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 10
	@8.8,43 GET l_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 8
	READ
	IF READKEY()=12 or readkey()=268
		m.prnt_btn=2
	ENDIF
ENDIF		
IF m.p_recs=6
    @4.8,8 say "Company "; 
    	FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	SELE h
	SET ORDER TO TAG s_name
	DEFINE POPUP lhsup FROM 5.800,22 TO 20,62 PROMPT FIELD ALLTRIM(s_name);
	SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Company Name"
	ON SELE POPUP lhsup DO lentry3	
	acti popup lhsup
	@4.8,25 GET m.lsman_name PICT "@!";
		COLOR ,RGB(255,0,0,255,255,255);
		size 1,30;
		FONT "MS Sans Serif", 10
	clea gets	
    l_date=date()
	@8.8,8 SAY "From";
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@8.8,37 SAY "To" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@8.8,17 GET s_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 10
	@8.8,43 GET l_date PICT "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 8
	READ
	IF READKEY()=12 or readkey()=268
		m.prnt_btn=2
	ENDIF
ENDIF
IF m.p_recs=7
    @5.8,8 say "Card No."; 
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

proce lentry2
m.lsman_code=sman_code
m.lsman_name=alltrim(sman_name)+space(1)+"("+alltrim(sman_int)+")"
DEAC POPUP lhsale
RETU

proce lentry3
m.ls_code=s_code
m.lsman_name=alltrim(s_name)
DEAC POPUP lhsup
RETU

proc totsum
DIMEN smarr1(6,3)
for a=1 to 6
    store 0 to smarr1(a,1),smarr1(a,2),smarr1(a,3)
endfor
DEFINE WINDOW atotal;
    AT  0.000, 0.000;
    SIZE 25.462,85.333;
    TITLE "Sum of Cash Memo Screen";
    FONT "MS Sans Serif", 8 ;
    STYLE "B" ;
    FLOAT ;
    MINIMIZE ;
    icon file icon5.ico;
    COLOR RGB(0,0,255,255,255,255) in wind cvwind
    Move WINDOW atotal center
acti wind atotal
    mrl_no=1
	@1.8,2 say "Current Cash Memo  ";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT" 
	@1.8,30 GET minv_no pict "9999999" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		size 1,7;
		FONT "MS Sans Serif", 10 
	clea gets	
	@3.8,2 say "Show me the sum of last         Cash Memo";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT" 
	@3.8,31 GET mrl_no pict "99";
		COLOR ,RGB(255,0,0,255,255,255) ;
		size 1,2;
		FONT "MS Sans Serif", 10
	@3.8,50 say "(Including current Cash Memo)";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT" ;
	   COLOR RGB(0,0,128,255,255,255)
	@5.5,2 say "(Maximum sum of 1-5 Cash Memo)";
	   FONT "MS Sans Serif", 8 ;
	   STYLE "BT";
	   COLOR RGB(0,0,128,255,255,255)	   
	read   
	if readkey()=12 or readkey()=268
	   deac wind atotal
	   retu
	endif   
	if mrl_no<1 or mrl_no>5
	   mrl_no=1
	   @3.8,30 GET mrl_no pict "99";
		  COLOR ,RGB(255,0,0,255,255,255) ;
 		  size 1,2;
		  FONT "MS Sans Serif", 10
	   clea gets		   
	endif   
	sele e
	nrecno=recno()	   
	a=1     
	set filter to inv_No#0
	go bott
	goto nrecno
	for a=1 to mrl_no   
	   smarr1(a,1)=inv_no
	   smarr1(a,2)=inv_dt
	   smarr1(a,3)=gtotal
	   if not bof()
	      skip-1
	   endif
	endfor
	@7,2 say "Cash Memo ";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT" ;
   	   COLOR RGB(128,0,0,255,255,255)	   
	@7,24 say "Date";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT";
   	   COLOR RGB(128,0,0,255,255,255)	   
	@7,40 say "Amount";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT";
   	   COLOR RGB(128,0,0,255,255,255)
	 d=1
	 a=9
	 store 0 to m.tsumfee,m.trcvamt,m.tblamt
	 do while smarr1(d,1)#0
	   	@a,2 GET smarr1(d,1) pict "9999999" ;
			COLOR ,RGB(255,0,0,255,255,255) ;
			size 1,7;
			style "NT";			
			FONT "MS Sans Serif", 10 
	   	@a,20 GET smarr1(d,2) pict "@E" ;
			COLOR ,RGB(255,0,0,255,255,255) ;
			size 1,12;
			style "NT";			
			FONT "MS Sans Serif", 10 			
	   	@a,35 GET smarr1(d,3) pict "9999999.99" ;
			COLOR ,RGB(255,0,0,255,255,255) ;
			size 1,11;
			style "NT";
			FONT "MS Sans Serif", 10 			
		m.tsumfee=m.tsumfee+smarr1(d,3)
		a=a+2
		d=d+1
	enddo	
	clea gets	
	@19,17 say "Total Amount :";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT";
   	   COLOR RGB(128,0,0,255,255,255)
   	@19,35 GET m.tsumfee pict "9999999.99" ;
		COLOR ,RGB(0,0,128,255,255,255) ;
		size 1,11;
		style "BT";
		FONT "MS Sans Serif", 10 			
	clea gets
	@21,17 say "Amount Recv. :";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT";
   	   COLOR RGB(128,0,0,255,255,255)
   	@21,35 GET m.trcvamt pict "9999999.99" ;
		COLOR ,RGB(0,0,128,255,255,255) ;
		size 1,11;
		style "BT";
		FONT "MS Sans Serif", 10 			
	read
	m.tblamt=m.trcvamt-m.tsumfee
	@23,17 say "Balance Amt. :";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT";
   	   COLOR RGB(128,0,0,255,255,255)
   	@23,35 GET m.tblamt pict "9999999.99" ;
		COLOR ,RGB(0,0,128,255,255,255) ;
		size 1,11;
		style "BT";
		FONT "MS Sans Serif", 10 			
	clea gets	
	@23,53 say "(Press any key to cont.)";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT" ;
	   COLOR RGB(0,0,128,255,255,255)
	 wait " "  
   deac wind atotal	
	sele e
	goto nrecno
	retu
	
	proce carddt
		DEFINE WINDOW _qjn12z ;
		AT  0.000, 0.000  ;
		SIZE 18.231,75.800 ;
		FONT "MS Sans Serif", 8 ;
		TITLE "Card Detail"  ;
		COLOR RGB(0,0,255,255,255,255) ;
		FLOAT NOCLOSE MINIMIZE SYSTEM
    	MOVE WINDOW _qjn12z CENTER
	    ACTIVATE WINDOW _qjn12z
	lphoneno=SPACE(20)	
	m.lshd_code=0
	m.lshd_name=space(50)
	@3.8,8 SAY "Phone No.";
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@3.8,22 GET lphoneno PICT "@!" ;
	    size 1,20;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 10
	READ
	IF READKEY()=12 or readkey()=268
		deACTIVATE WINDOW _qjn12z
		RETU
	ENDIF
	sele 16
	SET ORDER TO
	SET FILTER TO
	if lphoneno#"  "
	   loca for C_phno1=VAL(ALLTRIM(lphoneno))
	   if found()	      
	      m.lshd_code=c_code
		  M.lshd_name=c_name
		@5.8,8 SAY "Name";
			FONT "MS Sans Serif", 10 ;
			STYLE "BT"
		@5.8,22 GET C_name pict "@!" ;
		    size 1,40;
			COLOR ,RGB(255,0,0,255,255,255) ;
			FONT "MS Sans Serif", 10		  		  
		@7.8,8 SAY "Address";
			FONT "MS Sans Serif", 10 ;
			STYLE "BT"
		@7.8,22 GET c_add1 pict "@!" ;
		    size 1,40;
			COLOR ,RGB(255,0,0,255,255,255) ;
			FONT "MS Sans Serif", 10		  		  			
		@8.8,22 GET c_add2 pict "@!" ;
		    size 1,40;
			COLOR ,RGB(255,0,0,255,255,255) ;
			FONT "MS Sans Serif", 10		  		  						
		@9.8,22 GET c_city pict "@!" ;
		    size 1,40;
			COLOR ,RGB(255,0,0,255,255,255) ;
			FONT "MS Sans Serif", 10		  		  									
		clear gets	
	   else
	   	  loca for c_phno2=ALLTRIM(lphoneno)
	   	  if found()
	      m.lshd_code=c_code
		  M.lshd_name=c_name
			@5.8,8 SAY "Name";
				FONT "MS Sans Serif", 10 ;
				STYLE "BT"
			@5.8,22 GET C_name pict "@!" ;
			    size 1,40;
				COLOR ,RGB(255,0,0,255,255,255) ;
				FONT "MS Sans Serif", 10		  		  
			@7.8,8 SAY "Address";
				FONT "MS Sans Serif", 10 ;
				STYLE "BT"
			@7.8,22 GET c_add1 pict "@!" ;
			    size 1,40;
				COLOR ,RGB(255,0,0,255,255,255) ;
				FONT "MS Sans Serif", 10		  		  			
			@8.8,22 GET c_add2 pict "@!" ;
			    size 1,40;
				COLOR ,RGB(255,0,0,255,255,255) ;
				FONT "MS Sans Serif", 10		  		  						
			@9.8,22 GET c_city pict "@!" ;
			    size 1,40;
				COLOR ,RGB(255,0,0,255,255,255) ;
				FONT "MS Sans Serif", 10		  		  									
			clear gets			     
		  endif
	   endif
	 endif	     
	 if m.lshd_code=0 
	    clea
     @3.8,8 say "Customer "; 
    	FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	sele 16
	set order to
	set filter to
	set order to tag c_name	
	m.lshd_name="  "	
	M.MT_CODE=0
	do SELEITEM			   
	IF M.mt_cODE#0
	    m.lshd_code=c_code
		M.lshd_name=c_name
	ENDIF		
		@3.8,27 GET m.lshd_name PICT "@!";
		    size 1,40;
			COLOR ,RGB(255,0,0,255,255,255);
			FONT "MS Sans Serif", 10
		@5.8,8 SAY "Address";
			FONT "MS Sans Serif", 10 ;
			STYLE "BT"
		@5.8,22 GET c_add1 pict "@!" ;
		    size 1,40;
			COLOR ,RGB(255,0,0,255,255,255) ;
			FONT "MS Sans Serif", 10		  		  			
		@7.8,22 GET c_add2 pict "@!" ;
		    size 1,40;
			COLOR ,RGB(255,0,0,255,255,255) ;
			FONT "MS Sans Serif", 10		  		  						
		@8.8,22 GET c_city pict "@!" ;
		    size 1,40;
			COLOR ,RGB(255,0,0,255,255,255) ;
			FONT "MS Sans Serif", 10		  		  									
		clear gets	
     endif
     CANS4=0
  	 @10.8,8 SAY "By Reference";
			FONT "MS Sans Serif", 10 ;
			STYLE "BT"
	 @10.800,26.600 GET cans4 ;
		PICTURE "@*HT \<No;\<Yes" ;
		SIZE 1.769,8.667,0.667 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 10 ;		
		STYLE "B"
 	read	
	 @13.854,11.600 GET m.prnt_btn ;
		PICTURE "@*HT \<OK;Ca\<ncel" ;
		SIZE 1.769,8.667,0.667 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 10 ;		
		STYLE "B"
	  read  
	  if readkey()=12 or readkey()=268 or m.prnt_btn=0
  	     DEACTIVATE WINDOW _qjn12z
  	     retu
  	  endif
  	  if m.prnt_btn=1	       
	  	    sele e
  		    loca for inv_no=minv_no 
  	    	if found()
	  	       repl card_no with m.lshd_code
	  	       repl cust_ref with cans4
  		    endif
  	 endif
  	 DEACTIVATE WINDOW _qjn12z
  	 retu    	    	       	   	    	  	    	 

	proc updisc
	d=1
	do while arr1(d,6)#0
	   if arr1(d,18)#0 and arr1(d,17)=0
     	  ans5=0
	  	  do MESSAGE WITH ans5,"You can't update discount."," ","MESSAGE WINDOW",18				
	  	  retu
	  endif	  
	  d=d+1
	enddo  
	sele e
	scat memvar
	if chamt+chamt1#0 and ccamt+ccamt1=0 and d_tamt=0 and balance=0
		DEFINE WINDOW _qjn12z ;
		AT  0.000, 0.000  ;
		SIZE 10.231,55.800 ;
		FONT "MS Sans Serif", 8 ;
		TITLE "Sale Updation Detail"  ;
		COLOR RGB(0,0,255,255,255,255) ;
		FLOAT NOCLOSE MINIMIZE SYSTEM
    	MOVE WINDOW _qjn12z CENTER
	    ACTIVATE WINDOW _qjn12z
	    store 0 to m.prnt_btn    
    	@2,5 say "Discount:";
 		   FONT "MS Sans Serif", 10 ;
		   STYLE "BT";
	   	   COLOR RGB(128,0,0,255,255,255)
   		@2,20 GET m.disc_per pict "99.99";
			COLOR ,RGB(0,0,128,255,255,255);
			size 1,7;
			style "BT";
			FONT "MS Sans Serif", 10
       @5.154,11.600 GET m.prnt_btn ;
		  PICTURE "@*HT \<OK;Ca\<ncel" ;
  		  SIZE 1.769,8.667,0.667 ;
		  DEFAULT 1 ;
		  FONT "MS Sans Serif", 10 ;		
		  STYLE "B"
	   read  
	   DEAC WINDOW _qjn12z
	  if readkey()=12 or readkey()=268 or m.prnt_btn=0
  	     DEACTIVATE WINDOW _qjn12z
  	     retu
  	  endif		    
   	  if m.prnt_btn=1
   	     repl dtamt with 0,dt_tamt with 0,dp_tamt with 0,de_tamt with 0,droundoff with 0,dgtotal with 0
   	     repl dchamt with 0,dchamt1 with 0
   	     repl dtamt with tamt-(tamt*m.disc_per/100)
   	     repl dt_tamt with t_tamt-(t_tamt*m.disc_per/100)
   	     repl dp_tamt with p_tamt-(p_tamt*m.disc_per/100)
   	     repl de_tamt with e_tamt-(e_tamt*m.disc_per/100)
   	     repl disc_per with m.disc_per
   	     repl droundoff with ROUND(dtamt,0)-dtamt
   	     repl dgtotal with ROUND(dtamt,0)
   	     if chamt#0
	   	     repl dchamt with dgtotal
	   	 endif
	   	 if chamt1#0    
	   	     repl dchamt1 with dgtotal
	   	  endif   
   	     sele f
   	     set filter to inv_no=arr1(1,1)
   	     go top
   	     repl all dt_per with m.disc_per
   	     REPL ALL DT_AMT WITH amt*m.disc_per/100   	        	     
   	     if sl_type#2
	   	    repl all dsl_amt with sl_amt-dt_amt
	   	  else
            repl all dsl_amt with 0-(sl_amt-dt_amt)
         endif   
   	     set order to
   	     set filter to   	     
   	     sele 14
   	     loca for inv_no=arr1(1,1)
   	     if found()
   	        repl ch_amt with e->dgtotal
   	     endif
   	     sele e
   	   endif
	else
 	  	ans5=0
		DO MESSAGE WITH ans5,"You can't update discount."," ","MESSAGE WINDOW",18
	endif
	retu		     
	  
	   PROCE seleitem
DEFINE WINDOW _qjn12zbvh ;
   AT  0.000, 0.000  ;
   SIZE 20.231,56.800 ;
   ICON FILE ICON5.ICO;
   FONT "MS Sans Serif", 8 ;
   title "Customer Selection";
   color rgb(0,0,255,255,255,255) ;
   FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh 
STORE SPACE(40) TO m.c_name,M.PRODUCT,MC_NAME
m.size=space(20)
store 0 to m.p_code,m.pd_code,m.i_code,m.qty,J,A
mopbal=0   
@1.0,7.5 SAY "Customer:" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	color rgb(0,0,255,255,255,255)
DO WHILE .T.
   sele 16
   set order to
   set filter to
   set order to tag c_name
   m.i_code=0
   	@1.0,7.5 SAY "Customer    :" ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		color rgb(0,0,255,255,255,255)
	DO selecust
	IF m.c_name#' '
		m.mt_code=c_CODE
		m.item=c_name
	ENDIF	
	IF m.i_code=0
		flag=.F.
		RELEASE WINDOW _qjn12zbvh
		RETURN
	ENDIF
	@1.0,7.5 SAY "Customer:";
		FONT "MS Sans Serif", 8;
		STYLE "BT";
		color rgb(0,0,255,255,255,255)
	@1.0,20 GET m.item PICT "@!s30";
		COLOR ,RGB(255,0,0,255,255,255)
	CLEA GETS
	if m.mt_code#0
	  exit
	endif  
enddo
DEAC WIND _qjn12zbvh
RETU

PROCE selecust
set dele on
*STORE 0 TO holdkey
STORE SPACE(24) TO mcity
STORE SPACE(2) TO mstate
STORE SPACE(10) TO mzip
D=0
STORE SPACE(40) TO mc_name,mc_name1,m.c_name
DIME carr1(40,1)
FOR i= 1 TO 40
	STORE SPACE(1) TO carr1(i,1)
ENDFOR
*** Mouse click and keyboard detection example ***
*** Establish the program environment ***
SET TALK OFF
SET ESCAPE OFF
*** Create and open a window ***
i=10
G=20
D=0
C=1
Q=1
DO adisp
DO WHILE .T.
	IF CAPSLOCK()=.F.
		=CAPSLOCK(!CAPSLOCK( ))
	ENDIF
	inval1 = INKEY()	&& Get INKEY( ), hide cursor, checkmouse
	IF inval1 = 0	    && No key or mouse press
		LOOP
	ENDIF
	IF inval1=27
		CLEA
		RETU
	ENDIF
	IF inval1 = 13	   && Escape key pressed, exit main loop
		SET FILTER TO
		m.c_name=SPACE(40)
		mc_name1=SPACE(40)
		FOR t= 1 TO C
			mc_name1=mc_name1+carr1(t,1)
		ENDFOR
		SET FILTER TO
		SET FILTER TO ALLTRIM(SUBSTR(c_name,1,LEN(ALLTRIM(mc_name1))))=ALLTRIM(mc_name1)
		GO TOP
		m.c_name=c_name
		EXIT
	ENDIF
	IF inval1=5 OR inval1=24
		mc_name=SPACE(40)
		FOR A= 1 TO 40
			mc_name=mc_name+carr1(A,1)
		ENDFOR
		SET FILTER TO
		SET FILTER TO ALLTRIM(SUBSTR(c_name,1,LEN(ALLTRIM(mc_name))))=ALLTRIM(mc_name)
		COUNT TO nrec
		IF nrec=0
			SET FILTER TO
		ENDIF
		SET ORDER TO TAG c_name
		DEFINE POPUP cust FROM 3,10 TO 22,55 PROMP FIELD alltrim(c_name)+space(2)+"("+alltrim(c_add1)+space(1)+","+alltrim(c_add2)+")"
		ON SELE POPUP cust DO centry1
		ACTI POPUP cust
		IF m.c_name#'   '
			EXIT
		ENDIF
	ENDIF
	IF (inval1)>=32 AND (inval1)<=126
		mc_name1=' '
		carr1(C,1)=CHR(inval1)
		FOR t= 1 TO C
			mc_name1=mc_name1+carr1(t,1)
		ENDFOR
		SET FILTER TO
		SET FILTER TO ALLTRIM(SUBSTR(c_name,1,LEN(ALLTRIM(mc_name1))))=ALLTRIM(mc_name1)
		GO TOP
		COUNT TO nrec
		IF nrec=0
			SET FILTER TO
			mc_name=SPACE(40)
			IF C-1#0
				carr1(C,1)=SPAC(1)
				FOR t= 1 TO C
					mc_name=mc_name+carr1(t,1)
				ENDFOR
				@Q,G SAY ALLTRIM(mc_name)
				*				C=C-1
				*				I=I-1
				LOOP
			ENDIF
		ELSE
			IF C<40
				mc_name=SPACE(40)
				@Q,G SAY mc_name
				FOR t= 1 TO C
					mc_name=ALLTRIM(mc_name)+SPACE(1)
				ENDFOR
				A=j
				FOR t= 1 TO C
					mc_name=mc_name+carr1(t,1)
				ENDFOR
				@Q,G SAY mc_name
				i=i+1
				C=C+1
			ENDIF
		ENDIF
	ENDIF
	DO CASE
	CASE inval1=127
		FOR A= C TO 40
			carr1(A,1)=SPACE(1)
		ENDFOR
		mc_name=SPACE(40)
		IF C-1#0
			carr1(C-1,1)=SPAC(1)
			@Q,G SAY mc_name
			FOR t= 1 TO C
				mc_name=mc_name+carr1(t,1)
			ENDFOR
			@Q,G SAY ALLTRIM(mc_name)
			C=C-1
			i=i-1
		ENDIF
		DO adisp
		LOOP
	ENDCASE
	DO adisp
	HIDE POPUP cust
	*	A=1
	*	B=j
	*	FOR A=1 TO C-1
	*		@7,B SAY carr1(A,1)
	*		B=B+1
	*	ENDFOR
ENDDO
FOR A= 1 TO C
	mc_name=mc_name+carr1(A,1)
ENDFOR
mc_name=c_name
CLEA

PROCE centry1
m.c_name=SPACE(40)
m.c_name=c_name
HIDE POPUP cust
DEAC POPUP cust
RETU

PROC adisp
mc_name1=SPACE(40)
FOR t= 1 TO C
	mc_name1=mc_name1+carr1(t,1)
ENDFOR
SET FILTER TO
SET FILTER TO ALLTRIM(SUBSTR(c_name,1,LEN(ALLTRIM(mc_name1))))=ALLTRIM(mc_name1)
GO TOP
COUNT TO nrec
IF nrec=0
	SET FILTER TO
ENDI
SET ORDER TO TAG c_name
DEFINE POPUP cust FROM 3,10 TO 22,55 PROMP FIELD alltrim(c_name)+space(2)+"("+alltrim(c_add1)+space(1)+","+alltrim(c_add2)+")"
ON SELE POPUP cust DO Centry1
SHOW POPUP cust
HIDE POPUP cust

proc newprnt
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record,_PLENGTH,_PLINENO,_PEJECT
_PEJECT="NONE"
_PLENGTH =12
_PLINENO=0
STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn,msno,m.payment,m.payment1,m.mpy,m.mpy1
m.sman_int=SPACE(20)
STORE SPACE(40) TO m.name,m.py_det,m.py_det1
STORE SPACE(60) TO m.pymt
msno=1
STORE RECNO() TO saverec
m.solderror=ON('error')
DO pdialogp
IF m.prnt_btn = 2
	RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT NOCONSOLE','PREVIEW')
SELE B
set order to TAG b_code
sele c
set order to TAG sh_code
SELE F
SET ORDER TO TAG inv_no
set rela to sh_code into c
sele a
set order to tag c_Code
sele b
set order to tag b_code
sele f
set rela to b_code into b
REPO FORM radjust &pr_out for inv_no=minv_no
SELE E
SET ORDER TO
SET FILTER TO
SET ORDER TO TAG inv_no
GO BOTT
minv_no=inv_no
minv_dt=inv_dt
DO vdisp
RETU
**********************************************
proce upitmast
ans4=0
DO MESSAGE WITH ans4,"Update the Product Master","yn","SAVE WINDOW",17
IF ans4 =1
   SELE B
   USE item excl
   zap
   appe from d:\rymd1415\item         
   
   SELE C
   USE stshade excl
   zap
   appe from d:\rymd1415\stshade
*  repl all d_code with s_code
   use
      
   use dealer  excl  
   zap
   appe from d:\rymd1415\dealer
   use
      
   sele h   
   use supplier excl
   zap
   appe from d:\rymd1415\supplier   
   
   sele b
   use item
   sele c
   use stshade
ENDIF


PROCEDURE pdialogp
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 12.231,50.800 ;
	fill file back.bmp;
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
	PICTURE "@*RVN \<Detail" ;
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