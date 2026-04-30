nrec=0
@23,2 CLEAR TO 27.500,80
SELE F
set order to TAG order_no
SELE E
set order to TAG order_no
set filter to od_type=2
GO BOTT
minv_no=order_no
md_code=shd_code
minv_dt=order_dt
DO vdisp
STORE 0  TO m.add_btn,m.next_btn,m.back_btn,m.top_btn,m.end_btn,m.locate_btn,m.edit_btn,m.print_btn,m.close_btn,m.del_btn,m.pymt_btn,m.label_btn,m.exp_btn,m.cust_btn,m.photo_btn
@25,1 GET m.next_btn ;
	PICTURE "@*hn \<Next" ;
	SIZE 2.200,6.000,10.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('NEXT') ;
	STYLE "B"
@25,7.0 GET m.back_btn ;
	PICTURE "@*HN \<Prev" ;
	SIZE 2.200,6.000,10.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('BACK') ;
	STYLE "B"
@25,13 GET m.top_btn ;
	PICTURE "@*hn \<Top" ;
	SIZE 2.200,6.000,10.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('TOP') ;
	STYLE "B"
@25,19.00 GET m.end_btn ;
	PICTURE "@*hn \<End" ;
	SIZE 2.200,6.000,10.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('END') ;
	STYLE "B"
@25,25.000 GET m.locate_btn ;
	PICTURE "@*hn \<Locate" ;
	SIZE 2.200,6.000,10.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('LOCATE') ;
	STYLE "B"
@25,33.000 GET m.add_btn ;
	PICTURE "@*HN \<Add" ;
	SIZE 2.200,6.000,10.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('ADD') ;
	STYLE "B"
@25,39.000 GET m.edit_btn ;
	PICTURE "@*hn Ed\<it" ;
	SIZE 2.200,6.000,10.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('EDIT') ;
	STYLE "B"
@25,45.000 GET m.print_btn ;
	PICTURE "@*hn P\<rint" ;
	SIZE 2.200,6.000,10.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('PRINT') ;
	STYLE "B"
@25,51.000 GET m.label_btn;
	PICTURE "@*hn Si\<ze";
	SIZE 2.200,6.000,10.900;
	FONT "MS Sans Serif", 8;
	VALID btn_val('SIZE');
	STYLE "B"
@25,57.000 GET m.del_btn;
	PICTURE "@*hn \<Delete";
	SIZE 2.200,6.000,10.900;
	FONT "MS Sans Serif", 8;
	VALID btn_val('DELETE');
	STYLE "B"
@25,64.500 GET m.cust_btn;
	PICTURE "@*hn C\<ustomer";
	SIZE 2.200,6.000,10.900;
	FONT "MS Sans Serif", 8;
	VALID btn_val('CUSTOMER');
	STYLE "B"			
@25,74.500 GET m.exp_btn;
	PICTURE "@*hn E\<xport";
	SIZE 2.200,6.000,10.900;
	FONT "MS Sans Serif", 8;
	VALID btn_val('EXPORT');
	STYLE "B"	
@25,82.000 GET m.photo_btn;
	PICTURE "@*hn Deli\<very/Trial";
	SIZE 2.200,6.000,10.900;
	FONT "MS Sans Serif", 8;
	VALID btn_val('PHOTO');
	STYLE "B"	
@25,96.000 GET m.close_btn;
	PICTURE "@*hn \<Close";
	SIZE 2.200,6.000,10.900;
	FONT "MS Sans Serif", 8;
	VALID btn_val('CLOSE');
	STYLE "B"
READ CYCLE
flag=.F.
IF eflag=.T.
	minv_no=0
	DO vdisp
	SELE E
	SET ORDER TO TAG order_no
	IF eflag=.F.
		@0.200,2 SAY "Edit Screen" ;
			FONT "MS Sans Serif", 10 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(0,128,0,255,255,255)
	ENDIF
	*		@0.200,14 SAY cname ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(255,0,128,246,116,128)
@0,97.106 SAY "sc.bmp"BITMAP
ELSE
DO vdisp
SELE E
SET ORDER TO TAG order_NO
arr1(1,1)=minv_no
m.inv_no=arr1(1,1)
ENDIF

PROCEDURE btn_val
PARAMETER m.btnname
SELE E
LOCA FOR order_no=minv_no AND order_dt=minv_dt AND shd_code=md_code and od_type=2
DO CASE
CASE m.btnname='ADD'
	SHOW GETS DISABLE
	CLEAR READ
CASE  m.btnname='NEXT'
	IF !EOF()
		SKIP 1
		minv_no=order_no
		md_code=shd_code
		minv_dt=order_dt
	ENDIF
	IF EOF()
		WAIT WINDOW "End of the file" NOWAIT
		GO BOTTOM
		minv_no=order_no
		md_code=shd_code
		minv_dt=order_dt
	ENDIF
	DO vdisp
	*		endif
CASE  m.btnname='BACK'
	IF !EOF()
		SKIP - 1
		minv_no=order_no
		md_code=shd_code
		minv_dt=order_dt
	ENDIF
	IF BOF()
		WAIT WINDOW "Top of the file" NOWAIT
		GO TOP
		minv_no=order_no
		md_code=shd_code
		minv_dt=order_dt
	ENDIF
	DO vdisp
CASE  m.btnname='TOP'
	GO TOP
	WAIT WIND "Top of the file" NOWAIT
		minv_no=order_no
		md_code=shd_code
		minv_dt=order_dt
	DO vdisp
CASE  m.btnname='END'
	GO BOTT
	WAIT WIND "End of the file" NOWAIT
		minv_no=order_no
		md_code=shd_code
		minv_dt=order_dt
	DO vdisp
CASE m.btnname='LOCATE'
	SET FILTER  TO
	DO rlocate
CASE m.btnname='CUSTOMER'
	SET FILTER  TO
	DO upcust
CASE m.btnname='EXPORT'
	SET FILTER  TO
*	DO expoddt	
CASE m.btnname='SIZE'
	SET FILTER  TO
   do csize
CASE m.btnname='EDIT'
	SHOW GETS DISABLE
	SELE E
	COUNT TO nrec
	IF nrec#0
		DO vedit
	ENDIF
CASE m.btnname='PRINT'
		minv_no=order_no
		md_code=shd_code
		minv_dt=order_dt
	DO rprint
CASE m.btnname='PHOTO'
		minv_no=order_no
		md_code=shd_code
		minv_dt=order_dt
	    DO uptrdl
CASE m.btnname='DELETE'
	DO vdel
CASE m.btnname='PAYMT'
	DO purpymt
	sele e
	SET FILTER TO
	SET ORDER TO	
	SET ORDER TO TAG pinv_dt
	GO BOTT
CASE m.btnname='CLOSE'
	fexit=.F.
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
store 0 to m.lshd_code,m.li_code
l_date={}
s_date={}
lphoneno=space(20)
m.li_name=space(20)
m.lshd_name=space(30)
do pdialog
do pdialog1
DEFINE WINDOW wzlocate FROM 10,1 TO 25,105;
    icon file icon5.ico;
	SYSTEM GROW CLOSE ZOOM FLOAT FONT "MS Sans Serif",8 in wind cvwind
