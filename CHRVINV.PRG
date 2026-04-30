PUBLIC mpinv_no,ms_code,mpinv_dt
CLOS ALL
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
store space(50) to m.cu_name,m.cu_add1,m.cu_add2,m.cu_phone,m.d_name
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
	SIZE 27.462,120.633;
	TITLE "Challan Receive Entry Screen" ;
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
		pflag=.t.
		stkflag=.t.
		ACTIVATE WINDOW cvwind
		@0,114.503 SAY "sc.bmp"BITMAP
		SELE B
		USE item
		SELE C
		USE stshade
		SELE D
		USE stock
		SELE E
		USE chrv_sum
		SELE F
		USE chrv_det
		sele g
		use chstock
		SELE F
		SCATTER MEMVAR BLANK		
		DIMEN earr1(999,15)
		DIMEN arr1(999,15)
		DIMEN sarr(999,1)	
		STORE 0 TO i,p,z,x,K,C,a1,a2,am,mamount,m.sc_btn,t,m.ac_btn,a3,a4
		STORE SPACE(40) TO m.mf_name,m.s_name,m.brand,m.item
		m.remark=space(80)
		STORE SPACE(3) TO mcrdr
		STORE SPACE(2) TO ans4,ans3
		FOR i = 1 TO 999
		    store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,9),arr1(i,10)
		    store 0 to arr1(i,11),arr1(i,14),arr1(i,15),sarr(i,1)
		    arr1(i,2)={}
		    store space(20) to arr1(i,8),arr1(i,12),arr1(i,13)
		    
		    store 0 to earr1(i,1),earr1(i,3),earr1(i,4),earr1(i,5),earr1(i,6),earr1(i,7),earr1(i,9),earr1(i,10)
		    store 0 to earr1(i,11),earr1(i,14),earr1(i,15)
		    earr1(i,2)={}
		    store space(20) to earr1(i,8),earr1(i,12),earr1(i,13)		    
		ENDFOR
		SELE F
		SET ORDER TO TAG rv_no
		DO chrvtool
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
					SET ORDER TO TAG rv_no
				    b=0
         			calcu max(rv_no) to b
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
				@23.000,14 SAY "Return  at Main Screen,Enter the Challan No.";
					FONT "MS Sans Serif", 8;
					STYLE "NT" ;
					COLOR RGB(,,255,128,128,0)		
				@2.500,7 SAY "Challan No:" ;
					SIZE 1.000,19.667 ;
					FONT "MS Sans Serif", 8 ;
					STYLE "BT" ;
					PICTURE "@J" ;
					COLOR RGB(,,,255,255,255)
				@2.500,30 GET arr1(1,1);
					SIZE 1.000,6.000 ;
					VALID  !EMPTY(arr1(1,1));
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
				DO MESSAGE WITH t1,"You Can't change the","Challan No. ","Message"
				arr1(1,1)=m.sgirno
				aa1=0
				loop
			endif							
			IF eflag=.F.
				IF arr1(1,1)#earr1(1,1)
					LOCA FOR rv_no=arr1(1,1) 
					IF FOUND()
						t1='  '
						DO MESSAGE WITH t1,"This Challan No. already exsit"," ","Message"
						aa1=0
						LOOP
					ENDIF
				ENDIF
			ENDIF
			IF eflag=.T. 
				LOCA FOR rv_no=arr1(1,1)
				IF FOUND()
					DO MESSAGE WITH a1,"This Challan No. already exsit"," ","Message"
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
				@23.000,14 SAY "Return at Challan No.,Enter the Challan Date";
					FONT "MS Sans Serif", 8;
					STYLE "NT" ;
					COLOR RGB(,,255,128,128,0)		
				@2.500,80 SAY "Challan Date.:" ;
					SIZE 1.000,17.667 ;
					FONT "MS Sans Serif", 8 ;
					STYLE "BT" ;
					PICTURE "@J" ;
					COLOR RGB(,,,255,255,255)
				@2.500,100 GET arr1(1,2);
					SIZE 1.000,12.000 ;
					VALID !EMPTY(arr1(1,2));
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
		DO vhead
		flname=space(8)
		flname=sys(3)
		sele g
		set order to tag sh_code
		total on sh_code to &flname field receipt,issuse
		use 
		use &flname		
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
@ 21.000,0.334 CLEAR TO 22.300,120.334
@ 21.00,0.334 TO 21.000,120.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
STORE 0 TO m.tamt,m.d_tamt,m.ntamt,m.tqty
D=1
DO WHILE arr1(D,15)#0
	  m.tamt=m.tamt+arr1(D,14)
	  m.tqty=m.tqty+arr1(d,9)
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
@21.300,107 GET m.tamt ;
	SIZE 1.000,11.560 ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
						SET readborder OFF
						@ j,1 GET sno PICT "9999";
							SIZE 1.000,5.000 ;
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
							IF arr1(D,7)=0 or arr1(d,9)=0 or arr1(d,10)=0 or arr1(d,15)=0
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
							DO WHILE arr1(D,15)#0
								arr1(D,1)=arr1(1,1)
								arr1(D,2)=arr1(1,2)
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
					   IF arr1(K,15)#0
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
						IF  arr1(K+10,15)=0
							LOOP
						ENDIF
						IF arr1(K+10,15)#0
							x=K+10
							IF x>999
								LOOP
							ENDIF
							sno=x
							sno1=x
							asno=x
							z=9
							DO WHILE z<19
	@z,1 GET asno ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,7 GET arr1(x,15);
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
	LOCA FOR b_code=arr1(x,6)
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
	@z,70 GET arr1(x,13) ;
		SIZE 1.000,6.000 ;
		VALID !EMPTY(arr1(x,13)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,78 GET arr1(x,12) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,9) ;
		SIZE 1.000,10.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	@z,98 GET arr1(x,10) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,108 GET arr1(x,14) ;
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
								IF arr1(x,15)=0
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
						DO WHILE z<19
	@z,1 GET asno ;
		SIZE 1.000,4.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,7 GET arr1(x,15);
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
	LOCA FOR b_code=arr1(x,6)
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
	@z,70 GET arr1(x,13) ;
		SIZE 1.000,6.000 ;
		VALID !EMPTY(arr1(x,13)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,78 GET arr1(x,12) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,9) ;
		SIZE 1.000,10.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	@z,98 GET arr1(x,10) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,108 GET arr1(x,14) ;
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
							IF arr1(x,15)=0
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
						@j,7 clea to j+1,15
						@j,7 GET arr1(k,15);
							SIZE 1.000,8.000;
							DEFAULT " ";
							FONT "MS Sans Serif", 8;
							PICTURE "9999999" ;
							style "NT";
							COLOR ,RGB(255,0,0,255,255,255);
							ERROR "Blank entry is not allowed"		
						READ				
						if readkey()=12 OR READKEY()=268 or arr1(k,15)=0
						   a1=0
						   loop
						endif				
						m.aunit=0
					    sele c
						loca for sh_code=arr1(k,15)
						if not found()
						   ans4r=0
						   DO MESSAGE WITH ans4r,"Barode does not exist"," ","SAVE WINDOW",17						     
						   a2=0
						   loop
						else	  							  
						  arr1(k,3)=d_code
						  arr1(k,4)=s_code
						  arr1(k,5)=i_code						
						  arr1(k,6)=b_code						
						  arr1(k,7)=pd_code												  
						  arr1(k,8)=q_code
						  arr1(k,13)=shade
						  arr1(k,12)=size
						  arr1(k,11)=m_r_p
						  arr1(k,10)=ex_rate						   
						endif	
						@j,18 clea to j+1,86
						@j,18 GET arr1(k,8);
							SIZE 1.000,15.000;
							DEFAULT " ";
							FONT "MS Sans Serif", 8;
							PICTURE "@!" ;
							COLOR ,RGB(255,0,0,255,255,255);
							ERROR "Blank entry is not allowed"
						SELE B
						SET ORDER TO
						SET FILTER TO
						LOCA FOR b_code=arr1(k,6)
						IF FOUND()
						    m.item=alltrim(item)+"-"+alltrim(brand)
							@j,35 GET m.item ;
								SIZE 1.000,33.000 ;
								DEFAULT " " ;
								FONT "MS Sans Serif", 8 ;
								PICTURE "@!" ;
								COLOR ,RGB(255,0,0,255,255,255)
							CLEA GETS
						ENDIF
						@j,70 GET arr1(k,13) ;
							SIZE 1.000,6.000 ;
							VALID !EMPTY(arr1(k,13)) ;
							DEFAULT " " ;
							FONT "MS Sans Serif", 8 ;
							PICTURE "@!" ;
							COLOR ,RGB(2550,0,0,255,255,255) ;
							ERROR "Blank entry is not allowed"
						@j,78 GET arr1(k,12) ;
							SIZE 1.000,8.000 ;
							DEFAULT " " ;
							FONT "MS Sans Serif", 8 ;
							PICTURE "@!" ;
							COLOR ,RGB(2550,0,0,255,255,255)
						@j,98 clea to j+1,107	
						@j,98 GET arr1(k,10) ;
							SIZE 1.000,8.500 ;
							DEFAULT " " ;
							FONT "MS Sans Serif", 8 ;
							PICTURE "9999.99" ;
							COLOR ,RGB(255,0,0,255,255,255) ;
							ERROR "Blank entry is not allowed"								
						clea gets	
							FOR a3= 1 TO 1	
								@ 22.600,0.334 CLEAR TO 24.300,150.334
								@ 22.600,0.334 TO 24.300,150.334 ;
									PEN 1, 8 ;
									STYLE "1" COLOR RGB(128,,,255,255,255)
								@ 22.600,0.334 FILL TO 24.300,150.334 ;
									COLOR RGB(,,,255,255,128)
								@22.900,14 SAY "Return  to Barcode,Enter the Qty";
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
								@j,87 GET arr1(k,9) ;
									SIZE 1.000,10.000 ;
									VALID !EMPTY(arr1(k,9)) ;
									DEFAULT " " ;
									FONT "MS Sans Serif", 8 ;
									PICTURE "99999.99" ;
									COLOR ,RGB(255,0,0,255,255,255) ;
									ERROR "Blank entry is not allowed"				
								READ
								IF READKEY()=12 OR READKEY()=268 or arr1(k,9)<=0 
								    a2=0
									LOOP
								ENDIF								
								sele g
								m.blqty=0
								loca for sh_code=arr1(k,15)
								if found()
								   m.blqty=receipt-issuse
								endif
								if arr1(k,9)>m.blqty
					   				t1='  '
									DO MESSAGE WITH t1,"Out of Stock","Balance Stock"+space(1)+alltrim(str(m.blqty)),"Message"
									a3=0
									loop
								endif				
								arr1(K,14)=arr1(K,9)*arr1(K,10)
								@j,108 clea to j+1,120
								@j,108 GET arr1(k,14) ;
									SIZE 1.000,11.000 ;
									DEFAULT " " ;
									FONT "MS Sans Serif", 8 ;
									PICTURE "999999.99" ;
									COLOR ,RGB(255,0,0,255,255,255) ;
									ERROR "Blank entry is not allowed"
								CLEA GETS
								j=j+1
								p=p+1
								IF j>C
									C=j
								ENDIF
								arr1(K,1)=arr1(1,1)
								arr1(K,2)=arr1(1,2)
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
				IF K=999
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
			
