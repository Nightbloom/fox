PUBLIC mpinv_no,ms_code,mpinv_dt
clos all
store 0 to m.ur_view,m.ur_add,m.u_edit,m.u_dele,m.edu_code,m.edu_intial
use userrght
loca for u_code=mu_code and op_code=19
if found()
   scat memvar
endif 
if m.ur_view#1
   do mright
   clos all
   retu
endif
clos all
SET ESCA OFF
SET TALK OFF
SET SAFE OFF
set dele on
set excl off
SET DATE BRIT
SET STAT OFF
SET CENT ON
SET EXACT ON
SET CONF ON
ON KEY LABEL esc
SET readborder OFF
dflag=.T.
eflag=.T.
flag2=.T.
flag=.T.
flag3=.T.
flag9=.T.
sflag=.T.
STORE SPACE(10) TO m.brand,m.size,m.colour,m.sman_int
STORE SPACE(20) TO m.style,mch_no,m.ch_no,m.c_phno
STORE SPACE(20) TO m.cc_no,m.cc_no1,m.vd_inv,m.bk_Name,m.bk_Name1
STORE SPACE(40) TO m.product,m.c_name,m.c_add1,m.c_add2,m.c_city, m.py_det,m.py_det1
store space(50) to m.cu_name,m.cu_add1,m.cu_add2,m.cu_phone
m.cu_mobile=0
STORE 0 TO m.qty,m.es_code,m.b_code,m.sh_code,m.b_code,m.i_code,minv_no,m.inv_no,m.order_no
STORE 0 TO mk,m.sp_code,mc_code,m.esp_code,m.c_code,m.t_tamt,m.p_tamt,m.e_tamt,m.tpymt,m.disc_per
STORE 0 TO m.tamt,m.payment,m.balance,m.d_tamt,m.tvalue,m.roundoff,m.mpy,m.epy_code,m.ecp_code,m.disc_amt
STORE 0 TO m.payment1,m.mpy1,m.retail,m.inv_no,m.ch_code,m.dysale,m.dinv_no,m.cpamt,m.cuamt,m.dinvamt,m.bk_code,m.bk_code1
m.dinv_dt={}
STORE 1 TO saverec
minv_dt={}
m.d_date={}
m.py_dt={}
m.py_dt1={}
ed_date={}
m.date={}
DEFINE WINDOW cvwind ;
	AT  0.000, 0.000 ;
	SIZE 27.462,130.633;
	TITLE "Stock Adjustment Entry Screen" ;
	fill file back.bmp;
	icon file icon5.ico;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	FLOAT ;
	COLOR RGB(0,0,255,255,255,255)