MOVE WINDOW wzlocate CENTER
SELE A
SET ORDER TO TAG shd_code
sele b
set order to i_code
SELE e
SET ORDER TO TAG order_no
SET RELA TO shd_CODE INTO A,i_code into b
do case
CASE m.p_recs=1
    m.bcamt=0
	sum gtotal to m.bcamt for order_no>=s_no AND order_no<=l_no and od_type=2
	BROWSE WINDOW wzlocate NOEDIT NODELETE;
	NOMENU TITLE "Order Detail"+space(2)+"Amount"+space(1)+str(m.bcamt) FIELDS A->shd_name :H='Customer',order_no :H='Order No.',order_dt:H='Date',gtotal :H='Total amount',tpymt :H='Payment',balance :H='Balance';
	FOR order_no>=s_no AND order_no<=l_no and od_type=2 
CASE m.p_recs=2
    m.bcamt=0
	sum gtotal to m.bcamt for order_dt>=s_date AND order_dt<=l_date and od_type=2
	BROWSE WINDOW wzlocate NOEDIT NODELETE ;
	NOMENU TITLE "Order Detail"+space(2)+"Amount"+space(1)+str(m.bcamt) FIELDS A->shd_name :H='Customer',order_no :H='Order No.',order_dt:H='Date',gtotal :H='Total amount',tpymt :H='Payment',balance :H='Balance';
	FOR order_dt>=s_date AND order_dt<=l_date and od_type=2
CASE m.p_recs=3
    m.bcamt=0
	sum gtotal to m.bcamt for shd_code=m.lshd_code and od_type=2
	BROWSE WINDOW wzlocate NOEDIT NODELETE;
	NOMENU TITLE "Order Detail"+space(2)+"Amount"+space(1)+str(m.bcamt) FIELDS A->shd_name :H='Customer',order_no :H='Order No.',order_dt:H='Date',gtotal :H='Total amount',tpymt :H='Payment',balance :H='Balance';
	FOR shd_code=m.lshd_code and od_type=2
CASE m.p_recs=4
    sele a
    set order to tag shd_code
    sele f
    set rela to shd_code into a
    store 0 to m.bcamt,m.bcqty
    sum qty to m.bcqty for i_code=m.li_code and order_dt>=s_date AND order_dt<=l_date and od_type=2
    sum amount to m.bcamt for i_code=m.li_code and order_dt>=s_date AND order_dt<=l_date and od_type=2
	BROWS WINDOW wzlocate NOEDIT NODELETE;
	NOMENU title "Item"+space(2)+alltrim(m.li_name)+space(2)+"Qty."+space(1)+str(m.bcqty,6,2)+space(1)+"Amount"+space(1)+str(m.bcamt) FIELDS order_no :H = 'Order No.',order_dt :H = 'Date',;
	qty,rate :H="Rate",amount :H="Amount",a->shd_name :H="Customer" for i_code=m.li_code and order_dt>=s_date AND order_dt<=l_date and od_type=2
CASE m.p_recs=5
    m.bcamt=0
	sum gtotal to m.bcamt for shd_code=m.lshd_code and od_type=2
	BROWSE WINDOW wzlocate NOEDIT NODELETE;
	NOMENU TITLE "Order Detail"+space(2)+"Amount"+space(1)+str(m.bcamt) FIELDS A->shd_name :H='Customer',order_no :H='Order No.',order_dt:H='Date',gtotal :H='Total amount',tpymt :H='Payment',balance :H='Balance';
	FOR shd_code=m.lshd_code and od_type=2	 
ENDCASE
SET FIELDS OFF
RELEASE WINDOW wzlocate
minv_no=order_no
md_code=shd_code
minv_dt=order_dt
do loprint
sele e
DO vdisp
RETURN

PROCEDURE pdialog
DEFINE WINDOW _qjn12zbvh;
	AT  0.000, 0.000;
	SIZE 15.231,54.800;
	FONT "MS Sans Serif", 8;
	TITLE "Order Detail";
	COLOR RGB(0,0,255,255,255,255);
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh NOSHOW
m.r_output=1
@0,47.200 SAY "sc.bmp"BITMAP
@ 0.846,10.000 SAY "Order Detail";
	FONT "MS Sans Serif", 12;
	COLOR RGB(0,128,0,255,255,255);
	STYLE "BTIU"
@ 3.092,9.000 GET m.p_recs;
	PICTURE "@*RVN Selected N\<umber;Selected \<Date;Selected \<Customer;Selected \<Item;Selected \<Phone";
	SIZE 1.308,12.000,0.308;
	DEFAULT 1;
	FONT "MS Sans Serif", 10 ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R ;
	STYLE "BT"
@ 13.154,11.600 GET m.prnt_btn ;
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
	TITLE "Order Detail"  ;
	COLOR RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12z CENTER
ACTIVATE WINDOW _qjn12z
@0,77.200 SAY "sc.bmp"BITMAP
@ 0.846,25.000 SAY "Order Detail";
	FONT "MS Sans Serif", 12;
	COLOR RGB(0,128,0,255,255,255);
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
    @5.8,8 say "Customer "; 
    	FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	sele a
	set order to
	set filter to
	set order to tag shd_name	
	m.lshd_name="  "	
	M.MT_CODE=0
	do SELEITEM			   
	IF M.mt_cODE#0
	    m.lshd_code=shd_code
		M.lshd_name=shd_name
	ENDIF		
	@5.8,27 GET m.lshd_name PICT "@!";
	    size 1,40;
		COLOR ,RGB(255,0,0,255,255,255);
		FONT "MS Sans Serif", 10
	clea gets		
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
    @4.8,8 say "Item"; 
    	FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	SELE b
	set order to
	set filter to
	SET ORDER TO TAG i_name
	DEFINE POPUP lhitem FROM 5.800,22 TO 20,62 PROMPT FIELD ALLTRIM(i_name);
	SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Item Name"
	ON SELE POPUP lhitem DO lentry2
	acti popup lhitem
	@4.8,25 GET m.li_name PICT "@!";
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
IF m.p_recs=5
	@5.8,8 SAY "Phone No.";
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@5.8,22 GET lphoneno PICT "@!" ;
	    size 1,20;
		COLOR ,RGB(255,0,0,255,255,255) ;
		FONT "MS Sans Serif", 10
	READ
	IF READKEY()=12 or readkey()=268
		m.prnt_btn=2
	ENDIF
	sele a
	SET ORDER TO
	SET FILTER TO
	if lphoneno#"  "
	   loca for shd_phno1=lphoneno
	   if found()	      
	      m.lshd_code=shd_code
		  M.lshd_name=shd_name
	   else
	   	  loca for shd_phno2=val(alltrim(lphoneno))
	   	  if found()
 	  	     m.lshd_code=shd_code
		     M.lshd_name=shd_name
		  endif
	   endif
	 endif	     
ENDIF	
DEACTIVATE WINDOW _qjn12z
RETU