@ 21.000,0.334 CLEAR TO 22.300,120.334
@ 21.00,0.334 TO 21.000,120.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
STORE 0 TO m.tamt,m.d_tamt,m.ntamt,m.tqty
D=1
DO WHILE arr1(D,15)#0
	  m.tamt=m.tamt+arr1(D,14)
	  m.tqty=m.tqty+arr1(d,9)
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
@21.300,107 GET m.tamt ;
	SIZE 1.000,11.560 ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
		ans4=0
		SET EXACT ON
		DO MESSAGE WITH ans4,"Save this Challan","yn","SAVE WINDOW",17
		IF ans4 =1
		   DO vsave
		ENDIF
	ENDFOR
ENDDO
ON KEY LABEL f1
DEACTIVATE WIND cvwind


PROCE entry1
arr1(1,5)=d_code
m.d_code=d_code
m.d_name=ALLTRIM(d_name)
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
arr1(K,9)=pd_code
arr1(K,14)=SIZE
arr1(K,13)=m_r_p
arr1(K,19)=sh_code
arr1(k,12)=pur_rate
DEAC POPUP psize
RETU

PROC entry6
arr1(K,15)=shade
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

    PROCE entry7
        m.stfm_code=stfm_code
        m.st_form=alltrim(st_form)
        m.st_type=st_type
        IF m.st_type=1
            m.tax_type="VAT"
        ELSE
            m.tax_type="CST"
        ENDIF
        m.st_per=st_per
        Deac POPUP hform
        RETU	