MOVE WINDOW cvwind CENTER
DO WHILE .T.
	FOR AT=1 TO 1
	    jnflag=.t.
		fexit=.T.
		eflag=.T.
		flag2=.T.
		flag=.T.
		flag3=.T.
		sflag=.T.
		rtflag=.T.
		stkflag=.T.
		pflag=.T.
		ACTIVATE WINDOW cvwind
		@0,124.503 SAY "sc.bmp"BITMAP
		SELE A
		USE cust
		SELE B
		USE item
		SELE C
		USE stshade
		SELE D
		USE stock
		SELE E
		USE adjustsm
		SELE F
		USE adjustdt
		sele h
		use supplier
		SELE F
		SCATTER MEMVAR BLANK		
		DIMEN earr1(999,33)
		DIMEN arr1(999,33)
		DIMEN sarr(999,1)	
		STORE 0 TO i,p,z,x,K,C,a1,a2,am,mamount,m.sc_btn,t,m.ac_btn,a3,a4
		STORE SPACE(40) TO m.mf_name,m.s_name,m.brand,m.item
		STORE SPACE(3) TO mcrdr
		STORE SPACE(2) TO ans4,ans3
		FOR i = 1 TO 999
		    store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,11),arr1(i,12),arr1(i,13),arr1(i,14)
		    store 0 to arr1(i,15),arr1(i,16),arr1(i,17),arr1(i,18),arr1(i,19),arr1(i,20),arr1(i,21),arr1(i,22),arr1(i,23)
		    store 0 to arr1(i,24),arr1(i,25),arr1(i,26),arr1(i,27),arr1(i,29),arr1(i,30),arr1(i,31),arr1(i,32)
		    store 0 to arr1(i,33),sarr(i,1)
		    arr1(i,2)={}
		    store space(20) to arr1(i,8),arr1(i,9),arr1(i,10)		
		    arr1(i,28)=space(5)
			
		    store 0 to earr1(i,1),earr1(i,3),earr1(i,4),earr1(i,5),earr1(i,6),earr1(i,7),earr1(i,11),earr1(i,12),earr1(i,13),earr1(i,14)
		    store 0 to earr1(i,15),earr1(i,16),earr1(i,17),earr1(i,18),earr1(i,19),earr1(i,20),earr1(i,21),earr1(i,22),earr1(i,23)
		    store 0 to earr1(i,24),earr1(i,25),earr1(i,26),earr1(i,27),earr1(i,29),earr1(i,30),earr1(i,31),earr1(i,32)
		    store 0 to earr1(i,33)
		    earr1(i,2)={}
		    store space(20) to earr1(i,8),earr1(i,9),earr1(i,10)		    
   		    earr1(i,28)=space(5)
		ENDFOR
		SELE F
		SET ORDER TO TAG inv_no
		DO adsttool
		IF fexit=.F.
			CLOS ALL
			DEAC WIND  cvwind		
			RETU
		ENDIF
		IF eflag=.F.
			@ 0.200,0.334 TO 1.600,15.334 ;
				PEN 1, 8 ;
				STYLE "1" COLOR RGB(128,,,255,255,255)
			@ 0.200,0.334 FILL TO 1.600,15.334 ;
				COLOR RGB(,,,255,255,128)
			@0.300,2 SAY "Edit Screen" ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				PICTURE "@J" ;
				COLOR RGB(0,0,0,255,255,255)
		ELSE
			@0.200,0.111 CLEAR TO 1.900,18
		ENDIF
		DO vhead
		FOR aa1 = 1 TO 1
		        m.sgirno=0
				IF eflag=.T.
					minv_no=0
					SELE E
					set order to
					set filter to
					SET ORDER TO TAG inv_no
				    b=0
         			calcu max(inv_no) to b
					GO BOTT
					m.inv_no=b
					minv_no=b
					arr1(1,1)=b+1
					m.sgirno=B+1
				ENDIF
				IF eflag=.F.
					minv_no=earr1(1,1)
					arr1(1,1)=earr1(1,1)
					arr1(1,2)=earr1(1,2)
					m.sgirno=earr1(1,1)
				ENDIF
				@ 22.600,0.334 CLEAR TO 24.300,150.334
				@ 22.600,0.334 TO 24.300,150.334;
					PEN 1, 8 ;
					STYLE "1" COLOR RGB(128,,,255,255,255)
				@ 22.600,0.334 FILL TO 24.300,150.334 ;
					COLOR RGB(,,,255,255,128)
				@22.600,1 SAY "msign2.bmp"BITMAP	;
					FONT "MS Sans Serif", 8 ;
					STYLE "NT" ;
					COLOR RGB(,,255,128,128,0)
				@23.000,7 SAY "<Esc>" ;
					FONT "MS Sans Serif", 8 ;
					STYLE "NT" ;
					COLOR RGB(255,0,0,128,128,0)
				@23.000,14 SAY "Return  at Main Screen,Enter the Update  No.";
					FONT "MS Sans Serif", 8;
					STYLE "NT" ;
					COLOR RGB(,,255,128,128,0)		
				@1.800,10 SAY "Update  No. :" ;
					SIZE 1.000,16.667 ;
					FONT "MS Sans Serif", 8 ;
					STYLE "BT" ;
					PICTURE "@J" ;
					COLOR RGB(,,,255,255,255)
				@1.800,30 GET arr1(1,1) ;
					SIZE 1.000,6.000 ;
					VALID  !EMPTY(arr1(1,1)) ;
					DEFAULT " " ;
					FONT "MS Sans Serif", 8 ;
					PICTURE "999999" ;
					ERROR "Blank entry is not allowed" ;
					COLOR ,RGB(255,0,0,255,255,255)
				READ				
			    IF READKEY()=12 OR READKEY()=268 or arr1(1,1)=0
					CLOSE ALL
					fexit=.F.
					eflag=.T.
					EXIT
				ENDIF			
			if arr1(1,1)>m.sgirno
				t1='  '
				DO MESSAGE WITH t1,"You Can't change the","Update  No. ","Message"
				arr1(1,1)=m.sgirno
				aa1=0
				loop
			endif							
			IF eflag=.F.
				IF arr1(1,1)#earr1(1,1)
					LOCA FOR inv_no=arr1(1,1) 
					IF FOUND()
						t1='  '
						DO MESSAGE WITH t1,"This Update  No. already exsit"," ","Message"
						aa1=0
						LOOP
					ENDIF
				ENDIF
			ENDIF
			IF eflag=.T.
				LOCA FOR inv_no=arr1(1,1)
				IF FOUND()
					DO MESSAGE WITH a1,"This Update  No. already exsit"," ","Message"
					aa1=0
					LOOP
				ENDIF
			ENDIF				
			for aa2=1 to 1
			IF eflag=.T.
				arr1(1,2)=DATE()
			ENDIF
				@ 22.600,0.334 CLEAR TO 24.300,150.334
				@ 22.600,0.334 TO 24.300,150.334;
					PEN 1, 8 ;
					STYLE "1" COLOR RGB(128,,,255,255,255)
				@ 22.600,0.334 FILL TO 24.300,150.334 ;
					COLOR RGB(,,,255,255,128)
				@22.600,1 SAY "msign2.bmp"BITMAP	;
					FONT "MS Sans Serif", 8 ;
					STYLE "NT" ;
					COLOR RGB(,,255,128,128,0)
				@23.000,7 SAY "<Esc>" ;
					FONT "MS Sans Serif", 8 ;
					STYLE "NT" ;
					COLOR RGB(255,0,0,128,128,0)
				@23.000,14 SAY "Return  at Update  No.,Enter the Update  Date";
					FONT "MS Sans Serif", 8;
					STYLE "NT" ;
					COLOR RGB(,,255,128,128,0)		
				@1.800,80 SAY "Update  Date :" ;
					SIZE 1.000,17.667 ;
					FONT "MS Sans Serif", 8 ;
					STYLE "BT" ;
					PICTURE "@J" ;
					COLOR RGB(,,,255,255,255)
				@1.800,100 GET arr1(1,2) ;
					SIZE 1.000,12.000 ;
					VALID !EMPTY(arr1(1,2)) ;
					DEFAULT " " ;
					FONT "MS Sans Serif", 8 ;
					PICTURE "@E" ;
					ERROR "Blank entry is not allowed" ;
					COLOR ,RGB(255,0,0,255,255,255)
				READ
				if readkey()=12 or readkey()=268 or arr1(1,2)={}
				   aa1=0
				   loop
				endif
		endfor &&aa2
		endfor &&aa1	   
		IF fexit=.F.
			AT=0
			LOOP
		ENDIF
		   sele d
		   set order to tag sh_code
		   flname=space(8)
		   flname=sys(3)
		   total on sh_code to &flname field receipt,issuse
		   use
		   use &flname
		   repl all balance with receipt-issuse
		   index on sh_code tag sh_code
		   if eflag=.f.
		      d=1
		      do while earr1(d,5)#0
		         seek earr1(d,7)
		         if found()
		            repl balance with balance-earr1(d,11)
		         endif
		         d=d+1
		      enddo
			endif   	
				
		DO vhead
		sno=1
		sno1=1
		j=9
		K=1
		p=1
		a1=0
			DO WHILE j<=20.or.j>9
				FOR a1 = 1 TO 1
					DO WHILE .T.
						@ 22.600,0.334 CLEAR TO 24.300,150.334
						@ 22.600,0.334 TO 24.300,150.334 ;
							PEN 1, 8 ;
							STYLE "1" COLOR RGB(128,,,255,255,255)
						@ 22.600,0.334 FILL TO 24.300,150.334 ;
							COLOR RGB(,,,255,255,128)
						@22.900,1 SAY "<Up> <Down> arrow <Page Up> <Page Down> Move ,            Delete ,          Return ,           Stop Entry "	;
							FONT "MS Sans Serif", 8 ;
							STYLE "BT" ;
							COLOR RGB(,,255,128,128,0)
						@22.900,52 SAY "<Alt+D>            <Esc>              <End>" ;
							FONT "MS Sans Serif", 8 ;
							STYLE "BT" ;
							COLOR RGB(255,0,0,128,128,0)
@ 21.000,0.334 CLEAR TO 22.300,150.334
@ 21.00,0.334 TO 21.000,150.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
STORE 0 TO m.tamt,m.d_tamt,m.ntamt,m.tqty
D=1
DO WHILE arr1(D,5)#0
	  m.tamt=m.tamt+arr1(D,16)
	  m.tqty=m.tqty+arr1(d,11)
	D=D+1
ENDDO
@21.300,88 SAY "Total :" ;
	SIZE 1.000,8.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@21.300,98 GET m.tqty ;
	SIZE 1.000,8.500 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"	