proce lentry2
m.li_code=i_code
m.li_name=alltrim(i_name)
DEAC POPUP lhitem
RETU

proce rprint
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
SELE A
set order to TAG shd_code
SELE B
set order to TAG i_code
SELE E
set order to TAG order_no
SELE F
set order to TAG order_no
set rela to shd_code into a,i_code into b
DO pdialog3
IF m.prnt_btn = 2
	RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')
sele a
set order to tag shd_code
sele b
set order to tag i_Code
SELE g
flname=space(8)
flname=sys(3)
copy stru to &flname
use
use &flname
set rela to shd_code into a,i_code into b
APPE FROM ARRAY arr1 FOR qty#0
go top			
REPO FORM raltod &pr_out 
RETU

PROCEDURE pdialog3
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
	@ 4.692,4.200 GET m.p_recs;
		PICTURE "@*RVN \<Order";
		SIZE 1.308,18.500,0.308;
		DEFAULT 1;
		FONT "MS Sans Serif", 8;
		STYLE "BT"
	@ 4.692,34.000 GET m.p_output;
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

proce rszprnt
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
SELE A
set order to TAG shd_code
SELE B
set order to TAG i_code
SELE E
set order to TAG order_no
SELE F
set order to TAG order_no
set rela to shd_code into a,i_code into b
DO szpdialog
IF m.prnt_btn = 2
	RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')
SELE f
REPO FORM rodszdt &pr_out FOR order_no=minv_no AND order_dt=minv_dt
RETU

PROCEDURE szpdialog
	DEFINE WINDOW _qjn12zbvh ;
		AT  0.000, 0.000  ;
		SIZE 12.231,50.800 ;
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
	@ 4.692,4.200 GET m.p_recs;
		PICTURE "@*RVN \<Order Size";
		SIZE 1.308,18.500,0.308;
		DEFAULT 1;
		FONT "MS Sans Serif", 8;
		STYLE "BT"
	@ 4.692,34.000 GET m.p_output;
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

PROCEDURE CSIZE
	DEFINE WINDOW _qjn12zbvh ;
		AT  0.000, 0.000  ;
		SIZE 12.231,50.800 ;
		FONT "MS Sans Serif", 8 ;
		title "Size";
		fill file back.bmp;
		icon file icon5.ico;
		FLOAT NOCLOSE MINIMIZE SYSTEM
	MOVE WINDOW _qjn12zbvh CENTER
	ACTIVATE WINDOW _qjn12zbvh
	@ 3.692,5.000 GET m.p_output;
		PICTURE "@*RHN \<Alteration;\<view & Print" ;
		SIZE 1.308,12.000,0.808 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT"
	@ 9.154,16.600 GET m.prnt_btn ;
		PICTURE "@*HT \<Ok;Ca\<ncel" ;
		SIZE 1.769,8.667,0.667 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "B"
	READ
	RELEASE WINDOW _qjn12zbvh
	if m.prnt_btn=1
	   do case
	      case m.p_output=1
	          do editsz
	      case m.p_output=2
			  DO rszprnt
       endcase
	endif
   		order_no=minv_no
		shd_code=md_code
		order_dt=minv_dt
	DO vdisp
	RETURN
		
proce editsz
     store 0 to szarr(1,1),szarr(1,3),szarr(1,4),szarr(1,5),szarr(1,6),szarr(1,7),szarr(1,10),szarr(1,11)
     store 0 to szarr(1,12),szarr(1,13),szarr(1,14),szarr(1,15),szarr(1,16),szarr(1,17),szarr(1,31)
     store 0 to szarr(1,35)
     store space(6) to szarr(1,18),szarr(1,19),szarr(1,20),szarr(1,21),szarr(1,22),szarr(1,23)
	 store space(6) to szarr(1,24),szarr(1,25),szarr(1,26),szarr(1,27),szarr(1,28),szarr(1,29)
	 store space(6) to szarr(1,30)				
	 
	DEFINE WINDOW _qjn12zbvh ;
		AT  0.000, 0.000  ;
		SIZE 15.231,50.800 ;
		FONT "MS Sans Serif", 8 ;
		title "Size";
		fill file back.bmp;
		icon file icon5.ico;
		FLOAT NOCLOSE MINIMIZE SYSTEM
		MOVE WINDOW _qjn12zbvh CENTER
		acti wind _qjn12zbvh	
			@13.600,0.334 CLEAR TO 15.300,100.334
			@13.600,0.334 TO 15.300,100.334 ;
				PEN 1, 8 ;
				STYLE "1" COLOR RGB(128,,,255,255,255)
			@13.600,0.334 FILL TO 15.300,100.334 ;
				COLOR RGB(,,,255,255,128)
			@13.900,3 SAY "<Esc>" ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				COLOR RGB(255,0,0,128,128,0)								
			@13.900,10 SAY "Return,Select the item" ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				COLOR RGB(,,255,128,128,0)		
		@ 2.00,10.0 SAY "Item"  ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT"		
  	        sele b
			set order to tag 
			set order to tag i_code
			sele f
			set filter to order_no=arr1(1,1)
			go top
			nrec=0
			count to nrec
			GO TOP
			if nrec>1
				set rela to i_code into b
				DEFINE POPUP pshade FROM 2,20 TO 13,50 PROMPT FIELD alltrim(dummy)+ALLTRIM(b->i_name);
				SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Item"
				ON SELECTION POPUP pshade DO eentry6
				ACTI POPUP pshade
				@2,18 GET m.item ;
					SIZE 1.000,15.000 ;
					DEFAULT " " ;
					FONT "MS Sans Serif", 8 ;
					PICTURE "@!" ;
					COLOR ,RGB(255,0,0,255,255,255)
				CLEA GETS			
				IF M.I_CODE#0
				   COPY TO ARRAY szarr	
				   WAIT WIND STR(SZARR(1,1))+STR(SZARR(1,4))+STR(SZARR(1,35))
				ENDIF   
			else
			   COPY TO ARRAY szarr	
			endif	
		deac wind _qjn12zbvh							
		
STORE 0 TO m.size
DEFINE WINDOW awind1 ;
	AT  2.800, 68.000  ;
	SIZE 24.333,76.8000 ;
	TITLE "Customer Size" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	fill file back.bmp;
	icon file icon5.ico;
	FLOAT ;
	CLOSE ;
	MINIMIZE ;
	COLOR RGB(0,0,255,255,255,255) IN WIND cvwind
DEFINE WINDOW awind2;
	AT  2.800, 38.000;
	SIZE 24.333,76.8000;
	TITLE "Customer Size";
	FONT "MS Sans Serif", 8;
	fill file back.bmp;
	icon file icon5.ico;
	STYLE "B" ;
	FLOAT ;
	CLOSE ;
	MINIMIZE ;
	COLOR RGB(0,0,255,255,255,255) IN WIND cvwind	