PROC disparr
z=9
asno=x
DO WHILE z<19
	@z,1 GET asno ;
		SIZE 1.000,4.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,7 GET arr1(x,15);
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
	LOCA FOR b_code=arr1(x,6)
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
	@z,70 GET arr1(x,13) ;
		SIZE 1.000,6.000 ;
		VALID !EMPTY(arr1(x,13)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,78 GET arr1(x,12) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,9) ;
		SIZE 1.000,10.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	@z,98 GET arr1(x,10) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,108 GET arr1(x,14) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	CLEA GETS
	IF arr1(x,15)=0
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
SET ORDER TO TAG rv_no
IF eflag=.T.
	FOR i = 1 TO 999
	    store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,9),arr1(i,10)
	    store 0 to arr1(i,11),arr1(i,14),arr1(i,15),sarr(i,1)
	    arr1(i,2)={}
	    store space(20) to arr1(i,8),arr1(i,12),arr1(i,13)
   	ENDFOR
	COPY TO ARRAY arr1 FOR rv_no=minv_no
ENDIF
i=1
FOR i =1 TO 999
	IF arr1(i,5)=0
	    store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,9),arr1(i,10)
	    store 0 to arr1(i,11),arr1(i,14),arr1(i,15),sarr(i,1)
	    arr1(i,2)={}
	    store space(20) to arr1(i,8),arr1(i,12),arr1(i,13)
   	ENDIF