@21.300,117 GET m.tamt ;
	SIZE 1.000,11.560 ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
						SET readborder OFF
						@ j,2 GET sno PICT "999";
							SIZE 1.000,4.000 ;
							FONT "MS Sans Serif", 8 ;
							COLOR ,RGB(255,0,0,255,255,255)
						ON KEY LABEL alt+D DO arrdel
						READ
						ON KEY LABEL alt+D
						IF READKEY()=12 OR READKEY()=268
							DO acancle
							IF flag3=.F.
								flag9=.F.
								eflag=.T.
								EXIT
							ELSE
								flag3=.T.
							ENDIF
						ENDIF
						IF sno#sno1
							sno=sno1
						ELSE
							EXIT
						ENDIF
					ENDDO
					IF flag3=.F.
						EXIT
					ENDIF
					flag=.T.
					IF READKEY()=3
						D=1
						sflag1=.T.
						DO WHILE sarr(D,1)#0
							IF arr1(D,7)=0
								IF D=sarr(D,1)
									z1=SPACE(1)
									DO MESSAGE WITH z1,"Blank entry is not allowed","At on S.No."+STR(D,2),"ERROR"
									DEAC WIND whelp,whead
									sflag1=.F.
									flag=.F.
									EXIT
								ENDIF
							ENDIF
							D=D+1
						ENDDO
						IF sflag1=.T.
							flag9=.F.
							D=1
							DO WHILE arr1(D,7)#0
								arr1(D,3)=arr1(1,3)
								arr1(D,1)=arr1(1,1)
								arr1(D,2)=arr1(1,2)
								arr1(D,21)=3
								D=D+1
							ENDDO
							j=20
							EXIT
						ENDIF
					ELSE
						flag9=.T.
					ENDIF
					IF flag=.F.
						a1=0
						flag=.T.
						LOOP
					ENDIF
					IF READKEY()=5
					   IF arr1(K,5)#0
						  flag2=.F.
						  j=j+1
						  K=K+1
						  sno1=sno1+1
						  sno=sno+1
						  IF j>=19
						  	 x=K-5
						  	 DO disparr
						 	 j=19
						  ENDIF
							IF j<=19
								LOOP
							ELSE
								*						K=K+1
								x=K+1
								DO disparr
								j=9
								LOOP
							ENDIF
						ENDIF
					ENDIF
					IF READKEY()=4
						IF K<=1
							WAIT WIND "First S.No."
							j=9
							K=2
							sno=2
							sno1=2
						ENDIF
						flag2=.F.
						j=j-1
						K=K-1
						sno1=sno1-1
						sno=sno-1
						IF j>=9
							LOOP
						ELSE
							x=K
							DO disparr
							j=9
							LOOP
						ENDIF
					ENDIF
					IF READKEY()=7
						flag2=.F.
						IF  arr1(K+10,5)=0
							LOOP
						ENDIF
						IF arr1(K+10,5)#0
							x=K+10
							IF x>20
								LOOP
							ENDIF
							sno=x
							sno1=x
							asno=x
							z=9
					@9,0 CLEAR TO 20,150							
						DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,4.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,6 GET arr1(x,7);
		SIZE 1.000,8.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "9999999" ;
		style "NT";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"		
	@z,18 GET arr1(x,8);
		SIZE 1.000,15.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR b_code=arr1(x,5)
	IF FOUND()
	    m.item=alltrim(item)+"-"+alltrim(brand)
		@z,35 GET m.item ;
			SIZE 1.000,33.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,67 GET arr1(x,9) ;
		SIZE 1.000,14.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,80 GET arr1(x,10) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,12) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,98 GET arr1(x,11) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"

	@z,107 GET arr1(x,26) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,117 GET arr1(x,16) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	CLEA GETS
	
									z=z+1
								sno=sno+1
								sno1=sno1+1
								x=x+1
								asno=asno+1
								IF arr1(x,5)=0
									@z,1 CLEAR TO 21,111
									EXIT
								ENDIF
							ENDDO
							j=9
							sno=K+10
							sno1=K+10
							K=K+10
							LOOP
						ENDIF
					ENDIF
					IF READKEY()=6
						x=K-10
						IF x<1
							*					x=1
							LOOP
							x=1
						ENDIF
						sno=x
						sno1=x
						asno=x
						z=9
			@9,0 CLEAR TO 20,150						
				DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,4.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,6 GET arr1(x,7);
		SIZE 1.000,8.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "9999999" ;
		style "NT";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"		
	@z,18 GET arr1(x,8);
		SIZE 1.000,15.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR b_code=arr1(x,5)
	IF FOUND()
	    m.item=alltrim(item)+"-"+alltrim(brand)
		@z,35 GET m.item ;
			SIZE 1.000,33.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,67 GET arr1(x,9) ;
		SIZE 1.000,14.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,80 GET arr1(x,10) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,12) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,98 GET arr1(x,11) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"

	@z,107 GET arr1(x,26) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,117 GET arr1(x,16) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	CLEA GETS
	
							z=z+1
							sno=sno+1
							sno1=sno1+1
							asno=asno+1
							x=x+1
							IF arr1(x,5)=0
								@z,1 CLEAR TO 21,111
								EXIT
							ENDIF
						ENDDO
						j=9
						IF K-10<1
							sno=1
							sno1=1
							K=1
						ELSE
							sno=K-10
							sno1=K-10
							K=K-10
						ENDIF
						LOOP
					ENDIF			
				    jnflag=.t.	
					FOR a2=1 TO 1						
						@ 22.600,0.334 CLEAR TO 24.300,150.334
						@ 22.600,0.334 TO 24.300,150.334 ;
							PEN 1, 8 ;
							STYLE "1" COLOR RGB(128,,,255,255,255)
						@ 22.600,0.334 FILL TO 24.300,150.334 ;
							COLOR RGB(,,,255,255,128)
						@22.600,1 SAY "msign2.bmp"BITMAP	;
							FONT "MS Sans Serif", 8 ;
							STYLE "NT" ;
							COLOR RGB(,,255,128,128,0)							
						@22.900,14 SAY "Return at S.No.,Enter the Bar code";
							FONT "MS Sans Serif", 8 ;
							STYLE "BT" ;
							COLOR RGB(,,255,128,128,0)
						@22.900,7 SAY "<Esc>" ;
							FONT "MS Sans Serif", 8 ;
							STYLE "BT" ;
							COLOR RGB(255,0,0,128,128,0)						
						@j,6 clea to j+1,14
						@j,6 GET arr1(k,7);
							SIZE 1.000,8.000;
							DEFAULT " ";
							FONT "MS Sans Serif", 8;
							PICTURE "9999999" ;
							style "NT";
							COLOR ,RGB(255,0,0,255,255,255);
							ERROR "Blank entry is not allowed"		
						READ				
						if readkey()=12 OR READKEY()=268
						   a1=0
						   loop
						endif				
						m.aunit=0
						sele c
						set order to
						set filter to
						loca for sh_code=arr1(k,7)
						if found()
						   arr1(k,4)=i_code
						   arr1(k,5)=b_code
						   arr1(k,6)=pd_code						
						   arr1(k,8)=q_code
						   arr1(k,9)=shade
						   arr1(k,10)=size
						   arr1(k,12)=m_r_p
						   arr1(k,24)=s_code					   
						   arr1(k,25)=d_code					   
						   arr1(k,26)=ex_rate
						   jnflag=.f.
						@j,18 clea to j+1,34   
						@j,18 GET arr1(k,8);
							SIZE 1.000,15.000;
							DEFAULT " ";
							FONT "MS Sans Serif", 8;
							PICTURE "@!" ;
							COLOR ,RGB(255,0,0,255,255,255);
							ERROR "Blank entry is not allowed"
						clea gets   
							SELE B
							SET ORDER TO
							SET FILTER TO
							LOCA FOR b_code=arr1(k,5)
							IF FOUND()
							   m.aunit=unit
	   						   arr1(k,13)=t_type
							   arr1(k,14)=t_per
							    m.item=alltrim(item)+"-"+alltrim(brand)
								@j,35 GET m.item ;
									SIZE 1.000,33.000 ;
									DEFAULT " " ;
									FONT "MS Sans Serif", 8 ;
									PICTURE "@!" ;
									COLOR ,RGB(255,0,0,255,255,255)
								CLEA GETS
							ENDIF
					@j,67 clea to j+1,97		
					@j,67 GET arr1(k,9) ;
						SIZE 1.000,14.000 ;
						VALID !EMPTY(arr1(k,9)) ;
						DEFAULT " " ;
						FONT "MS Sans Serif", 8 ;
						PICTURE "@!" ;
						COLOR ,RGB(2550,0,0,255,255,255) ;
						ERROR "Blank entry is not allowed"
					@j,80 GET arr1(k,10) ;
						SIZE 1.000,8.000 ;
						DEFAULT " " ;
						FONT "MS Sans Serif", 8 ;
						PICTURE "@!" ;
						COLOR ,RGB(2550,0,0,255,255,255)
					@j,87 GET arr1(k,12) ;
						SIZE 1.000,11.000 ;
						DEFAULT " " ;
						FONT "MS Sans Serif", 8 ;
						PICTURE "999999.99" ;
						COLOR ,RGB(255,0,0,255,255,255) ;
						ERROR "Blank entry is not allowed"		
					clea gets	
					else
				  		z1=SPACE(1)
						DO MESSAGE WITH z1,"This Bar code does not exist"," ","ERROR"
					endif	
							FOR a3= 1 TO 1	
							   m.stkstk=0
							   m.stkstk1=0
							   sele d
							   set order to tag sh_code
							   seek arr1(k,7)
							   if found()
							      m.stkstk=balance
							   endif   
									sele c							
								@ 22.600,0.334 CLEAR TO 24.300,150.334
								@ 22.600,0.334 TO 24.300,150.334 ;
									PEN 1, 8 ;
									STYLE "1" COLOR RGB(128,,,255,255,255)
								@ 22.600,0.334 FILL TO 24.300,150.334 ;
									COLOR RGB(,,,255,255,128)
								@22.900,14 SAY "Return  to barcode,Enter the Qty,Rate";
									FONT "MS Sans Serif", 8 ;
									STYLE "BT" ;
									COLOR RGB(,,255,128,128,0)									
								@22.900,7 SAY "<Esc>" ;
									FONT "MS Sans Serif", 8 ;
									STYLE "BT" ;
									COLOR RGB(255,0,0,128,128,0)
								@22.600,1 SAY "msign2.bmp"BITMAP	;
									FONT "MS Sans Serif", 8 ;
									STYLE "NT" ;									
									COLOR RGB(,,255,128,128,0)											
								@22.900,70 SAY "Current Stock:";
									FONT "MS Sans Serif", 10 ;
									STYLE "BT" ;
									COLOR RGB(255,0,0,128,128,0)
								@22.900,84 GET m.stkstk;
									SIZE 1.000,8.500;
									DEFAULT " ";
									FONT "MS Sans Serif", 10;
									PICTURE "9999.99" ;
									style "BT";
									COLOR ,RGB(0,0,128,255,255,255) ;
									ERROR "Blank entry is not allowed"	
								clea gets								   							
									
								@j,107 clea to j+1,117	
								@j,107 GET arr1(k,26) ;
									SIZE 1.000,10.000 ;
									DEFAULT " " ;
									FONT "MS Sans Serif", 8 ;
									PICTURE "99999.99" ;
									COLOR ,RGB(255,0,0,255,255,255) ;
									ERROR "Blank entry is not allowed"											
								clea gets	
								@j,98 GET arr1(k,11) ;
									SIZE 1.000,8.500 ;
									DEFAULT " " ;
									FONT "MS Sans Serif", 8 ;
									PICTURE "9999.99" ;
									COLOR ,RGB(255,0,0,255,255,255) ;
									ERROR "Blank entry is not allowed"
								READ
								IF READKEY()=12 OR READKEY()=268 or arr1(k,11)=0
									arr1(K,7)=0
									a2=0
									LOOP
								ENDIF								
								arr1(K,16)=arr1(K,11)*arr1(K,26)
								@j,117 clea to j+1,118
								@j,117 GET arr1(k,16);
									SIZE 1.000,11.000;
									DEFAULT " ";
									FONT "MS Sans Serif", 8;
									PICTURE "999999.99";
									COLOR ,RGB(255,0,0,255,255,255);
									ERROR "Blank entry is not allowed"		
							   clea gets	
								j=j+1
								p=p+1
								IF j>C
									C=j
								ENDIF
								arr1(K,1)=arr1(1,1)
								arr1(K,2)=arr1(1,2)
								arr1(K,3)=arr1(1,3)
								arr1(K,23)=arr1(1,23)								
								arr1(D,21)=3
								sarr(K,1)=sno
								K=K+1
								sno=sno+1
								sno1=sno
								p=K
								IF j>=19
									x=K-10
									DO disparr
									j=19
									DO intarr
								ENDIF
						ENDFOR &&a3
					ENDFOR &&a2
				ENDFOR &&a1
				IF K=995
					EXIT
				ENDIF
				IF flag9=.F.
					EXIT
				ENDIF
			ENDDO
			IF flag3=.F.
				CLOSE ALL
				AT=0
				LOOP
			ENDIF						