DO CASE
CASE szarr(1,35)=1
ACTI WINDOW awind1
for sa=1 to 1
	@ 0.299,0.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 12 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,30.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,1.333 SAY "Length :" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,16.000 GET szarr(1,18) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.500,0.333 SAY "Chest    :" ;
		SIZE 1.000,11.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.500,16.00 GET szarr(1,19) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 6.500,2.333 SAY "Waist  :" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 6.500,16.000 GET szarr(1,20);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 8.500,1.333 SAY "Shoulder:" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,16.0 GET szarr(1,21);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 10.500,3.333 SAY "Sleeve:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 10.500,16.000 GET szarr(1,22) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@12.500,5.333 SAY "Neck:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@12.500,16.000 GET szarr(1,23);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	clea gets	
	@ 2.500,25.000 GET szarr(1,36) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 4.500,25.00 GET szarr(1,37) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 6.500,25.000 GET szarr(1,38);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 8.500,25.0 GET szarr(1,39);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 10.500,25.000 GET szarr(1,40) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@12.500,25.000 GET szarr(1,41);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	read
	@ 16.923,0.334 TO 16.923,30.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(128,,,0,0,0,)
	@ 17.300,0.333 SAY "The above sizes" ;
		SIZE 1.000,16.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 18.300,0.333 SAY "are correct" ;
		SIZE 1.000,16.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)		
	@20.000,3 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif   	
	if m.size=2
	   sele f
	   dele for order_no=szarr(1,1) and i_code=szarr(1,4)
	   appe from array szarr
	   SET FILTER TO
	endif	   	   
endfor	
deAC WINDOW awind1

CASE szarr(1,35)=2
ACTI WINDOW awind1
for sa=1 to 1
	@ 0.299,0.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,10.000;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,30.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,4.333 SAY "Length:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,16.000 GET szarr(1,24) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.500,5.333 SAY "Waist:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.500,16.00 GET szarr(1,25) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 6.500,7.333 SAY "Hip:" ;
		SIZE 1.000,5.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 6.500,16.000 GET szarr(1,26);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 8.500,4.333 SAY "Inseam:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,16.0 GET szarr(1,27);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 10.500,4.333 SAY "Bottom:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 10.500,16.000 GET szarr(1,28) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@12.500,6.333 SAY "Knee:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@12.500,16.000 GET szarr(1,29);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@14.500,5.333 SAY "Thigh:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@14.500,16.000 GET szarr(1,30);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)		
	clea gets
	
	@ 2.500,25.000 GET szarr(1,42) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 4.500,25.00 GET szarr(1,43) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 6.500,25.000 GET szarr(1,44);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 8.500,25.0 GET szarr(1,45);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 10.500,25.000 GET szarr(1,46) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@12.500,25.000 GET szarr(1,47);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@14.500,25.000 GET szarr(1,48);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	read
	@ 16.923,0.334 TO 16.923,30.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(128,,,0,0,0,)
	@ 17.300,0.333 SAY "The above sizes" ;
		SIZE 1.000,16.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 18.300,0.333 SAY "are correct" ;
		SIZE 1.000,16.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)		
	@20.000,3 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif   	
	if m.size=2
	   sele f
	   dele for order_no=szarr(1,1) and i_code=szarr(1,4)
	   appe from array szarr
	   SET FILTER TO
	endif	   	   
endfor	
DEACTI WINDOW awind1

CASE szarr(1,35)=3
ACTI WINDOW awind2
for sa=1 to 1
	@ 0.299,20.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 12 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,80.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,1.333 SAY "Length :" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,16.000 GET szarr(1,18) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.500,0.333 SAY "Chest    :" ;
		SIZE 1.000,11.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.500,16.00 GET szarr(1,19) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 6.500,2.333 SAY "Waist  :" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 6.500,16.000 GET szarr(1,20);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 8.500,1.333 SAY "Shoulder:" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,16.0 GET szarr(1,21);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 10.500,3.333 SAY "Sleeve:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 10.500,16.000 GET szarr(1,22) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@12.500,5.333 SAY "Neck:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@12.500,16.000 GET szarr(1,23);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 2.500,34.333 SAY "Length:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,46.000 GET szarr(1,24) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.500,35.333 SAY "Waist:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.500,46.00 GET szarr(1,25) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 6.500,37.333 SAY "Hip:" ;
		SIZE 1.000,5.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 6.500,46.000 GET szarr(1,26);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 8.500,34.333 SAY "Inseam:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,46.0 GET szarr(1,27);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 10.500,34.333 SAY "Bottom:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 10.500,46.000 GET szarr(1,28) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@12.500,36.333 SAY "Knee:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@12.500,46.000 GET szarr(1,29);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@14.500,35.333 SAY "Thigh:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@14.500,46.000 GET szarr(1,30);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)				
	clea gets		
	@ 2.500,25.000 GET szarr(1,36) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 4.500,25.00 GET szarr(1,37) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 6.500,25.000 GET szarr(1,38);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 8.500,25.0 GET szarr(1,39);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 10.500,25.000 GET szarr(1,40) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@12.500,25.000 GET szarr(1,41);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 2.500,56.000 GET szarr(1,42) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 4.500,56.00 GET szarr(1,43) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 6.500,56.000 GET szarr(1,44);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 8.500,56.0 GET szarr(1,45);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 10.500,56.000 GET szarr(1,46) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@12.500,56.000 GET szarr(1,47);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@14.500,56.000 GET szarr(1,48);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	read
	@ 16.923,0.334 TO 16.923,80.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(128,,,0,0,0,)
	@ 17.300,10.333 SAY "The above sizes are correct" ;
		SIZE 1.000,28.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@20.000,20 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif   	
	
	if m.size=2
	   sele f
	   dele for order_no=szarr(1,1) and i_code=szarr(1,4)
	   appe from array szarr
	   SET FILTER TO
	endif	      
endfor	

CASE szarr(1,35)=4
ACTI WINDOW awind2
for sa=1 to 1
	@ 0.299,20.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 12 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,80.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,1.333 SAY "Length :" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,16.000 GET szarr(1,18) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 4.500,0.333 SAY "Chest    :" ;
		SIZE 1.000,11.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.500,16.00 GET szarr(1,19) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 6.500,2.333 SAY "Waist  :" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 6.500,16.000 GET szarr(1,20);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 8.500,1.333 SAY "Shoulder:" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,16.0 GET szarr(1,21);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 10.500,3.333 SAY "Sleeve:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 10.500,16.000 GET szarr(1,22) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@12.500,5.333 SAY "Neck:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@12.500,16.000 GET szarr(1,23);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	clea gets		
	@ 2.500,25.000 GET szarr(1,36) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 4.500,25.00 GET szarr(1,37) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 6.500,25.000 GET szarr(1,38);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 8.500,25.0 GET szarr(1,39);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 10.500,25.000 GET szarr(1,40) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@12.500,25.000 GET szarr(1,41);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	read
	@ 16.923,0.334 TO 16.923,80.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(128,,,0,0,0,)
	@ 17.300,10.333 SAY "The above sizes are correct" ;
		SIZE 1.000,28.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@20.000,20 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif 	
	if m.size=2
	   sele f
	   dele for order_no=szarr(1,1) and i_code=szarr(1,4)
	   appe from array szarr
	   SET FILTER TO
	endif	      
	deaCTI WINDOW awind2