ENDFOR
@0.200,0.111 CLEAR TO 1.900,18
@2.500,7 SAY "Challan No:" ;
	SIZE 1.000,19.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@2.500,30 GET arr1(1,1);
	SIZE 1.000,6.000 ;
	VALID  !EMPTY(arr1(1,1));
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "999999" ;
	ERROR "Blank entry is not allowed" ;
	COLOR ,RGB(255,0,0,255,255,255)
@2.500,80 SAY "Challan Date.:" ;
	SIZE 1.000,17.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@2.500,100 GET arr1(1,2);
	SIZE 1.000,12.000 ;
	VALID !EMPTY(arr1(1,24));
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "@E" ;
	ERROR "Blank entry is not allowed" ;
	COLOR ,RGB(255,0,0,255,255,255)
CLEA GET	
DO vhead
@ 21.000,0.334 CLEAR TO 22.300,120.334
@ 21.00,0.334 TO 21.000,120.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
STORE 0 TO m.tamt,m.d_tamt,m.ntamt,m.tqty
D=1
DO WHILE arr1(D,15)#0
	  m.tamt=m.tamt+arr1(D,14)
	  m.tqty=m.tqty+arr1(d,9)
	D=D+1
ENDDO
@21.300,67 SAY "Total :" ;
	SIZE 1.000,8.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@21.300,87 GET m.tqty ;
	SIZE 1.000,8.500 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"	
@21.300,107 GET m.tamt ;
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
	@z,1 GET asno ;
		SIZE 1.000,4.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,7 GET arr1(x,15);
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
	LOCA FOR b_code=arr1(x,6)
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
	@z,70 GET arr1(x,13) ;
		SIZE 1.000,6.000 ;
		VALID !EMPTY(arr1(x,13)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,78 GET arr1(x,12) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,9) ;
		SIZE 1.000,10.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	@z,98 GET arr1(x,10) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,108 GET arr1(x,14) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	CLEA GETS
	IF arr1(x,15)=0
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