@ 21.000,0.334 CLEAR TO 22.300,150.334
@ 21.00,0.334 TO 21.000,150.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
STORE 0 TO m.tamt,m.d_tamt,m.ntamt,m.tqty
D=1
DO WHILE arr1(D,5)#0
	  m.tamt=m.tamt+arr1(D,16)
	  m.tqty=m.tqty+arr1(d,11)
	D=D+1
ENDDO
@21.300,88 SAY "Total :" ;
	SIZE 1.000,8.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@21.300,98 GET m.tqty ;
	SIZE 1.000,8.500 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"	
@21.300,117 GET m.tamt ;
	SIZE 1.000,11.560 ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
			ans4=0
			DO MESSAGE WITH ans4,"Save this Stock Adjustment","yn","SAVE WINDOW",17
			IF ans4 =1
			   DO vsave
			ENDIF
	ENDFOR
ENDDO
ON KEY LABEL f1
DEACTIVATE WIND cvwind

PROCE entry1
arr1(1,3)=c_code
m.c_code=c_code
m.c_name=ALLTRIM(c_name)
DEAC POPUP hparty
RETU

PROCE entry2
arr1(1,19)=sman_code
m.sman_int=sman_int
DEAC POPUP hsale
RETU

PROC entry3
m.item=item
arr1(K,3)=i_code
DEAC POPUP pbrand
RETU

PROC entry4
m.brand=brand
arr1(K,4)=b_code
DEAC POPUP  pproduct
RETU

PROC entry5
arr1(K,6)=pd_code
arr1(K,10)=SIZE
arr1(K,12)=ex_rate
arr1(K,15)=unit
arr1(K,7)=sh_code
arr1(k,24)=s_code
arr1(k,25)=d_code
arr1(k,26)=ex_rate
DEAC POPUP psize
RETU

PROC entry6
arr1(K,9)=shade
DEAC POPUP pshade
RETU

proce bentry1
m.bk_code=bk_code
m.bk_name=bk_name
deac popup hbank
retu

proce bentry2
m.bk_code1=bk_code
m.bk_name1=bk_name
deac popup hbank1
retu

PROC disparr
z=9
asno=x
@9,0 CLEAR TO 20,150
DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,4.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,6 GET arr1(x,7);
		SIZE 1.000,8.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "9999999" ;
		style "NT";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"		
	@z,18 GET arr1(x,8);
		SIZE 1.000,15.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR b_code=arr1(x,5)
	IF FOUND()
	    m.item=alltrim(item)+"-"+alltrim(brand)
		@z,35 GET m.item ;
			SIZE 1.000,33.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,67 GET arr1(x,9) ;
		SIZE 1.000,14.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,80 GET arr1(x,10) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,12) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,98 GET arr1(x,11) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"

	@z,107 GET arr1(x,26) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,117 GET arr1(x,16) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
		
	CLEA GETS
	IF arr1(x,5)=0
		EXIT
		SELE B
	ENDIF
	z=z+1
	x=x+1
	asno=asno+1
ENDDO
RETU


PROCE achead
m.it_btn=0
ON KEY LABEL f2
ON KEY LABEL rightmouse
@24.300,0 CLEAR TO 28.300,400
@24.200,10 SAY "MSIGN.BMP"BITMAP
@24.800,16 SAY "Press <enter> for new item otherwise <Esc> return to S.No."  ;
	COLOR RGB(0,0,128,255,255,255)