endfor	
CASE szarr(1,35)=5
ACTI WINDOW awind2
for sa=1 to 1
	@ 0.299,20.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 12 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,80.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,1.333 SAY "Length :" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,16.000 GET szarr(1,18) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.500,0.333 SAY "Chest    :" ;
		SIZE 1.000,11.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.500,16.00 GET szarr(1,19) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 6.500,2.333 SAY "Waist  :" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 6.500,16.000 GET szarr(1,20);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 8.500,1.333 SAY "Shoulder:" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,16.0 GET szarr(1,21);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 10.500,3.333 SAY "Sleeve:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 10.500,16.000 GET szarr(1,22) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@12.500,5.333 SAY "Neck:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@12.500,16.000 GET szarr(1,23);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@ 2.500,34.333 SAY "Length:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,46.000 GET szarr(1,24) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.500,35.333 SAY "Waist:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.500,46.00 GET szarr(1,25) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 6.500,37.333 SAY "Hip:" ;
		SIZE 1.000,5.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 6.500,46.000 GET szarr(1,26);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 8.500,34.333 SAY "Inseam:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,46.0 GET szarr(1,27);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 10.500,34.333 SAY "Bottom:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 10.500,46.000 GET szarr(1,28) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@12.500,36.333 SAY "Knee:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@12.500,46.000 GET szarr(1,29);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@14.500,35.333 SAY "Thigh:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@14.500,46.000 GET szarr(1,30);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(0,0,255,255,255,255)		
	clea gets
	
	@ 2.500,25.000 GET szarr(1,36) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 4.500,25.00 GET szarr(1,37) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 6.500,25.000 GET szarr(1,38);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 8.500,25.0 GET szarr(1,39);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 10.500,25.000 GET szarr(1,40) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@12.500,25.000 GET szarr(1,41);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)
		
	@ 2.500,56.000 GET szarr(1,42) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 4.500,56.00 GET szarr(1,43) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 6.500,56.000 GET szarr(1,44);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 8.500,56.0 GET szarr(1,45);
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@ 10.500,56.000 GET szarr(1,46) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@12.500,56.000 GET szarr(1,47);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@14.500,56.000 GET szarr(1,48);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@K !!!!!!!!!!" ;
		COLOR ,RGB(255,0,0,255,255,255)		
	read
	@ 16.923,0.334 TO 16.923,80.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(128,,,0,0,0,)
	@ 17.300,10.333 SAY "The above sizes are correct" ;
		SIZE 1.000,28.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@20.000,20 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif 	
	if m.size=2
	   sele f
	   dele for order_no=szarr(1,1) and i_code=szarr(1,4)
	   appe from array szarr
	   SET FILTER TO
	endif	      
	deaCTI WINDOW awind2
endfor	
endcase
deAC WINDOW awind1
retu				
			
			proce eentry6
			m.i_code=b->i_code
			m.item=b->i_name
			COPY TO ARRAY szarr	
			deac popup pshade
			retu			
			
proc loprint			
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
SELE A
set order to TAG shd_code
SELE B
set order to TAG i_code
SELE E
set order to TAG order_no
SELE F
set order to TAG order_no
set rela to shd_code into a,i_code into b
m.p_output=2
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')
sele f
	FOR i = 1 TO 10
        store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,10),arr1(i,11)
        store 0 to arr1(i,12),arr1(i,13),arr1(i,14),arr1(i,15),arr1(i,16),arr1(i,17),arr1(i,31),sarr(i,1)
        store 0 to arr1(i,35)        
        store space(6) to arr1(i,18),arr1(i,19),arr1(i,20),arr1(i,21),arr1(i,22),arr1(i,23)
		store space(6) to arr1(i,24),arr1(i,25),arr1(i,26),arr1(i,27),arr1(i,28),arr1(i,29)
		store space(6) to arr1(i,30)
		arr1(i,32)=space(40)
        arr1(i,2)={}
        arr1(i,8)={}
        arr1(i,9)={}            
        arr1(i,33)={}
        arr1(i,34)={}        
        store space(6) to arr1(i,36),arr1(i,37),arr1(i,38),arr1(i,39),arr1(i,40),arr1(i,41)
 		store space(6) to arr1(i,42),arr1(i,43),arr1(i,44),arr1(i,45),arr1(i,46),arr1(i,47)
		store space(6) to arr1(i,48)        
		
	    store 0 to arr1(i,49),arr1(i,50),arr1(i,51),arr1(i,52),arr1(i,53),arr1(i,54),arr1(i,55),arr1(i,56),arr1(i,57)
		store 0 to arr1(i,58),arr1(i,59),arr1(i,60),arr1(i,61),arr1(i,62),arr1(i,63),arr1(i,64),arr1(i,65),arr1(i,66)
		store 0 to arr1(i,67),arr1(i,68),arr1(i,69),arr1(i,70),arr1(i,71),arr1(i,72),arr1(i,73),arr1(i,75)
		store 0 to arr1(i,76),arr1(i,77),arr1(i,78),arr1(i,79),arr1(i,81),arr1(i,82),arr1(i,83),arr1(i,84)
		arr1(i,67)=space(8)
		arr1(i,80)=space(50)		
		arr1(i,74)=space(10)
	ENDFOR
COPY TO ARRAY arr1 FOR order_no=minv_no AND order_dt=minv_dt 
sele a
set order to tag shd_code
sele b
set order to tag i_Code
SELE g
flname=space(8)
flname=sys(3)
copy stru to &flname
use
use &flname
set rela to shd_code into a,i_code into b
APPE FROM ARRAY arr1 FOR qty#0
go top
d=1
do while not eof()
   repl od_type with 1
   repl s_no with d
   skip
   d=d+1
enddo   
for a=d to 10
    appe blank
    repl od_type with 1,shd_code with arr1(1,3)
    repl order_no with arr1(1,1),order_dt with arr1(1,2),tr_date with arr1(1,8),dl_date with arr1(1,9)