PROC dvedit
SET DELE ON
trecno=0
dflag=.F.
=ACOPY(arr1, earr1)
STORE 0 TO m.etamt,m.ebalance,m.etpymt,m.dinv_no,m.dinvamt
m.dinv_dt={}
SELE E
LOCA FOR inv_no=minv_no AND inv_dt=minv_dt AND c_code=mc_code
IF FOUND()
	m.tamt=tamt
	m.balance=balance
	m.tpymt=tpymt
	m.etamt=tamt
	m.ebalance=balance
	m.etpymt=tpymt
	m.dinv_no=inv_no
	m.dinv_dt=inv_dt
	m.dinvamt=gtotal	
	m.disc_amt=disc_amt
ENDIF
CLEA READ

PROCE vsave
STORE 0 TO nrecno
IF eflag=.F.
	DO editdel
ENDIF
if flock()
SELE D
SET ORDER TO
SET FILTER TO
use stock
D=1
DO WHILE arr1(D,15)#0
	APPE BLANK
	REPL bill_no WITH arr1(1,1),DATE WITH arr1(1,2),d_code WITH arr1(1,3)
	REPL i_code WITH arr1(D,5),b_code WITH arr1(D,6),pd_code WITH arr1(D,7),s_code with arr1(d,4)
	repl q_code with arr1(d,8),shade with arr1(d,13),size with arr1(d,12)
	REPL sh_code WITH arr1(D,15),stk_type with 7
    REPL receipt WITH arr1(D,9)
	REPL particular WITH "Challan Receive No."+SPACE(1)+ALLTRIM(STR(arr1(1,1),5))+SPACE(2)+"Date"+SPACE(1)+DTOC(arr1(1,2))
	D = D+1
ENDDO
SELE g
use chstock
SET ORDER TO
SET FILTER TO
D=1
DO WHILE arr1(D,15)#0
	APPE BLANK
	REPL bill_no WITH arr1(1,1),DATE WITH arr1(1,2),d_code WITH arr1(1,3)
	REPL i_code WITH arr1(D,5),b_code WITH arr1(D,6),pd_code WITH arr1(D,7),s_code with arr1(d,4)
	repl q_code with arr1(d,8),shade with arr1(d,13),size with arr1(d,12)
	REPL sh_code WITH arr1(D,15),stk_type with 2
    REPL issuse WITH arr1(D,9)
	REPL particular WITH "Challan Receive No."+SPACE(1)+ALLTRIM(STR(arr1(1,1),5))+SPACE(2)+"Date"+SPACE(1)+DTOC(arr1(1,2))
	D = D+1
ENDDO
SELE F
APPE FROM ARRAY arr1 FOR qty#0
SELE E
APPE BLANK
repl rv_no with arr1(1,1),rv_dt with arr1(1,2),tqty WITH m.tqty
repl tamount WITH m.tamt
endif 
eflag=.t.
unlock all
RETU

PROC editdel
if flock()
SELE F
SET ORDER TO
SET FILTER TO
SET ORDER TO TAG rv_no
dele all  FOR rv_no=earr1(1,1) AND rv_dt=earr1(1,2)
SELE E
SET ORDER TO
SET FILTER TO
SET ORDER TO TAG rv_no
dele  FOR rv_no=earr1(1,1) AND rv_dt=earr1(1,2)
SELE D
use stock
SET FILTER TO
dele all for bill_no=earr1(1,1) AND DATE=earr1(1,2) and stk_type=7 and receipt#0
SELE g
use chstock

dele all for bill_no=earr1(1,1) AND DATE=earr1(1,2) and stk_type=2 and issuse#0
endif
unlock all
RETU

PROC vhead
@ 7.523,0.334 TO 9.000,120.134 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,0,0,0,)
@7.600,0.500 SAY "S.No." ;
	SIZE 1.000,4.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@7.600,7.00 SAY "Barcode" ;
	SIZE 1.000,7.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)			
@7.600,18 SAY "Q.Code";
	SIZE 1.000,7.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@7.600,32 SAY "Item Description" ;
	SIZE 1.000,16.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@7.600,69 SAY "Shade" ;
	SIZE 1.000,5.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@7.600,77 SAY "Size" ;
	SIZE 1.000,4.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@7.600,87 SAY "Qty." ;
	SIZE 1.000,7.067 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)	