@23.900,5 GET m.it_btn ;
	PICTURE "@*bhn bitmap2.bmp" ;
	SIZE 2.200,5.900,10.900 ;
	FONT "MS Sans Serif", 8 ;
	VALID btn_val('ITEM') ;
	STYLE "B"
READ CYCLE
@23.900,5 SAY "bitmap2.bmp"BITMAP COLOR RGB(,,,192,192,192)
@24.200,10 SAY "MSIGN.BMP"BITMAP
@24.800,16 SAY "Activate this menu by clicking the Right Button or <F2> key at S.No."  ;
	COLOR RGB(0,0,128,255,255,255)
@26.300,3 SAY "New Item" ;
	FONT "MS Sans Serif", 5 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(0,0,128,128,128,0)
flag=.F.
ON KEY LABEL f2 DO achead
ON KEY LABEL rightmouse DO achead
RETU


PROCEDURE btn_val
PARAMETER m.btnname
DO CASE
CASE  m.btnname='ITEM'
	CLOS ALL
	DO item
	CLEAR READ
	CLOS ALL
	SELE A
	USE supplier
	set order to TAG s_name
	set order to TAG s_code
	SELE B
	USE item
	set order to TAG item 
	set order to TAG brand 
	set order to TAG SIZE
	set order to TAG pd_code
	SELE C
	USE stshade
	set order to TAG sh_code
	set order to TAG shade 
	SELE D
	USE stock
	set order to TAG DATE
	SELE E
	USE stop_sum
	set order to TAG DATE
	SELE F
	USE stopen
	set order to TAG DATE
	SELE G
	USE coupon
	SELE 11
	USE stbrand
	set order to TAG b_code
	SELE F
	RETU
ENDCASE

PROCE acancle
ans5=0
DO MESSAGE WITH ans5,"Exit without save","yn","CHOICE WINDOW",18
IF ans5=1
	flag3=.F.
ENDIF
flag=.F.
RETU

PROCE vdisp
m.c_name=SPACE(50)
SELE F
SET ORDER TO
SET ORDER TO TAG inv_no
IF eflag=.T.
	FOR i = 1 TO 999
	    store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,11),arr1(i,12),arr1(i,13),arr1(i,14)
	    store 0 to arr1(i,15),arr1(i,16),arr1(i,17),arr1(i,18),arr1(i,19),arr1(i,20),arr1(i,21),arr1(i,22),arr1(i,23)
	    store 0 to arr1(i,24),arr1(i,25),arr1(i,26),arr1(i,27),arr1(i,29),arr1(i,30),arr1(i,31),arr1(i,32)
	    store 0 to arr1(i,33),sarr(i,1)
	    arr1(i,2)={}
	    store space(20) to arr1(i,8),arr1(i,9),arr1(i,10)	
	    arr1(i,28)=space(5)
   	ENDFOR
	COPY TO ARRAY arr1 FOR inv_no=minv_no 
ENDIF
i=1
FOR i =1 TO 999
	IF arr1(i,5)=0
	    store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,11),arr1(i,12),arr1(i,13),arr1(i,14)
	    store 0 to arr1(i,15),arr1(i,16),arr1(i,17),arr1(i,18),arr1(i,19),arr1(i,20),arr1(i,21),arr1(i,22),arr1(i,23)
	    store 0 to arr1(i,24),arr1(i,25),arr1(i,26),arr1(i,27),arr1(i,29),arr1(i,30),arr1(i,31),arr1(i,32)
	    store 0 to arr1(i,33),sarr(i,1)
	    arr1(i,2)={}
	    store space(20) to arr1(i,8),arr1(i,9),arr1(i,10)
	    arr1(i,28)=space(5)
	ENDIF
ENDFOR
@0.200,0.111 CLEAR TO 1.900,18
@1.800,10 SAY "Update  No. :" ;
	SIZE 1.000,16.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@1.800,30 GET arr1(1,1) ;
	SIZE 1.000,6.000 ;
	VALID  !EMPTY(arr1(1,1)) ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "999999" ;
	ERROR "Blank entry is not allowed" ;
	COLOR ,RGB(255,0,0,255,255,255)
@1.800,80 SAY "Update  Date :" ;
	SIZE 1.000,17.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@1.800,100 GET arr1(1,2) ;
	SIZE 1.000,12.000 ;
	VALID !EMPTY(arr1(1,2)) ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "@E" ;
	ERROR "Blank entry is not allowed" ;
	COLOR ,RGB(255,0,0,255,255,255)
DO vhead
@ 21.000,0.334 CLEAR TO 22.300,150.334
@ 21.00,0.334 TO 21.000,150.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
STORE 0 TO m.tamt,m.d_tamt,m.ntamt,m.tqty
D=1
DO WHILE arr1(D,5)#0
	  m.tamt=m.tamt+arr1(D,16)
	  m.tqty=m.tqty+arr1(d,11)
	D=D+1
ENDDO
@21.300,88 SAY "Total :" ;
	SIZE 1.000,8.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@21.300,98 GET m.tqty ;
	SIZE 1.000,8.500 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"	
@21.300,117 GET m.tamt ;
	SIZE 1.000,11.560 ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
sarr(1,1)=1
x=1
z=9
asno=x
@9,0 CLEAR TO 20,150
DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,4.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,6 GET arr1(x,7);
		SIZE 1.000,8.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "9999999" ;
		style "NT";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"		
	@z,18 GET arr1(x,8);
		SIZE 1.000,15.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR b_code=arr1(x,5)
	IF FOUND()
	    m.item=alltrim(item)+"-"+alltrim(brand)
		@z,35 GET m.item ;
			SIZE 1.000,33.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,67 GET arr1(x,9) ;
		SIZE 1.000,14.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,80 GET arr1(x,10) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,12) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,98 GET arr1(x,11) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"

	@z,107 GET arr1(x,26) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,117 GET arr1(x,16) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
		
	CLEA GETS
	IF arr1(x,5)=0
		IF x#10
			@z,0 CLEAR TO 20,145
			EXIT
			SELE B
			SET ORDER TO
			SET FILTER TO
		ENDIF
	ENDIF
	IF x=10
		EXIT
		SELE B
		SET ORDER TO
		SET FILTER TO
	ENDIF
	sarr(x,1)=x
	z=z+1
	x=x+1
	asno=asno+1
ENDDO
RETU

PROC vedit
SET DELE ON
trecno=0
STORE 0 TO m.etamt,m.ebalance,m.etpymt,m.dinv_no,m.dinvamt
m.dinv_dt={}
eflag=.F.
=ACOPY(arr1, earr1)
CLEA READ

PROCE vsave
STORE 0 TO nrecno
IF eflag=.F.
	DO editdel
ENDIF
if flock()
SELE D
use stock
SET ORDER TO
SET FILTER TO
D=1
DO WHILE arr1(D,5)#0
	APPE BLANK
	REPL bill_no WITH arr1(1,1),DATE WITH arr1(1,2),c_code WITH arr1(1,3)
	REPL i_code WITH arr1(D,4),b_code WITH arr1(D,5),pd_code WITH arr1(D,6),d_code with arr1(d,25)
	repl s_code with arr1(d,24),q_code with arr1(d,8),shade with arr1(d,9),size with arr1(d,10)
	REPL sh_code WITH arr1(D,7),stk_type with 8
	if arr1(d,11)>0
	   REPL receipt WITH arr1(D,11)
	else    
		REPL issuse WITH abs(arr1(D,11))
	endif	
	REPL particular WITH "Adjust. No."+SPACE(1)+ALLTRIM(STR(arr1(1,1),5))+SPACE(2)+"Date"+SPACE(1)+DTOC(arr1(1,2))
	D = D+1