endfor
APPE FROM ARRAY arr1 FOR qty#0
go top
repl all od_type with 2 for od_type=0
set filter to od_type=2
go top
do while not eof()
   if item_type=3
	   repl od_style with ALLTRIM("Style .")
	   if ct_sy_sb=1
	      repl od_style with ALLTRIM(od_style)+"SB  ,"
	   endif   
	   if ct_sy_db=1
	      repl od_style with ALLTRIM(od_style)+"DB  ,"
	   endif   	      
   	   if ct_sy_JP=1
	      repl od_style with ALLTRIM(od_style)+"JP  ,"
	   endif   
	   if ct_bu_3b=1
		   repl od_style with ALLTRIM(od_style)+"3 Button  ,"
		endif   
	   if ct_bu_2b=1
		   repl od_style with ALLTRIM(od_style)+"2 Button  ,"
		endif   		
	   if ct_cut_bk=1
		   repl od_style with ALLTRIM(od_style)+"Back cut  ,"
		endif   	   
	   if ct_CUT_sd=1
		   repl od_style with ALLTRIM(od_style)+" Side cut  ,"
		endif   		
	   if ct_CUT_nc=1
		   repl od_style with ALLTRIM(od_style)+" no cut  ,"
		endif   			
	   if ct_bt_st=1
		   repl od_style with ALLTRIM(od_style)+"ST Bottom  ,"		   
		endif   			
	   if ct_bt_rd=1
		   repl od_style with ALLTRIM(od_style)+"RD Bottom  ,"		   
		endif
		   	
	   repl od_style1 with ALLTRIM(od_style1)+ALLTRIM("Style  .")
	   if tr_sy_sp=1
	      repl od_style1 with ALLTRIM(od_style1)+"1 Pleats  ,"
	   endif   
	   if tr_sy_dp=1
	      repl od_style1 with ALLTRIM(od_style1)+"2 Pleats  ,"
	   endif   			
	   if tr_sy_tp=1
	      repl od_style1 with ALLTRIM(od_style1)+"3 Pleats  ,"
	   endif   			   
	   if tr_sy_bp=1
	      repl od_style1 with ALLTRIM(od_style1)+"B Pleats,"	      
	   endif   			   
	   if tr_sy_ff=1
	      repl od_style1 with ALLTRIM(od_style1)+"F.F.  ,"
	   endif   			   
	   if tr_pk_cp=1
	      repl od_style1 with ALLTRIM(od_style1)+"Cross Pocket ,"	      
	   endif   			   
	   if tr_pk_sp=1
	      repl od_style1 with ALLTRIM(od_style1)+"Side Pocket ,"	      	      
	   endif   			   
	   if tr_pk_bp_1=1
	      repl od_style1 with ALLTRIM(od_style1)+"1-BP ,"
	   endif   			   
	   if tr_pk_bp_2=1
	      repl od_style1 with ALLTRIM(od_style)+"2-BP ,"
	   endif   		
	   repl od_style1 with ALLTRIM(od_style1)+"Loop ."
       repl od_style1 with ALLTRIM(od_style1)+space(1)+alltrim(tr_loop_no)
	   if tr_trun=1
	      repl od_style1 with ALLTRIM(od_style1)+"Trun UP  ."
	   endif   				   	   			   
	endif
		
   if item_type=1               
       repl od_style with alltrim("Style  .")
	   repl od_style with ALLTRIM("Collar  .")
	   if sh_cl_bd=1
	      repl od_style with ALLTRIM(od_style)+"B.Down  ,"
	   endif   
	   if sh_cl_rg=1
	      repl od_style with ALLTRIM(od_style)+"Regular  ,"
	   endif   	      
   	   if sh_cl_ban=1
	      repl od_style with ALLTRIM(od_style)+"Ban  ,"
	   endif   
	   if sh_cl_sf=1
		   repl od_style with ALLTRIM(od_style)+"Safari  ,"
		endif   
	   if sh_cl_sz#"  "
		   repl od_style with ALLTRIM(od_style)+space(1)+alltrim(sh_cl_sz)+space(2)+","
		endif   	   
	   if sh_sy_sp=1
		   repl od_style with ALLTRIM(od_style)+"SP  ,"
		endif   		
	   if sh_sy_pp=1
		   repl od_style with ALLTRIM(od_style)+"PP  ,"
		endif   			
	   if sh_pk_1=1
		   repl od_style with ALLTRIM(od_style)+"One Pocket  ,"		   		   
		endif   	
	   if sh_pk_1=2
		   repl od_style with ALLTRIM(od_style)+"Two Pocket  ,"		   		   		   
		endif   			
	   if sh_pk_1=3
		   repl od_style with ALLTRIM(od_style)+"Three Pocket  ,"		   		   
		endif   				
	endif
	
   if item_type=2
	   repl od_style with ALLTRIM("Style  .")
	   if tr_sy_sp=1
	      repl od_style with ALLTRIM(od_style)+"1 Pleats  ,"
	   endif   
	   if tr_sy_dp=1
	      repl od_style with ALLTRIM(od_style)+"2 Pleats  ,"
	   endif   			
	   if tr_sy_tp=1
	      repl od_style with ALLTRIM(od_style)+"3 Pleats  ,"
	   endif   			   
	   if tr_sy_bp=1
	      repl od_style with ALLTRIM(od_style)+"B Pleats  ,"	      
	   endif   			   
	   if tr_sy_ff=1
	      repl od_style with ALLTRIM(od_style)+"F.F.  ,"
	   endif   			   
	   if tr_pk_cp=1
	      repl od_style with ALLTRIM(od_style)+"Cross Pocket ,"	      
	   endif   			   
	   if tr_pk_sp=1
	      repl od_style with ALLTRIM(od_style)+"Side Pocket ,"	      	      
	   endif   			   
	   if tr_pk_bp_1=1
	      repl od_style with ALLTRIM(od_style)+"1-BP ,"
	   endif   			   
	   if tr_pk_bp_2=1
	      repl od_style with ALLTRIM(od_style)+"2-BP ,"
	   endif   			   
	   repl od_style with ALLTRIM(od_style)+"Loop ."  
       repl od_style with ALLTRIM(od_style)+space(1)+alltrim(tr_loop_no)
	   if tr_trun=1
	      repl od_style with ALLTRIM(od_style)+"Trun UP  ."
	   endif   				   	   
	endif		
	
	 if item_type=5               
 	   repl od_style with ALLTRIM("Style  .")
	   repl od_style with ALLTRIM(od_style)+ALLTRIM("Collar  .")
	   if sh_cl_bd=1
	      repl od_style with ALLTRIM(od_style)+"B.Down  ,"
	   endif   
	   if sh_cl_rg=1
	      repl od_style with ALLTRIM(od_style)+"Regular  ,"
	   endif   	      
   	   if sh_cl_ban=1
	      repl od_style with ALLTRIM(od_style)+"Ban  ,"
	   endif   
	   if sh_cl_sf=1
		   repl od_style with ALLTRIM(od_style)+"Safari  ,"
		endif   
	   if sh_cl_sz#"  "
		   repl od_style with ALLTRIM(od_style)+space(1)+alltrim(sh_cl_sz)+space(2)+","
		endif   	   
	   if sh_sy_sp=1
		   repl od_style with ALLTRIM(od_style)+"SP  ,"
		endif   		
	   if sh_sy_pp=1
		   repl od_style with ALLTRIM(od_style)+"PP  ,"
		endif   			
	   if sh_pk_1=1
		   repl od_style with ALLTRIM(od_style)+"One Pocket  ,"		   		   
		endif   	
	   if sh_pk_1=2
		   repl od_style with ALLTRIM(od_style)+"Two Pocket  ,"		   		   		   
		endif   			
	   if sh_pk_1=3
		   repl od_style with ALLTRIM(od_style)+"Three Pocket  ,"		   		   
		endif   						
	   repl od_style1 with ALLTRIM("Style  .")
	   if tr_sy_sp=1
	      repl od_style1 with ALLTRIM(od_style1)+"1 Pleats  ,"
	   endif   
	   if tr_sy_dp=1
	      repl od_style1 with ALLTRIM(od_style1)+"2 Pleats  ,"
	   endif   			
	   if tr_sy_tp=1
	      repl od_style1 with ALLTRIM(od_style1)+"3 Pleats  ,"
	   endif   			   
	   if tr_sy_bp=1
	      repl od_style1 with ALLTRIM(od_style1)+"B Pleats  ,"	      
	   endif   			   
	   if tr_sy_ff=1
	      repl od_style1 with ALLTRIM(od_style1)+"F.F.  ,"
	   endif   			   
	   if tr_pk_cp=1
	      repl od_style1 with ALLTRIM(od_style1)+"Cross Pocket ,"	      
	   endif   			   
	   if tr_pk_sp=1
	      repl od_style1 with ALLTRIM(od_style1)+"Side Pocket ,"	      	      
	   endif   			   
	   if tr_pk_bp_1=1
	      repl od_style1 with ALLTRIM(od_style1)+"1-BP ,"
	   endif   			   
	   if tr_pk_bp_2=1
	      repl od_style1 with ALLTRIM(od_style1)+"2-BP ,"
	   endif   			   
	   repl od_style1 with ALLTRIM(od_style1)+"Loop ."  
       repl od_style1 with ALLTRIM(od_style1)+space(1)+alltrim(tr_loop_no)
	   if tr_trun=1
	      repl od_style1 with ALLTRIM(od_style1)+"Trun UP  ."
	   endif   				   	   
	endif		
	skip