@7.600,99 SAY "Rate" ;
	SIZE 1.000,5.067 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@7.600,108 SAY "Amount" ;
	SIZE 1.000,7.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)		
@ 22.600,0.334 CLEAR TO 24.300,120.334
@ 22.600,0.334 TO 24.300,120.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@ 22.600,0.334 FILL TO 24.300,120.334 ;
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
DO message1 WITH ans5,"Delete this Challan ","yn","CHOICE WINDOW",18
IF ans5=1
	minv_no=rv_no
	minv_dt=rv_dt
	DO vdisp
	RETU
ENDIF
if flock()
SELE F
dele all FOR rv_no=arr1(1,1) AND rv_dt=arr1(1,2)
SELE E
dele for rv_no=arr1(1,1) AND rv_dt=arr1(1,2) 
SELE D
SET FILTER TO
dele all for bill_no=arr1(1,1) AND DATE = arr1(1,2) AND stk_type=7 and receipt#0
SELE g
use chstock
SET FILTER TO
dele all for bill_no=arr1(1,1) AND DATE = arr1(1,2) AND stk_type=2 and issuse#0
endif
unlock all
eflag=.T.
SELE E
SET FILTER TO
SET ORDER TO TAG rv_no
GO BOTT
minv_no=rv_no
minv_dt=rv_dt
DO vdisp
RETU

PROC intarr
STORE SPACE(40) TO m.item,m.brand
m.q_code=SPACE(20)
STORE SPACE(10) TO m.size,m.shade
STORE 0 TO m.qty,m.rate,m.amount,m.d_per
	@j,7 GET m.qty;
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
	@j,70 GET m.item ;
		SIZE 1.000,6.000 ;
		VALID !EMPTY(arr1(x,15)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@j,78 GET m.item ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@j,87 GET m.qty ;
		SIZE 1.000,10.000 ;
		VALID !EMPTY(arr1(x,12)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	@j,98 GET m.qty ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@j,108 GET m.qty ;
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
DO WHILE arr1(D,6)#0
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
	D=D+1
ENDDO
FOR i=D TO 999
    store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,9),arr1(i,10)
    store 0 to arr1(i,11),arr1(i,14),arr1(i,15),sarr(i,1)
    arr1(i,2)={}
    store space(20) to arr1(i,8),arr1(i,12),arr1(i,13)
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
	@z,1 GET asno ;
		SIZE 1.000,4.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@z,7 GET arr1(x,15);
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
	LOCA FOR b_code=arr1(x,6)
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
	@z,70 GET arr1(x,13) ;
		SIZE 1.000,6.000 ;
		VALID !EMPTY(arr1(x,13)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,78 GET arr1(x,12) ;
		SIZE 1.000,8.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(2550,0,0,255,255,255)
	@z,87 GET arr1(x,9) ;
		SIZE 1.000,10.000 ;
		VALID !EMPTY(arr1(x,9)) ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"				
	@z,98 GET arr1(x,10) ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	@z,108 GET arr1(x,14) ;
		SIZE 1.000,11.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	CLEA GETS
	IF arr1(x,10)=0
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
@ 21.000,0.334 CLEAR TO 22.300,120.334
@ 21.00,0.334 TO 21.000,120.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
STORE 0 TO m.tamt,m.d_tamt,m.ntamt,m.tqty
D=1
DO WHILE arr1(D,15)#0
	  m.tamt=m.tamt+arr1(D,14)
	  m.tqty=m.tqty+arr1(d,9)
	D=D+1
ENDDO
@21.300,67 SAY "Total :" ;
	SIZE 1.000,8.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@21.300,87 GET m.tqty ;
	SIZE 1.000,8.500 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"	
@21.300,107 GET m.tamt ;
	SIZE 1.000,11.560 ;
	FONT "MS Sans Serif", 9;
	PICTURE "9999999.99" ;
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
arr1(1,1)=m.inv_no
arr1(1,2)=m.inv_dt
RETU


PROCE acancle
ans5=0
DO MESSAGE WITH ans5,"Exit without save","yn","CHOICE WINDOW",18
IF ans5=1
	flag3=.F.
ENDIF
flag=.F.
RETU