ENDDO
SELE F
APPE FROM ARRAY arr1 FOR qty#0
SELE E
APPE BLANK
REPL inv_no WITH arr1(1,1),inv_dt WITH arr1(1,2)
REPL tamount WITH m.tamt,tqty WITH m.tqty
endif 
eflag=.t.
unlock all
RETU

PROC editdel
if flock()
SELE F
SET ORDER TO
SET FILTER TO
SET ORDER TO TAG inv_no
dele all FOR inv_no=earr1(1,1) AND inv_dt=earr1(1,2)
SELE E
SET ORDER TO
SET FILTER TO
SET ORDER TO TAG inv_no
dele for inv_no=earr1(1,1) AND inv_dt=earr1(1,2)
SELE D
use stock
SET FILTER TO
dele all for bill_no=earr1(1,1) AND DATE=earr1(1,2) and stk_type=8  
endif
unlock all
RETU

PROC vhead
@ 5.423,0.334 TO 8.123,150.134 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,0,0,0,)
@5.500,0.500 SAY "S." ;
	SIZE 1.000,2.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@6.800,0.500 SAY "No.";
	SIZE 1.000,3.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)	
@6.200,7.00 SAY "Barcode" ;
	SIZE 1.000,7.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)			
@6.200,17 SAY "Q.Code";
	SIZE 1.000,7.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@6.200,32 SAY "Item Description" ;
	SIZE 1.000,16.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@6.200,67 SAY "Shade" ;
	SIZE 1.000,5.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@6.200,77 SAY "Size" ;
	SIZE 1.000,4.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@6.200,87 SAY "M.R.P." ;
	SIZE 1.000,7.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)	
@6.200,99 SAY "Qty." ;
	SIZE 1.000,5.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@6.200,108 SAY "Rate" ;
	SIZE 1.000,5.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)	
@6.200,118 SAY "Amount";
	SIZE 1.000,7.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)	

@ 22.600,0.334 CLEAR TO 24.300,150.334
@ 22.600,0.334 TO 24.300,150.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@ 22.600,0.334 FILL TO 24.300,150.334 ;
	COLOR RGB(,,,255,255,128)
@22.600,1 SAY "msign2.bmp"BITMAP	;
	FONT "MS Sans Serif", 8 ;
	STYLE "NT" ;
	COLOR RGB(,,255,128,128,0)
@23.000,8 SAY "Message Bar "	;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(255,,0,128,128,0)	
RETU

PROCE vdel
ans5=0
DO message1 WITH ans5,"Delete this Adjustment Detail","yn","CHOICE WINDOW",18
IF ans5=1
	minv_no=inv_no
	minv_dt=inv_dt
	mc_code=c_code
	DO vdisp
	RETU
ENDIF
eflag=.f.   
=ACOPY(arr1, earr1)
do editdel

eflag=.T.
SELE E
SET FILTER TO
SET ORDER TO TAG inv_no
GO BOTT
minv_no=inv_no
minv_dt=inv_dt
mc_code=c_code
DO vdisp
RETU

PROC intarr
STORE SPACE(40) TO m.item,m.brand
m.q_code=SPACE(20)
STORE SPACE(10) TO m.size,m.shade
STORE 0 TO m.qty,m.rate,m.amount,m.d_per
	@j,6 GET m.qty;
		SIZE 1.000,8.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "9999999" ;
		style "NT";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"		
	@j,18 GET m.item;
		SIZE 1.000,15.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	@j,35 GET m.item ;
		SIZE 1.000,33.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@j,67 GET m.item ;
		SIZE 1.000,14.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@j,80 GET m.item ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@j,87 GET m.qty ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@j,98 GET m.qty ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@j,107 GET m.qty ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@j,117 GET m.qty ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	CLEA GETS

PROCE arrdel
D=0
x=0
z=0
D=K
A=0
m.inv_no=arr1(1,1)
m.inv_dt=arr1(1,2)
m.c_code=arr1(1,3)
DO WHILE arr1(D,5)#0
	arr1(D,1)=arr1(D+1,1)
	arr1(D,2)=arr1(D+1,2)
	arr1(D,3)=arr1(D+1,3)
	arr1(D,4)=arr1(D+1,4)
	arr1(D,5)=arr1(D+1,5)
	arr1(D,6)=arr1(D+1,6)
	arr1(D,7)=arr1(D+1,7)
	arr1(D,8)=arr1(D+1,8)
	arr1(D,9)=arr1(D+1,9)
	arr1(D,10)=arr1(D+1,10)
	arr1(D,11)=arr1(D+1,11)
	arr1(D,12)=arr1(D+1,12)
	arr1(D,13)=arr1(D+1,13)
	arr1(D,14)=arr1(D+1,14)
	arr1(D,15)=arr1(D+1,15)
	arr1(D,16)=arr1(D+1,16)
	arr1(D,17)=arr1(D+1,17)
	arr1(D,18)=arr1(D+1,18)
	arr1(D,19)=arr1(D+1,19)
	arr1(D,20)=arr1(D+1,20)
	arr1(D,21)=arr1(D+1,21)
	arr1(D,22)=arr1(D+1,22)
	arr1(D,23)=arr1(D+1,23)
	arr1(D,24)=arr1(D+1,24)
	arr1(D,25)=arr1(D+1,25)
	arr1(D,26)=arr1(D+1,26)	
	arr1(D,27)=arr1(D+1,27)		
	arr1(D,28)=arr1(D+1,28)			
	arr1(D,29)=arr1(D+1,29)
	arr1(D,30)=arr1(D+1,30)	
	arr1(D,31)=arr1(D+1,31)		
	arr1(D,32)=arr1(D+1,32)		
	arr1(D,33)=arr1(D+1,33)		
	D=D+1
ENDDO
FOR i=D TO 999
    store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,11),arr1(i,12),arr1(i,13),arr1(i,14)
    store 0 to arr1(i,15),arr1(i,16),arr1(i,17),arr1(i,18),arr1(i,19),arr1(i,20),arr1(i,21),arr1(i,22),arr1(i,23)
    store 0 to arr1(i,24),arr1(i,25),arr1(i,26),arr1(i,27),arr1(i,29),arr1(i,30),arr1(i,31),arr1(i,32)
    store 0 to arr1(i,33),sarr(i,1)
    arr1(i,2)={}
    store space(20) to arr1(i,8),arr1(i,9),arr1(i,10)		    
    arr1(i,28)=space(5)
ENDFOR
IF D>1
	sarr(D-1,1)=0