enddo
set filter to
go top			
REPO FORM rtalod &pr_out 
RETU
		
proce expoddt
	DEFINE WINDOW _qjn12zbvh ;
		AT  0.000, 0.000  ;
		SIZE 12.231,55.800 ;
		FONT "MS Sans Serif", 8 ;
		FLOAT NOCLOSE MINIMIZE SYSTEM
	MOVE WINDOW _qjn12zbvh CENTER
	ACTIVATE WINDOW _qjn12zbvh
	m.ans=0
	s_date={}
	l_date={}
	l_date=date()
	s_date=date()
	@3.0,8 SAY "From";
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT" 
	@3.0,37 say "To" ;
	   FONT "MS Sans Serif", 10 ;
	   STYLE "BT" 
	@3.0,17 GET s_date pict "@E" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
	   FONT "MS Sans Serif", 10 
	@3.0,43 GET l_date pict "@E" ;
    	COLOR ,RGB(255,0,0,255,255,255) ;
	   FONT "MS Sans Serif", 8 
	@7.0,10 SAY "Export the Order Detail:" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		COLOR RGB(0,0,128,255,255,255)						
	@ 9.154,16.600 GET m.ans ;
		PICTURE "@*HT O\<k;Ca\<ncel" ;
		SIZE 1.769,8.667,0.667 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "B"
	READ
	RELEASE WINDOW _qjn12zbvh
	if m.ans=1
	   sele d
	   copy to expoddt for order_dt>=s_date and order_dt<=l_date
	   sele e
	   copy to expodsm for order_dt>=s_date and order_dt<=l_date
	   sele f
	   copy to exporder for order_dt>=s_date and order_dt<=l_date
	endif	   
	RETURN

*ajay
proc odprint
SET ALTER TO pqr
SET ALTER ON
SET CONSOLE OFF
?
?chr(14)+"The Raymond Shop" at 22
?"A.M. Distributors" at 30
?"S-43,Sahara Mall,Mehrauli Gurgaon Road,Gurgaon" at 16
?"Ph.:0124-5048776" at 30
?repl("-",78) 
?"Order No." at 5
??order_no pict "99999" at 20
??"Order Date" at 40
??order_dt at 55
?
?"Trial Date" at 5
??tr_date pict "@e" at 20
??"Delivery Date" at 40
??dl_date pict "@e" at 55
?repl("-",78) 
?"S.No." at 1
??"Item Description" at 8
??"Qty" at 50
??"Rate" at 60
??"Amount" at 69
?repl("-",78) 
msno=1
odflag=.t.
m.amount=0
go top 
do while not eof()
   if od_type=1 and order_no#0 and s_no#0
	   ?msno pict "99" at 1
	   ??alltrim(b->i_name) pict "!!!!!!!!!!!!!!!!!!!!" at 8
	   ??qty pict "999" at 50
	   ??rate pict "9999.99" at 58
	   ??amount pict "9999.99" at 68
	endif
	if s_no=0	
	?
	endif	
	if od_type=2	    
		?repl("-",78) 
		if dflag=.t. 
			?"Total Amount" at 50
			??m.amount pict "9999.99" at 68
			?
			?
			?"Order No." at 5
			??order_no pict "99999" at 20
			??"Order Date" at 40
			??order_dt at 55
			?
			?"Trial Date" at 5
			??tr_date pict "@e" at 20
			??"Delivery Date" at 40
			??dl_date pict "@e" at 55
			?repl("-",78) 
			dflag=.f.
		endif
	endif	
	if od_type=2	
	   ?alltrim(b->i_name) pict "!!!!!!!!!!!!!!!!!!!!" at 2
	   ??space(2)
	   ??alltrim(od_style) pict "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	endif
*	if od_type=2 and remarks#"   "	
	if od_type=2
	   ?alltrim(styl_desc)+space(2)+alltrim(remarks) 	   
	endif	   
	if item_type=2 and od_type=2
	   ?"Lenght" at 10
	   ??"Waist" at 20
	   ??"Hip" at 30
	   ??"Inseam" at 40
	   ??"Bottom" at 50
	   ??"Knee" at 60
	   ??"Thigh" at 70
	   ?
	   ?t_length pict "!!!!!!!!!!" at 10
	   ??t_waist pict "!!!!!!!!!!" at 20
	   ??t_hip pict "!!!!!!!!!!" at 30
	   ??t_inseam pict "!!!!!!!!!!" at 40
	   ??t_bottom pict "!!!!!!!!!!" at 50
	   ??t_knee pict "!!!!!!!!!!" at 60
	   ??t_thigh pict "!!!!!!!!!!" at 70	   
	   ?	   
	   ?"Alteration" at 1
	   ??at_length pict "!!!!!!!!!!" at 10
	   ??at_waist pict "!!!!!!!!!!" at 20
	   ??at_hip pict "!!!!!!!!!!" at 30
	   ??at_inseam pict "!!!!!!!!!!" at 40
	   ??at_bottom pict "!!!!!!!!!!" at 50
	   ??at_knee pict "!!!!!!!!!!" at 60
	   ??at_thigh pict "!!!!!!!!!!" at 70	   	   
	   
	endif
	if item_type#2 and od_type=2
	   ?"Lenght" at 10
	   ??"Chest" at 20
	   ??"Waist" at 30
	   ??"Shoulder" at 40
	   ??"Sleeve" at 50
	   ??"Neck" at 60
	   ?
	   ?s_length pict "!!!!!!!!!!" at 10
	   ??s_chest pict "!!!!!!!!!!" at 20
	   ??s_waist pict "!!!!!!!!!!" at 30
	   ??s_shoulder pict "!!!!!!!!!!" at 40
	   ??s_sleeve pict "!!!!!!!!!!" at 50
	   ??s_neck pict "!!!!!!!!!!" at 60
	   ?
	   ?"Alteration" at 1
	   ??as_length pict "!!!!!!!!!!" at 10
	   ??as_chest pict "!!!!!!!!!!" at 20
	   ??as_waist pict "!!!!!!!!!!" at 30
	   ??as_shoulde pict "!!!!!!!!!!" at 40
	   ??as_sleeve pict "!!!!!!!!!!" at 50
	   ??as_neck pict "!!!!!!!!!!" at 60	   
	endif
	if od_type=2	
  	   ?alltrim(od_style1)
  	endif
*!*		if od_type=2 and remarks#"  "
*!*	  	   ?alltrim(remarks)
*!*	  	endif  	   
  	if (item_type=3 or item_type=5) and od_type=2
	   ?"Lenght" at 10
	   ??"Waist" at 20
	   ??"Hip" at 30
	   ??"Inseam" at 40
	   ??"Bottom" at 50
	   ??"Knee" at 60
	   ??"Thigh" at 70
	   ?
	   ?t_length pict "!!!!!!!!!!" at 10
	   ??t_waist pict "!!!!!!!!!!" at 20
	   ??t_hip pict "!!!!!!!!!!" at 30
	   ??t_inseam pict "!!!!!!!!!!" at 40
	   ??t_bottom pict "!!!!!!!!!!" at 50
	   ??t_knee pict "!!!!!!!!!!" at 60
	   ??t_thigh pict "!!!!!!!!!!" at 70
	   ?
	   ?"Alteration" at 1
	   ??at_length pict "!!!!!!!!!!" at 10
	   ??at_waist pict "!!!!!!!!!!" at 20
	   ??at_hip pict "!!!!!!!!!!" at 30
	   ??at_inseam pict "!!!!!!!!!!" at 40
	   ??at_bottom pict "!!!!!!!!!!" at 50
	   ??at_knee pict "!!!!!!!!!!" at 60
	   ??at_thigh pict "!!!!!!!!!!" at 70
	endif   
skip
m.amount=m.amount+amount
msno=msno+1
enddo
?
?
?
?
?
?
?
?
?
?
?
?
?
?
?
?"."	
sET CONSOLE ON
SET ALTER TO
A=FILE("c:\rymd05_06\bstp.dbf")
IF A=.F.
	!tYPE f:\rymd05_06\pqr.txt>prn
else	
	!tYPE c:\rymd05_06\pqr.txt>prn	
ENDIF
RETU

proce rphoto
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
SELE A
set order to TAG shd_code
SELE B
set order to TAG i_code
SELE E
set order to TAG order_no
SELE F
set order to TAG order_no
set rela to shd_code into a,i_code into b
m.odphoto="   "
A=FILE(sys(2003)+"\photo\"+alltrim(str(minv_no))+".bmp")
IF A=.t.
   m.odphoto="ajay"   
ENDIF
if m.odphoto="   "
   retu
endif   
DO rpdialog3
IF m.prnt_btn = 2
	RETURN
ENDIF
m.pr_out=IIF(m.p_output=1,'TO PRINT PROMPT NOCONSOLE','PREVIEW')
sele e
REPO FORM rodphoto &pr_out for order_no=minv_no
retu


PROCEDURE rpdialog3
	DEFINE WINDOW _qjn12zbvh ;
		AT  0.000, 0.000  ;
		SIZE 12.231,50.800 ;
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
	@ 4.692,4.200 GET m.p_recs;
		PICTURE "@*RVN P\<hoto";
		SIZE 1.308,18.500,0.308;
		DEFAULT 1;
		FONT "MS Sans Serif", 8;
		STYLE "BT"
	@ 4.692,34.000 GET m.p_output;
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
		
	proce uptrdl
	DEFINE WINDOW _qjn12zbvh ;
		AT  0.000, 0.000  ;
		SIZE 14.231,65.800 ;
		fill file back.bmp;
		title "Update Trial/Delivery Date";
		icon file icon5.ico;
		FONT "MS Sans Serif", 8 ;
		FLOAT NOCLOSE MINIMIZE SYSTEM
	MOVE WINDOW _qjn12zbvh CENTER
	ACTIVATE WINDOW _qjn12zbvh
	m.trdate={}
	m.dldate={}
	m.odtrdt={}
	m.oddldt={}	
	sele e
	loca for order_no=minv_no
	if found()
	   m.trdate=tr_date
	   m.dldate=dl_date
	   m.odtrdt=od_tr_dt
	   m.oddldt=od_dl_dt
	 endif		
		m.ans=0
		@1.500,5 SAY "Trial Date:" ;
			SIZE 1.000,12.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@1.500,22 GET m.trdate ;
			SIZE 1.000,12.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@E" ;
			COLOR ,RGB(255,0,0,255,255,255)			
		read
		if	m.trdate#{}
		    m.dldate={}
		endif    
		@3.500,5 SAY "Del. Date:" ;
			SIZE 1.000,12.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@3.500,22 GET m.dldate ;
			SIZE 1.000,12.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@E" ;
			COLOR ,RGB(255,0,0,255,255,255)						
		if m.trdate={}	
	        read
	     else
	        clea gets
	     endif      
		@5.500,4 SAY "Our Trial Date:" ;
			SIZE 1.000,13.867 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		if m.trdate#{}	
			m.odtrdt=m.trdate-1	
		else
			m.odtrdt={}
		endif	
		if m.dldate#{}			   
			m.oddldt=m.dldate-1	
		else
			m.oddldt={}
		endif			
		@5.500,22 GET m.odtrdt ;
			SIZE 1.000,12.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@E" ;
			COLOR ,RGB(255,0,0,255,255,255)			
		@7.500,4 SAY "Our Del. Date:" ;
			SIZE 1.000,13.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@7.500,22 GET m.oddldt ;
			SIZE 1.000,12.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@E" ;
			COLOR ,RGB(255,0,0,255,255,255)						
		read
		if m.oddldt={} and  m.odtrdt={}
		   wait wind "Delivery or Trial Date can't blank"
		   loop
		endif 
		m.ans=0
	@10.5,4 SAY "Save this Trial/Delivery:" ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		COLOR RGB(0,0,128,255,255,255)						
	@10.5,39.600 GET m.ans ;
		PICTURE "@*HT O\<k;Ca\<ncel" ;
		SIZE 1.769,8.667,0.667 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "B"
	READ
	RELEASE WINDOW _qjn12zbvh
	if m.ans=1
	   sele d
	   set order to
	   set filter to
	   repl all tr_date with m.trdate,dl_date with m.dldate,od_tr_dt with m.odtrdt,od_dl_dt with m.oddldt for order_no=minv_no
	   sele e
	   set order to
	   set filter to	   
	   repl all tr_date with m.trdate,dl_date with m.dldate,od_tr_dt with m.odtrdt,od_dl_dt with m.oddldt for order_no=minv_no
	   sele f
   	   set order to
	   set filter to
	   repl all tr_date with m.trdate,dl_date with m.dldate,od_tr_dt with m.odtrdt,od_dl_dt with m.oddldt for order_no=minv_no
	endif	   
	RETURN