ENDIF
@j,0 CLEAR TO 19,160
z=j
sarr(1,1)=1
x=K
asno=K
DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,4.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,6 GET arr1(x,7);
		SIZE 1.000,8.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "9999999" ;
		style "NT";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"		
	@z,18 GET arr1(x,8);
		SIZE 1.000,15.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR b_code=arr1(x,5)
	IF FOUND()
	    m.item=alltrim(item)+"-"+alltrim(brand)
		@z,35 GET m.item ;
			SIZE 1.000,33.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,67 GET arr1(x,9) ;
		SIZE 1.000,14.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,80 GET arr1(x,10) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,12) ;
		SIZE 1.000,10.000 ;
		VALID !EMPTY(arr1(x,12)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,98 GET arr1(x,11) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"

	@z,107 GET arr1(x,26) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,117 GET arr1(x,16) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	CLEA GETS

	IF arr1(x,5)=0
		IF x#10
			@z,3 CLEAR TO 19,160
			EXIT
		ENDIF
	ENDIF
	IF A=10
		EXIT
	ENDIF
	z=z+1
	x=x+1
	A=A+1
	asno=asno+1
ENDDO
@ 21.000,0.334 CLEAR TO 22.300,150.334
@ 21.00,0.334 TO 21.000,150.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
STORE 0 TO m.tamt,m.d_tamt,m.ntamt,m.tqty
D=1
DO WHILE arr1(D,5)#0
	  m.tamt=m.tamt+arr1(D,16)
	  m.tqty=m.tqty+arr1(d,11)
	D=D+1
ENDDO
@21.300,88 SAY "Total :" ;
	SIZE 1.000,8.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@21.300,98 GET m.tqty ;
	SIZE 1.000,8.500 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"	
@21.300,117 GET m.tamt ;
	SIZE 1.000,11.560 ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
arr1(1,1)=m.inv_no
arr1(1,2)=m.inv_dt
arr1(1,3)=m.c_code
RETU

PROC addcust
SELE A
STORE SPACE(40) TO m.c_name,m.c_add1,m.c_add2
STORE SPACE(30) TO m.c_city,m.c_phno
@ 22.600,0.334 CLEAR TO 24.300,150.334
@ 22.600,0.334 TO 24.300,150.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@ 22.600,0.334 FILL TO 24.300,150.334 ;
	COLOR RGB(,,,255,255,128)
@22.900,5 SAY "Enter the customer name & address " ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
DEFINE WIND wqty FROM 5.500,16 TO 17.500,60 ;
	COLOR RGB(0,0,255,255,255,128)
ACTI WIND wqty
DO WHILE .T.
	@0.800,6 SAY "Name :" ;
		SIZE 1.000,7.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@0.800,15 GET m.c_name ;
		SIZE 1.000,25.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@2.800,4 SAY "Address  :" ;
		SIZE 1.000,10.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@2.800,15 GET m.c_add1 ;
		SIZE 1.000,25.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@4.000,15 GET m.c_add2 ;
		SIZE 1.000,25.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@5.800,6 SAY "City :" ;
		SIZE 1.000,7.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@5.800,15 GET m.c_city ;
		SIZE 1.000,15.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@7.800,6 SAY "Phone :" ;
		SIZE 1.000,7.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@7.800,15 GET m.c_phone ;
		SIZE 1.000,15.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	READ
	IF m.c_name#'  '
		EXIT
	ENDIF
ENDDO
DEAC WIND wqty
CALCU MAX(c_code) TO m.c_code
m.c_code=m.c_code+1
APPE BLANK
REPL c_name WITH m.c_name,c_add1 WITH m.c_add1,c_add2 WITH m.c_add2
REPL c_city WITH m.c_city,c_phno WITH m.c_phno,c_code WITH m.c_code
arr1(1,3)=m.c_code
RETU

proc dysale
DEFINE WINDOW dysale FROM 2.000,2 TO 8.200,25 ;
	TITLE "Daily Sales Screen" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	FLOAT ;
	CLOSE ;
	MINIMIZE ;
	COLOR RGB(0,0,255,255,255,255) ;
	in cvwind
acti wind dysale	
@1.800,0 GET m.dysale;
	SIZE 1.000,12.000;
	DEFAULT " " ;
	FONT "MS Sans Serif", 10 ;
	PICTURE "99999999.99" ;
	style "BT";
	COLOR ,RGB(0,0,128,255,255,255)	
CLEA GETS
wait " "
deac wind dysale

proce copdet
DEFINE WINDOW bswind;
AT  0.000,0.000;
SIZE 15.462,102.333;
TITLE "Discount Coupon Detail";
FONT "MS Sans Serif", 8;
STYLE "B";
FLOAT;
icon file icon5.ico;
MINIMIZE ;
COLOR RGB(0,0,255,255,255,255)
MOVE WINDOW bswind CENTER
acti wind bswind
sele g
set order to
set filter to
@0.500,3 SAY "Net Amount    :" ;
	SIZE 1.000,16.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@0.500,20 GET m.tvalue ;
	SIZE 1.000,10.000;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8;
	PICTURE "999999.99";
	ERROR "Blank entry is not allowed";
	COLOR ,RGB(255,0,0,255,255,255)	
clea gets
m.cpamt=int(m.tvalue/1000)*50	
@0.500,50 SAY "Coupon Amount  :" ;
	SIZE 1.000,17.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@.500,70 GET m.cpamt;
	SIZE 1.000,10.000;
	DEFAULT " ";
	FONT "MS Sans Serif", 8;
	PICTURE "999999.99";
	ERROR "Blank entry is not allowed";
	COLOR ,RGB(255,0,0,255,255,255)
clea gets	
DO cvhead
sno=1
sno1=1
j=5
K=1
p=1
a1=0
m.abcd=space(25)
do cndisp
DO WHILE j<=10.or.j>5
FOR a1 = 1 TO 1
  do while .t.
     d=1
     store 0 to m.cuamt
     do while d<=7
        m.cuamt=m.cuamt+cnarr(D,4)
        d=d+1        
     enddo
     z1=0
     if m.cpamt<m.cuamt
	    DO MESSAGE WITH z1,"Amont can't more then the","Discount Coupon amount  "+alltrim(str(m.cpamt,5)),"ERROR"
	 endif             
	@ 12.600,0.334 CLEAR TO 14.300,150.334
	@ 12.600,0.334 TO 14.300,150.334 ;
 	  PEN 1, 8 ;
	  STYLE "1" COLOR RGB(128,,,255,255,255)
	@ 12.600,0.334 FILL TO 14.300,150.334 ;
		COLOR RGB(,,,255,255,128)
	@12.900,1 SAY "<Up> <Down> arrow <Page Up> <Page Down> Move ,            Delete ,          Return ,           Stop Entry "	;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;		
		COLOR RGB(255,0,0,128,128,0)
	@12.900,52 SAY "<Alt+D>            <Esc>              <End>" ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		COLOR RGB(0,0,255,128,128,0)
	SET readborder OFF
	@j,2 GET sno PICT "9";
		SIZE 1.000,1.650 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "NT" ;
		COLOR ,RGB(0,0,255,255,255,255)
	ON KEY LABEL alt+D DO cndel
	READ
	ON KEY LABEL alt+D
	IF READKEY()=12 or readkey()=268
	   do acancle
	   IF flag3=.F.
		  flag9=.F.		  
		  EXIT
		ELSE
		  flag3=.T.
		ENDIF
	ENDIF
	IF sno#sno1
	   sno=sno1
	ELSE
		EXIT
	ENDIF
ENDDO
				IF flag3=.F.
					EXIT
				ENDIF
				flag=.T.
				IF READKEY()=3
					D=1
					sflag1=.T.
					DO WHILE cnarr(D,4)#0
						IF cnarr(D,4)=0
							IF D=csarr(D,1)
								z1=SPACE(1)
								DO MESSAGE WITH z1,"Blank entry is not allowed","At on S.No."+STR(D,2),"ERROR"
								DEAC WIND whelp,whead
								sflag1=.F.
								flag=.F.
								EXIT
							ENDIF
						ENDIF
						D=D+1
					ENDDO
					IF sflag1=.T.
						flag9=.F.
						j=10
						EXIT
					ENDIF
				ELSE
					flag9=.T.
				ENDIF
				IF flag=.F.
					a1=0
					flag=.T.
					LOOP
				ENDIF
				IF READKEY()=5
				   IF cnarr(K,4)#0
					  flag2=.F.
					  j=j+1
					  K=K+1
					  sno1=sno1+1
					  sno=sno+1
					  IF j<=10
							LOOP
						ELSE
							j=5
							LOOP
						ENDIF
					ENDIF
				ENDIF
				IF READKEY()=4
					IF K<=1
						WAIT WIND "First S.No."
						j=5
						K=2
						sno=2
						sno1=2
					ENDIF
					flag2=.F.
					j=j-1
					K=K-1
					sno1=sno1-1
					sno=sno-1
					IF j>=5
						LOOP
					ENDIF
				ENDIF
				FOR a2=1 TO 1				
					@ 12.600,0.334 CLEAR TO 14.300,150.334
					@ 12.600,0.334 TO 14.300,150.334 ;
						PEN 1, 8 ;
						STYLE "1" COLOR RGB(0,0,0,0,0,0)
					@ 12.600,0.334 FILL TO 14.300,150.334 ;
						COLOR RGB(,,,255,255,128)
					@12.900,10 SAY "Return at S.No.,Enter the coupon no. & amount";
						FONT "MS Sans Serif", 8 ;
						STYLE "BT" ;
						COLOR RGB(255,0,0,128,128,0)
					@12.900,3 SAY "<Esc>" ;
						FONT "MS Sans Serif", 8 ;
						STYLE "BT" ;
						COLOR RGB(0,0,255,128,128,0)
					@j,25.834 GET cnarr(k,3);
						SIZE 1.000,18.000;
						DEFAULT " ";
						FONT "MS Sans Serif", 8;
						PICTURE "@!";
						STYLE "NT" ;
						COLOR ,RGB(0,0,255,255,255,255)
				   @j,65.834 GET cnarr(k,4);
						SIZE 1.000,9.000;
						DEFAULT " ";
						FONT "MS Sans Serif", 8;
						PICTURE "99999.99";
						STYLE "NT";
						COLOR ,RGB(0,0,255,255,255,255)	  		
					read
					if readkey()=12 or readkey()=268 or cnarr(k,3)="   " or cnarr(k,4)=0
					   a4=0
					   loop
					endif
					j=j+1
					p=p+1
					cnarr(K,1)=arr1(1,1)
					cnarr(K,2)=arr1(1,2)
					csarr(K,1)=sno
					K=K+1
					sno=sno+1
					sno1=sno
					p=K
				ENDFOR &&a2
			ENDFOR &&a1
			IF K=6
				EXIT
			ENDIF
			IF flag9=.F.
				EXIT
			ENDIF
		ENDDO
		IF flag3=.F.
			deac wind bswind
			retu
		ENDIF
		ans6=0
		DO MESSAGE WITH ans6,"Save this Coupon detail","yn","SAVE WINDOW",17
		deac wind bswind
		retu
		
proc fentry1
cnarr(k,9)=op_code	
cnarr(k,10)=c_option
deac popup pcnopt
retu

proc fentry2
cnarr(k,4)=fee_code	
cnarr(k,5)=fee_name
deac popup pcnfee
retu

proce cndisp
for a=1 to 7
   store 0 to cnarr(a,1),cnarr(a,2),cnarr(a,4),csarr(a,1)
   cnarr(a,2)={}
   store space(15) to cnarr(a,3)
endfor	
sele g	
if eflag=.t.
	COPY TO ARRAY cnarr FOR inv_no=arr1(1,1)
else
	COPY TO ARRAY cnarr FOR inv_no=earr1(1,1)
endif	
x=1
z=5
asno=x
do while z<10
   @z,2 GET asno PICT "9";
		SIZE 1.000,1.650 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "NT" ;
		COLOR ,RGB(0,0,255,255,255,255)
   @z,25.834 GET cnarr(x,3);
		SIZE 1.000,18.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "@!";
		STYLE "NT" ;
		COLOR ,RGB(0,0,255,255,255,255)
   @z,65.834 GET cnarr(x,4);
		SIZE 1.000,9.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "99999.99";
		STYLE "NT";
		COLOR ,RGB(0,0,255,255,255,255)	  		
clea gets							
IF cnarr(x,4)=0
    EXIT
ENDIF
csarr(x,1)=x
z=z+1
x=x+1
asno=asno+1
ENDDO
RETU

proc cndel
   STORE 0 TO m.inv_no
   m.pd_dt={}
   STORE SPACE(20) TO m.ajname
   D=0
   x=0
   z=0
   D=K
   A=0
   m.inv_no=cnarr(1,1)
   m.po_dt=cnarr(1,2)
   m.ajname=cnarr(1,3)
   DO WHILE cnarr(D,4)#0
      cnarr(d,1)=cnarr(d+1,1)
      cnarr(d,2)=cnarr(d+1,2)
      cnarr(d,3)=cnarr(d+1,3)
      cnarr(D,4)=cnarr(d+1,4)
      D=D+1
  ENDDO
  FOR i=D TO 7
   store 0 to cnarr(d,1),cnarr(d,2),cnarr(d,4),csarr(d,1)
   cnarr(d,2)={}
   store space(15) to cnarr(d,3)
  ENDFOR
        IF D>1
            sarr(D-1,1)=0
        ENDIF
        @j,1 CLEAR TO 10,100
        z=j
        sarr(1,1)=K
        x=K
        asno=K
   DO WHILE z<19
   m.product=SPACE(40)
   @z,2 GET asno PICT "9";
		SIZE 1.000,1.650 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "NT" ;
		COLOR ,RGB(0,0,255,255,255,255)
   @z,25.834 GET cnarr(x,3);
		SIZE 1.000,18.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "@!";
		STYLE "NT" ;
		COLOR ,RGB(0,0,255,255,255,255)
   @z,65.834 GET cnarr(x,4);
		SIZE 1.000,9.000;
		DEFAULT " ";
		FONT "MS Sans Serif", 8;
		PICTURE "99999.99";
		STYLE "NT";
		COLOR ,RGB(0,0,255,255,255,255)	  		
  Clear GETS
  IF cnarr(x,4)=0
     IF x#10
        @z,1 CLEAR TO 10,104
        EXIT
     ENDIF
  ENDIF
  IF A=10
     EXIT
  ENDIF
  z=z+1
  x=x+1
  A=A+1
  asno=asno+1
ENDDO
cnarr(1,1)=m.inv_no
cnarr(1,2)=m.po_dt
RETU

PROC cvhead
@ 2.023,1.000 TO 3.823,100.134 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(0,0,0,0,0,0)
@2.500,1.00 SAY "S.No." ;
	SIZE 1.000,6.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(0,0,0,0,0,)
@2.500,25 SAY "Coupon No.";
	SIZE 1.000,11.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(0,0,0,0,0,)
@2.500,65 SAY "Amount";
	SIZE 1.000,9.67 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(0,0,0,0,0,)	
@ 12.600,0.334 CLEAR TO 14.300,150.334
@ 12.600,0.334 TO 14.300,150.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@ 12.600,0.334 FILL TO 14.300,150.334 ;
	COLOR RGB(,,,255,255,128)
@12.900,1 SAY "<Up> <Down> arrow <Page Up> <Page Down> Move ,            Delete ,          Return ,           Stop Entry "	;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
COLOR RGB(255,0,0,128,128,0)	
@12.900,52 SAY "<Alt+D>            <Esc>              <End>" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
RETU

PROCE acancle
ans5=0
DO MESSAGE WITH ans5,"Exit without save","yn","CHOICE WINDOW",18
IF ans5=1
	flag3=.F.
ENDIF
flag=.F.
RETU
