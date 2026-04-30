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
store space(50) to mc_name,mc_name1
STORE SPACE(10) TO m.brand,m.size,m.colour,m.sman_int
STORE SPACE(20) TO m.style,mch_no,m.ch_no,m.c_phno
STORE SPACE(20) TO m.cc_no,m.cc_no1,m.vd_inv,m.bk_Name,m.bk_Name1
STORE SPACE(40) TO m.product,m.c_name,m.c_add1,m.c_add2,m.c_city, m.py_det,m.py_det1,m.pymt
STORE 0 TO m.qty,m.es_code,m.b_code,m.sh_code,m.b_code,m.i_code,minv_no,m.inv_no,m.ashd_code
STORE 0 TO mk,m.sp_code,mc_code,m.esp_code,m.c_code,m.t_tamt,m.p_tamt,m.e_tamt,m.tpymt
STORE 0 TO m.tamt,m.payment,m.balance,m.d_tamt,m.tvalue,m.roundoff,m.mpy,m.epy_code,m.ecp_code
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
	SIZE 27.462,104.633;
	TITLE "Alteration Entry Screen";
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
		ACTIVATE WINDOW cvwind
		@0,96.503 SAY "sc.bmp"BITMAP
		SELE A
		USE sub_hd
		set order to TAG shd_name
		set order to TAG shd_code
		SELE B
		USE rditem
		set order to TAG i_code
		set order to TAG i_name
		sele c
		use itemdt
		sele d
		use orderdet
		SELE E
		USE od_sum
		set order to TAG order_no
		SELE F
		USE order
		set order to TAG order_no		
		sele g
		use prnorder
		sele h
		use customer
		sele i
		use sale_sum
		SELE F
		SCATTER MEMVAR BLANK		
		DIMEN earr1(10,86)
		DIMEN arr1(10,86)
		DIMEN szarr(1,86)
		DIMEN sarr(10,1)	
		STORE 0 TO i,p,z,x,K,C,a1,a2,am,mamount,m.sc_btn,t,m.ac_btn,a3,a4
		store 0 to m.cm_no,m.cm_bal
		STORE SPACE(40) TO m.mf_name,m.s_name,m.brand,m.item
		STORE SPACE(3) TO mcrdr
		STORE SPACE(2) TO ans4,ans3
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
			store 0 to arr1(i,68),arr1(i,69),arr1(i,70),arr1(i,71),arr1(i,72),arr1(i,73),arr1(i,75),arr1(i,85)
			store 0 to arr1(i,76),arr1(i,77),arr1(i,78),arr1(i,79),arr1(i,81),arr1(i,82),arr1(i,83),arr1(i,84),arr1(i,86)
            arr1(i,80)=space(50)
            arr1(i,74)=SPACE(10)
			arr1(i,67)=space(8)
			
            store 0 to earr1(i,1),earr1(i,3),earr1(i,4),earr1(i,5),earr1(i,6),earr1(i,7),earr1(i,10),earr1(i,11)
            store 0 to earr1(i,12),earr1(i,13),earr1(i,14),earr1(i,15),earr1(i,16),earr1(i,17),earr1(i,31)
            store 0 to earr1(i,35)            
            store space(6) to earr1(i,18),earr1(i,19),earr1(i,20),earr1(i,21),earr1(i,22),earr1(i,23)            
			store space(6) to earr1(i,24),earr1(i,25),earr1(i,26),earr1(i,27),earr1(i,28),earr1(i,29)
			store space(6) to earr1(i,30)
			earr1(i,32)=space(40)
            earr1(i,2)={}
            earr1(i,8)={}
            earr1(i,9)={}
            earr1(i,33)={}
            earr1(i,34)={}
            store space(6) to earr1(i,36),earr1(i,37),earr1(i,38),earr1(i,39),earr1(i,40),earr1(i,41)
			store space(6) to earr1(i,42),earr1(i,43),earr1(i,44),earr1(i,45),earr1(i,46),earr1(i,47)
			store space(6) to earr1(i,48)            
			
			store 0 to earr1(i,49),earr1(i,50),earr1(i,51),earr1(i,52),earr1(i,53),earr1(i,54),earr1(i,55),earr1(i,56),earr1(i,57)
			store 0 to earr1(i,58),earr1(i,59),earr1(i,60),earr1(i,61),earr1(i,62),earr1(i,63),earr1(i,64),earr1(i,65),earr1(i,66)
			store 0 to earr1(i,68),earr1(i,69),earr1(i,70),earr1(i,71),earr1(i,72),earr1(i,73),earr1(i,75),earr1(i,85)
			store 0 to earr1(i,76),earr1(i,77),earr1(i,78),earr1(i,79),earr1(i,81),earr1(i,82),earr1(i,83),earr1(i,83),earr1(i,84),earr1(i,86)
			earr1(i,80)=space(50)
			earr1(i,74)=space(10)
			arr1(i,67)=space(8)			
		ENDFOR
		SELE F
		SET ORDER TO TAG order_no
		DO alodtool
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
			minv_no=0
			SELE E
			set order to
			set filter to
			SET ORDER TO TAG order_no
			IF eflag=.T.
				nrec=0
			    b=0
         		calcu max(order_no) to b
				GO BOTT
				m.inv_no=b
				minv_no=b
				arr1(1,1)=b+1
			ENDIF
			IF eflag=.F.
				minv_no=earr1(1,1)
				arr1(1,1)=earr1(1,1)
				arr1(1,2)=earr1(1,2)
			ENDIF
			@ 22.600,0.334 CLEAR TO 24.300,100.334
			@ 22.600,0.334 TO 24.300,100.334 ;
				PEN 1, 8 ;
				STYLE "1" COLOR RGB(128,,,255,255,255)
			@ 22.600,0.334 FILL TO 24.300,100.334 ;
				COLOR RGB(,,,255,255,128)
			@22.900,3 SAY "<Esc>" ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				COLOR RGB(255,0,0,128,128,0)								
			@22.900,10 SAY "Return, Enter the Order No." ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				COLOR RGB(,,255,128,128,0)
		@1.800,3 SAY "Order No. :" ;
			SIZE 1.000,16.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@1.800,20 GET arr1(1,1) ;
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
			IF eflag=.F.
			   IF arr1(1,1)#earr1(1,1)
				  LOCA FOR order_no=arr1(1,1)
				  IF FOUND()
					 t1='  '
					 DO MESSAGE WITH t1,"This Order No. already exsit."," ","Message"
					 aa1=0
					 LOOP
				  ENDIF
			   ENDIF
			ENDIF
			IF eflag=.T.
				LOCA FOR order_no=arr1(1,1)
				IF FOUND()
				    z1="   "
					DO MESSAGE WITH z1,"This Order No. already exsit."," ","Message"
					aa1=0
					LOOP
				ENDIF
			ENDIF						
		FOR aa2 = 1 TO 1			
			IF eflag=.T.
				arr1(1,2)=DATE()
			ENDIF			
			@ 22.600,0.334 CLEAR TO 24.300,100.334
			@ 22.600,0.334 TO 24.300,100.334;
				PEN 1, 8 ;
				STYLE "1" COLOR RGB(128,,,255,255,255)
			@ 22.600,0.334 FILL TO 24.300,100.334 ;
				COLOR RGB(,,,255,255,128)
			@22.900,3 SAY "<Esc>" ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				COLOR RGB(255,0,0,128,128,0)				
			@22.900,10 SAY "Return at order no., Enter the order date" ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				COLOR RGB(,,255,128,128,0)
			@1.800,50 SAY "Order Date :" ;
				SIZE 1.000,17.667 ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				PICTURE "@J" ;
				COLOR RGB(,,,255,255,255)
			@1.800,70 GET arr1(1,2) ;
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
			ENDIF
		ENDFOR &&aa2
		ENDFOR &&aa1				
		IF fexit=.F.
			AT=0
			LOOP
		ENDIF
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
						@ 22.600,0.334 CLEAR TO 24.300,100.334
						@ 22.600,0.334 TO 24.300,100.334 ;
							PEN 1, 8 ;
							STYLE "1" COLOR RGB(128,,,255,255,255)
						@ 22.600,0.334 FILL TO 24.300,100.334 ;
							COLOR RGB(,,,255,255,128)
						@22.900,1 SAY "<Up> <Down> arrow <Page Up> <Page Down> Move ,            Delete ,          Return ,           Stop Entry "	;
							FONT "MS Sans Serif", 8 ;
							STYLE "BT" ;
							COLOR RGB(,,255,128,128,0)
						@22.900,52 SAY "<Alt+D>            <Esc>              <End>" ;
							FONT "MS Sans Serif", 8 ;
							STYLE "BT" ;
							COLOR RGB(255,0,0,128,128,0)
@21,0.2 clea to 22.4,105
@ 21.00,0.434 TO 21.000,102.134 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(0,0,0,0,0,0,)
@21.300,10 SAY "Total";
	SIZE 1.000,4.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,128,255,255,255)
STORE 0 TO m.tamt,m.tqty
D=1
DO WHILE arr1(D,4)#0
   m.tamt=m.tamt+arr1(D,7)
   m.tqty=m.tqty+arr1(d,5)
   d=D+1
ENDDO
@21.300,26 GET m.tqty;
	SIZE 1.000,5.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "9999" ;
	style "BT";
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
@21.300,42 GET m.tamt ;
	SIZE 1.000,10.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "999999.99";
	style "BT";
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
						SET readborder OFF
						@ j,2 GET sno PICT "99";
							SIZE 1.000,2.500 ;
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
							IF arr1(D,4)=0
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
							DO WHILE arr1(D,4)#0
								arr1(D,3)=arr1(1,3)
								arr1(D,1)=arr1(1,1)
								arr1(D,2)=arr1(1,2)								
								arr1(D,8)=arr1(1,8)
								arr1(D,9)=arr1(1,9)
								arr1(D,33)=arr1(1,33)
								arr1(D,34)=arr1(1,34)
								arr1(D,86)=2
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
						IF  arr1(K+5,5)=0
							LOOP
						ENDIF
						IF arr1(K+5,5)#0
							x=K+5
							IF x>20
								LOOP
							ENDIF
							sno=x
							sno1=x
							asno=x
							z=9
							DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,2.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99" ;
		COLOR ,RGB(255,0,0,255,255,255)
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR i_code=arr1(x,4)
	IF FOUND()
		m.item=i_name
		@z,8 GET m.item ;
			SIZE 1.000,15.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,26 GET arr1(x,5) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,33 GET arr1(x,6) ;
		SIZE 1.000,9.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,42 GET arr1(x,7) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	@z,55 GET arr1(x,31) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,65 GET arr1(x,32) ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	CLEA GETS
								z=z+1
								sno=sno+1
								sno1=sno1+1
								x=x+1
								asno=asno+1
								IF arr1(x,4)=0
									@z,1 CLEAR TO 21,111
									EXIT
								ENDIF
							ENDDO
							j=9
							sno=K+5
							sno1=K+5
							K=K+5
							LOOP
						ENDIF
					ENDIF
					IF READKEY()=6
						x=K-5
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
	@z,2 GET asno ;
		SIZE 1.000,2.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99" ;
		COLOR ,RGB(255,0,0,255,255,255)
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR i_code=arr1(x,4)
	IF FOUND()
		m.item=i_name
		@z,8 GET m.item ;
			SIZE 1.000,15.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,26 GET arr1(x,5) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,33 GET arr1(x,6) ;
		SIZE 1.000,9.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,42 GET arr1(x,7) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	@z,55 GET arr1(x,31) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,65 GET arr1(x,32) ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	CLEA GETS
							z=z+1
							sno=sno+1
							sno1=sno1+1
							asno=asno+1
							x=x+1
							IF arr1(x,4)=0
								@z,1 CLEAR TO 21,111
								EXIT
							ENDIF
						ENDDO
						j=9
						IF K-5<1
							sno=1
							sno1=1
							K=1
						ELSE
							sno=K-5
							sno1=K-5
							K=K-5
						ENDIF
						LOOP
					ENDIF			
		FOR a2=1 TO 1
			@ 22.600,0.334 CLEAR TO 24.300,100.334
			@ 22.600,0.334 TO 24.300,100.334;
				PEN 1, 8;
				STYLE "1" COLOR RGB(128,,,255,255,255)
			@ 22.600,0.334 FILL TO 24.300,100.334;
				COLOR RGB(,,,255,255,128)
			@22.900,10 SAY "Return at S.No.,Select the Item";
				FONT "MS Sans Serif", 8;
				STYLE "BT" ;
				COLOR RGB(,,255,128,128,0)
			@22.900,3 SAY "<Esc>" ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				COLOR RGB(255,0,0,128,128,0)
			sele b
			set order to tag 
			set order to tag i_name		
			DEFINE POPUP pshade FROM 9,50 TO 22,80 PROMPT FIELD ALLTRIM(i_name);
			SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Item"
			ON SELECTION POPUP pshade DO entry6
			ACTI POPUP pshade
			@J,8 GET m.item ;
				SIZE 1.000,15.000 ;
				DEFAULT " " ;
				FONT "MS Sans Serif", 8 ;
				PICTURE "@!" ;
				COLOR ,RGB(255,0,0,255,255,255)
			CLEA GETS
			IF arr1(K,4)=0
				m.item=SPACE(40)
				a1=0
				LOOP
			ENDIF
			FOR a3= 1 TO 1
				@ 22.600,0.334 CLEAR TO 24.300,100.334
				@ 22.600,0.334 TO 24.300,100.334 ;
					PEN 1, 8 ;
					STYLE "1" COLOR RGB(128,,,255,255,255)
				@ 22.600,0.334 FILL TO 24.300,100.334 ;
					COLOR RGB(,,,255,255,128)
				@22.900,10 SAY "Return at Item Selection,Enter the qty.,rate.";
					FONT "MS Sans Serif", 8 ;
					STYLE "BT" ;
					COLOR RGB(,,255,128,128,0)
				@22.900,3 SAY "<Esc>" ;
					FONT "MS Sans Serif", 8 ;
					STYLE "BT" ;
					COLOR RGB(255,0,0,128,128,0)
				@J,26 GET arr1(K,5) ;
					SIZE 1.000,5.000 ;
					DEFAULT " " ;
					FONT "MS Sans Serif", 8 ;
					PICTURE "9999" ;
					COLOR ,RGB(2550,0,0,255,255,255) ;
					ERROR "Blank entry is not allowed"
				@J,33 GET arr1(K,6) ;
		SIZE 1.000,9.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
				read
				if readkey()=12 or readkey()=268 or arr1(k,5)=0
				   arr1(K,4)=0
				   a2=0
				   loop
				endif   	
			FOR a4= 1 TO 1
			    arr1(k,7)=arr1(k,5)*arr1(k,6)
				@j,42 GET arr1(k,7) ;
					SIZE 1.000,10.000 ;
					DEFAULT " " ;
					FONT "MS Sans Serif", 8 ;
					PICTURE "999999.99";
					COLOR ,RGB(255,0,0,255,255,255);
					ERROR "Blank entry is not allowed"
				clea gets	
*!*					@ 22.600,0.334 CLEAR TO 24.300,100.334
*!*					@ 22.600,0.334 TO 24.300,100.334 ;
*!*						PEN 1, 8 ;
*!*						STYLE "1" COLOR RGB(128,,,255,255,255)
*!*					@ 22.600,0.334 FILL TO 24.300,100.334 ;
*!*						COLOR RGB(,,,255,255,128)
*!*					@22.900,10 SAY "Return at Qty.,rate,Enter the fabric return";
*!*						FONT "MS Sans Serif", 8 ;
*!*						STYLE "BT" ;
*!*						COLOR RGB(,,255,128,128,0)
*!*					@22.900,3 SAY "<Esc>" ;
*!*						FONT "MS Sans Serif", 8 ;
*!*						STYLE "BT" ;
*!*						COLOR RGB(255,0,0,128,128,0)
*!*					@j,55 GET arr1(k,31);
*!*						SIZE 1.000,5.000 ;
*!*						DEFAULT " " ;
*!*						FONT "MS Sans Serif", 8 ;
*!*						PICTURE "9999" ;
*!*						COLOR ,RGB(2550,0,0,255,255,255) ;
*!*						ERROR "Blank entry is not allowed"
*!*					read
*!*					if readkey()=12 or readkey()=268
*!*					   a3=0
*!*					   loop
*!*					endif
*!*					DO DSIZE   					
					j=j+1
					p=p+1
					IF j>C
						C=j
					ENDIF
					arr1(K,1)=arr1(1,1)
					arr1(K,2)=arr1(1,2)
					arr1(K,3)=arr1(1,3)
					sarr(K,1)=sno
					K=K+1
					sno=sno+1
					sno1=sno
					p=K
					IF j>=19
						x=K-5
						DO disparr
						j=19
						DO intarr
					ENDIF
					ENDFOR &&a4
					ENDFOR &&a3
					ENDFOR &&a2
				ENDFOR &&a1
				IF K=12
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
@21,0.2 clea to 22.4,105
@ 21.00,0.434 TO 21.000,102.134 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(0,0,0,0,0,0,)
@21.300,10 SAY "Total";
	SIZE 1.000,4.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,128,255,255,255)
STORE 0 TO m.tamt,m.tqty
D=1
DO WHILE arr1(D,4)#0
   m.tamt=m.tamt+arr1(D,7)
   m.tqty=m.tqty+arr1(d,5)
   d=D+1
ENDDO
@21.300,26 GET m.tqty;
	SIZE 1.000,5.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "9999" ;
	style "BT";
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
@21.300,42 GET m.tamt ;
	SIZE 1.000,10.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "999999.99";
	style "BT";
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
 
DEFINE WINDOW atotal FROM 2.000,2 TO 26.200,58 ;
	TITLE "Order No."+space(2)+alltrim(str(arr1(1,1)));
	FONT "MS Sans Serif", 8;
	STYLE "B" ;
	FLOAT ;
	CLOSE ;
	MINIMIZE ;
	COLOR RGB(0,0,255,255,255,255) ;
	in cvwind
	m.shd_Name=space(40)
	m.choice=0	
	DO WHILE .T.
	  if eflag=.t.
	     store 0 to m.cm_no,m.cm_bal
	  endif   
 	ACTI WIND atotal
		@0.500,5 SAY "Amount:" ;
			SIZE 1.000,12.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@0.500,20 GET m.tamt ;
			SIZE 1.000,11.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "9999999.99" ;
			COLOR ,RGB(255,0,0,255,255,255)
		clea gets	  
		@2.500,5 SAY "Trial Date:" ;
			SIZE 1.000,12.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@2.500,20 GET arr1(1,8) ;
			SIZE 1.000,12.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@E" ;
			COLOR ,RGB(255,0,0,255,255,255)			
		@4.500,5 SAY "Del. Date:" ;
			SIZE 1.000,12.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@4.500,20 GET arr1(1,9) ;
			SIZE 1.000,12.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@E" ;
			COLOR ,RGB(255,0,0,255,255,255)						
		read		
		@6.500,4 SAY "Our Trial Date:" ;
			SIZE 1.000,13.867 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		if arr1(1,8)#{}	
			arr1(1,33)=arr1(1,8)-1	
		endif	
		arr1(34)=arr1(1,9)-1		
		@6.500,20 GET arr1(1,33) ;
			SIZE 1.000,12.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@E" ;
			COLOR ,RGB(255,0,0,255,255,255)			
		@8.500,4 SAY "Our Del. Date:" ;
			SIZE 1.000,13.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@8.500,20 GET arr1(1,34) ;
			SIZE 1.000,12.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@E" ;
			COLOR ,RGB(255,0,0,255,255,255)						
		read
		if arr1(1,9)={} or arr1(1,34)={}
		   wait wind "Delivery Date can't blank"
		   loop
		endif   				
		@10.500,1 SAY "Cash Memo No.:" ;
			SIZE 1.000,16.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@10.500,20 GET m.cm_no;
			SIZE 1.000,7.00 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "999999" ;
			COLOR ,RGB(255,0,0,255,255,255)						
		@12.500,1 SAY "C.M. Balance :" ;
			SIZE 1.000,16.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)
		@12.500,20 GET m.cm_bal;
			SIZE 1.000,10.00 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "99999.99";
			COLOR ,RGB(255,0,0,255,255,255)									
		read
	@14.500,3 SAY "Customer  :" ;
			SIZE 1.000,16.667 ;
			FONT "MS Sans Serif", 8 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(,,,255,255,255)		
	if arr1(1,83)=0					
		sele a
		set order to
		set filter to
		set order to tag shd_Name
			m.shd_name="  "	
			M.MT_CODE=0
			do SELEITEM			   
			IF M.mt_cODE#0
			    arr1(1,3)=shd_code
				M.shd_name=shd_name
			ELSE
			   m.shd_name="   "
			ENDIF						
			IF m.shd_name="   "
				m.cqty=0
				DEFINE WIND wqty FROM 5.500,8 TO 8.500,70;
				COLOR RGB(0,0,0,255,255,128) in cvwind
				ACTI WIND wqty
				@0.200,2 GET m.cqty FUNCTION "*H \<New Customer;\<Phone No.;\<Old Order No.;\<Cancel"; 
					DEFAULT " ";
					STYLE "BT";
					FONT "MS Sans Serif", 10;
					COLOR ,RGB(255,0,0,255,255,255)
				READ
				DEAC WIND wqty
				do case 
				   case m.cqty=1
						DO addcust
				   case m.cqty=2
						DO mobdet
				   case m.cqty=3
						DO olddet						
				   case m.cqty=4		
					   LOOP
		 		ENDcase
			ENDIF
		else
		    sele a
		    loca for shd_code=arr1(1,3)
		    if found()
		       m.shd_name=shd_name
		    endif
		endif        	
		@14.500,20 GET m.shd_name;
		   SIZE 1.000,25.000;
		   DEFAULT " ";
		   FONT "MS Sans Serif", 8;
		   PICTURE "@!";
		   ERROR "Blank entry is not allowed";
		   COLOR ,RGB(255,0,0,255,255,255)
		CLEA GET			    
		if arr1(1,3)=0
		   loop
		endif   
		@16.500,0.000 SAY "The above entries are correct" ;
			SIZE 1.000,25.667 ;
			FONT "MS Sans Serif", 10 ;
			STYLE "BT" ;
			PICTURE "@J" ;
			COLOR RGB(0,0,128,255,255,255)
		@16.500,36 GET m.choice FUNCTION "*H \<Yes;\<No " ;
			DEFAULT " " ;
			STYLE "BT" ;
			FONT "MS Sans Serif", 10 ;
			COLOR ,RGB(255,0,0,255,255,255)
		READ
		DEAC WIND atotal
			IF m.choice=1
				EXIT
			ENDIF
		ENDDO
		ans4=0
		DO MESSAGE WITH ans4,"Save this Order","yn","SAVE WINDOW",17
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
arr1(K,12)=m_r_p
arr1(K,13)=t_type
arr1(K,14)=t_per
arr1(K,15)=unit
arr1(K,7)=sh_code
arr1(k,25)=style
arr1(k,27)=sty_code
arr1(k,26)=tag
arr1(k,28)=cl_code
arr1(k,29)=colour
*arr1(k,24)=gift
arr1(k,31)=s_code
arr1(k,37)=ex_rate
DEAC POPUP psize
RETU

PROC entry6
arr1(K,4)=i_code
m.item=i_name
arr1(k,35)=sz_type
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
DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,2.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99" ;
		COLOR ,RGB(255,0,0,255,255,255)
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR i_code=arr1(x,4)
	IF FOUND()
		m.item=i_name
		@z,8 GET m.item ;
			SIZE 1.000,15.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,26 GET arr1(x,5) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,33 GET arr1(x,6) ;
		SIZE 1.000,9.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,42 GET arr1(x,7) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	@z,55 GET arr1(x,31) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,65 GET arr1(x,32) ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	CLEA GETS
	IF arr1(x,4)=0
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
SET ORDER TO TAG order_no
IF eflag=.T.
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
		store 0 to arr1(i,76),arr1(i,77),arr1(i,78),arr1(i,79),arr1(i,81),arr1(i,82),arr1(i,83),arr1(i,84),arr1(i,85),arr1(i,86)
		arr1(i,67)=space(8)
		arr1(i,80)=space(50)		
		arr1(i,74)=space(10)
	ENDFOR
	COPY TO ARRAY arr1 FOR order_no=minv_no AND order_dt=minv_dt 
ENDIF
i=1
FOR i =1 TO 10
	IF arr1(i,4)=0
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
		store 0 to arr1(i,68),arr1(i,69),arr1(i,70),arr1(i,71),arr1(i,72),arr1(i,73),arr1(i,75),arr1(i,85)
		store 0 to arr1(i,76),arr1(i,77),arr1(i,78),arr1(i,79),arr1(i,81),arr1(i,82),arr1(i,83),arr1(i,84),arr1(i,86)
		arr1(i,67)=space(8)
		arr1(i,80)=space(50)
		arr1(i,74)=space(10)		        
	ENDIF
ENDFOR
@0.200,0.111 CLEAR TO 1.900,18
@1.800,3 SAY "Order No. :" ;
	SIZE 1.000,16.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@1.800,20 GET arr1(1,1) ;
	SIZE 1.000,6.000 ;
	VALID  !EMPTY(arr1(1,1)) ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "999999" ;
	ERROR "Blank entry is not allowed" ;
	COLOR ,RGB(255,0,0,255,255,255)
@1.800,50 SAY "Order Date :" ;
	SIZE 1.000,17.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@1.800,70 GET arr1(1,2) ;
	SIZE 1.000,12.000 ;
	VALID !EMPTY(arr1(1,2)) ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "@E" ;
	ERROR "Blank entry is not allowed" ;
	COLOR ,RGB(255,0,0,255,255,255)
@3.800,3 SAY "Customer  :" ;
	SIZE 1.000,16.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
sele a
loca for shd_code=arr1(1,3)
if found()
   m.shd_Name=shd_name
else
   m.shd_name=space(40)
endif      
@3.800,20 GET m.shd_name;
   SIZE 1.000,25.000;
   DEFAULT " ";
   FONT "MS Sans Serif", 8;
   PICTURE "@!";
   ERROR "Blank entry is not allowed";
   COLOR ,RGB(255,0,0,255,255,255)
CLEA GET
DO vhead
@21,0.2 clea to 22.4,105
@ 21.00,0.434 TO 21.000,102.134 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(0,0,0,0,0,0,)
@21.300,10 SAY "Total";
	SIZE 1.000,4.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,128,255,255,255)
STORE 0 TO m.tamt,m.tqty
D=1
DO WHILE arr1(D,4)#0
   m.tamt=m.tamt+arr1(D,7)
   m.tqty=m.tqty+arr1(d,5)
   d=D+1
ENDDO
@21.300,26 GET m.tqty;
	SIZE 1.000,5.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "9999" ;
	style "BT";
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
@21.300,42 GET m.tamt ;
	SIZE 1.000,10.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "999999.99";
	style "BT";
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
sarr(1,1)=1
x=1
z=9
asno=x
DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,2.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99" ;
		COLOR ,RGB(255,0,0,255,255,255)
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR i_code=arr1(x,4)
	IF FOUND()
		m.item=i_name
		@z,8 GET m.item ;
			SIZE 1.000,15.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,26 GET arr1(x,5) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,33 GET arr1(x,6) ;
		SIZE 1.000,9.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,42 GET arr1(x,7) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	@z,55 GET arr1(x,31) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,65 GET arr1(x,32) ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	CLEA GETS
	IF arr1(x,4)=0
		IF x#10
			@z,0 CLEAR TO 20,113
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
SELE E
LOCA FOR order_no=minv_no AND order_dt=minv_dt AND shd_code=md_code
IF FOUND()
   scat memvar
	m.cm_no=inv_No
	m.cm_bal=cm_bal
ENDIF
=ACOPY(arr1, earr1)
CLEA READ

PROC dvedit
SET DELE ON
trecno=0
dflag=.F.
=ACOPY(arr1, earr1)
CLEA READ

PROCE vsave
STORE 0 TO nrecno
IF eflag=.F.
	DO editdel
ENDIF
if flock()
	d=1
	do while arr1(d,4)#0
	  sele c
	  set order to
	  set filter to
	  set filter to ri_code=arr1(d,4)
	  go top
	  do while not eof()	  	  
	     sele d
	     loca for order_no=arr1(1,1) and i_code=c->i_code
	     if not found()
	     	appe blank
	     endif	
	     repl order_no with arr1(1,1),order_dt with arr1(1,2),shd_code with arr1(1,3),ri_code with arr1(d,4),i_code with c->i_code
	     repl qty with qty+arr1(d,5),tr_date with arr1(d,8),dl_date with arr1(d,9),od_tr_dt with arr1(d,33),od_dl_dt with arr1(d,34)
	     repl item_type with arr1(d,35)
	     repl od_type with 2
	     sele c
	     skip
	  enddo
	  arr1(d,9)=arr1(1,9)
	  arr1(d,8)=arr1(1,8)
	  arr1(d,33)=arr1(1,33)
	  arr1(d,34)=arr1(1,34)
	  arr1(d,3)=arr1(1,3)
	 d=d+1
	enddo		 
	SELE F
	APPE FROM ARRAY arr1 FOR qty#0
	SELE E
	APPE BLANK
	REPL order_no WITH arr1(1,1),order_dt WITH arr1(1,2),shd_code WITH arr1(1,3)
	REPL gtotal WITH m.tamt,tr_date with arr1(1,8),dl_date with arr1(1,9)
	repl od_tr_dt with arr1(1,33),od_dl_dt with arr1(1,34)
	repl inv_no with m.cm_no,cm_bal with m.cm_bal  
	repl od_type with 2
endif 
unlock all
RETU

PROC editdel
if flock()
SELE F
SET ORDER TO
SET FILTER TO
SET ORDER TO TAG order_no
dele all for  order_no=earr1(1,1) AND order_dt=earr1(1,2)
SELE E
SET ORDER TO
SET FILTER TO
SET ORDER TO TAG order_no
dele all for  order_no=earr1(1,1) AND order_dt=earr1(1,2)
SELE d
dele ALL  FOR order_no=arr1(1,1) AND order_dt=arr1(1,2) 
endif
unlock all
RETU

PROC vhead
@ 5.423,0.434 TO 8.123,102.134 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,0,0,0,)
@6.200,.8 SAY "S.No.";
	SIZE 1.000,4.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@6.200,4 SAY "Item Description" ;
	SIZE 1.000,16.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@6.200,25 SAY "Qty.";
	SIZE 1.000,5.667;
	FONT "MS Sans Serif", 10;
	STYLE "NT";
	PICTURE "@J";
	COLOR RGB(,,,255,255,255)
@6.200,31 SAY "Rate";
	SIZE 1.000,7.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@6.200,43 SAY "Amount";
	SIZE 1.000,6.500 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@5.700,53 SAY "Trial";
	SIZE 1.000,6.500 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)	
@6.900,53 SAY "Qty.";
	SIZE 1.000,6.500 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)		
@6.200,66 SAY "Remarks";
	SIZE 1.000,8.500 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "NT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)	
@ 22.600,0.334 CLEAR TO 24.300,100.334
@ 22.600,0.334 TO 24.300,100.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@ 22.600,0.334 FILL TO 24.300,100.334 ;
	COLOR RGB(,,,255,255,128)
			@22.900,3 SAY "<Message Bar>" ;
				FONT "MS Sans Serif", 8 ;
				STYLE "BT" ;
				COLOR RGB(255,0,0,128,128,0)
RETU

PROCE vdel
ans5=0
DO messagE1 WITH ans5,"Delete this Order detail","yn","CHOICE WINDOW",18
IF ans5=1
	minv_no=order_no
	minv_dt=order_dt
	DO vdisp
	RETU
ENDIF
if flock()
	SELE F
	dele ALL  FOR order_no=arr1(1,1) AND order_dt=arr1(1,2) 
	SELE E
	dele for order_no=arr1(1,1) AND order_dt=arr1(1,2) 	
	SELE d
	dele ALL  FOR order_no=arr1(1,1) AND order_dt=arr1(1,2) 
endif
unlock all
eflag=.T.
SELE E
SET FILTER TO
set filter to od_type=2
SET ORDER TO TAG order_no
GO BOTT
minv_no=order_no
minv_dt=order_dt
DO vdisp
RETU

PROC intarr
STORE SPACE(40) TO m.item,m.brand
m.q_code=SPACE(20)
STORE SPACE(10) TO m.size,m.shade
STORE 0 TO m.qty,m.rate,m.amount,m.d_per
	@j,8 GET m.item ;
		SIZE 1.000,15.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255)
	@j,26 GET m.qty ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@j,33 GET m.qty ;
		SIZE 1.000,8.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@j,42 GET m.qty ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	@j,55 GET m.qty ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@j,65 GET m.item ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	CLEA GETS

PROCE arrdel
D=0
x=0
z=0
D=K
A=0
m.od_no=0
m.od_no=arr1(1,10)
m.inv_no=arr1(1,1)
m.inv_dt=arr1(1,2)
m.c_code=arr1(1,3)
DO WHILE arr1(D,4)#0
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
	arr1(D,34)=arr1(D+1,34)
	arr1(D,35)=arr1(D+1,35)
	arr1(D,36)=arr1(D+1,36)
	arr1(D,37)=arr1(D+1,37)
	arr1(D,38)=arr1(D+1,38)
	arr1(D,39)=arr1(D+1,39)
	arr1(D,40)=arr1(D+1,40)
	arr1(D,41)=arr1(D+1,41)
	arr1(D,42)=arr1(D+1,42)
	arr1(D,43)=arr1(D+1,43)
	arr1(D,44)=arr1(D+1,44)
	arr1(D,45)=arr1(D+1,45)
	arr1(D,46)=arr1(D+1,46)
	arr1(D,47)=arr1(D+1,47)
	arr1(D,48)=arr1(D+1,48)
	arr1(D,49)=arr1(D+1,49)
	arr1(D,50)=arr1(D+1,50)
	arr1(D,51)=arr1(D+1,51)
	arr1(D,52)=arr1(D+1,52)
	arr1(D,53)=arr1(D+1,53)
	arr1(D,54)=arr1(D+1,54)
	arr1(D,55)=arr1(D+1,55)
	arr1(D,56)=arr1(D+1,56)
	arr1(D,57)=arr1(D+1,57)
	arr1(D,58)=arr1(D+1,58)
	arr1(D,59)=arr1(D+1,59)
	arr1(D,60)=arr1(D+1,60)
	arr1(D,61)=arr1(D+1,61)
	arr1(D,62)=arr1(D+1,62)
	arr1(D,63)=arr1(D+1,63)
	arr1(D,64)=arr1(D+1,64)
	arr1(D,65)=arr1(D+1,65)
	arr1(D,66)=arr1(D+1,66)
	arr1(D,67)=arr1(D+1,67)
	arr1(D,68)=arr1(D+1,68)
	arr1(D,69)=arr1(D+1,69)
	arr1(D,70)=arr1(D+1,70)
	arr1(D,71)=arr1(D+1,71)
	arr1(D,72)=arr1(D+1,72)
	arr1(D,73)=arr1(D+1,73)
	arr1(D,74)=arr1(D+1,74)
	arr1(D,75)=arr1(D+1,75)
	arr1(D,76)=arr1(D+1,76)
	arr1(D,77)=arr1(D+1,77)
	arr1(D,78)=arr1(D+1,78)
	arr1(D,79)=arr1(D+1,79)
	arr1(D,80)=arr1(D+1,80)
	arr1(D,81)=arr1(D+1,81)
	arr1(D,82)=arr1(D+1,82)
	arr1(D,83)=arr1(D+1,83)	
	arr1(D,84)=arr1(D+1,84)	
	arr1(D,85)=arr1(D+1,85)	
	arr1(D,86)=arr1(D+1,86)	
	D=D+1
ENDDO
FOR i=D TO 10
     store 0 to arr1(i,1),arr1(i,3),arr1(i,4),arr1(i,5),arr1(i,6),arr1(i,7),arr1(i,10),arr1(i,11)
     store 0 to arr1(i,12),arr1(i,13),arr1(i,14),arr1(i,15),arr1(i,16),arr1(i,17),arr1(i,31),sarr(i,1)
     store 0 to arr1(i,35),arr1(i,85)
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
	  store 0 to arr1(i,68),arr1(i,69),arr1(i,70),arr1(i,71),arr1(i,72),arr1(i,73),arr1(i,75)
	  store 0 to arr1(i,76),arr1(i,77),arr1(i,78),arr1(i,79),arr1(i,81),arr1(i,82),arr1(i,83),arr1(i,84),arr1(i,85),arr1(i,86)
	  arr1(i,67)=space(8)
	  arr1(i,80)=space(50)
	  arr1(i,74)=space(10)	
ENDFOR
IF D>1
	sarr(D-1,1)=0
ENDIF
@j,1 CLEAR TO 19,100
z=j
sarr(1,1)=1
x=K
asno=K
DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,2.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99" ;
		COLOR ,RGB(255,0,0,255,255,255)
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR i_code=arr1(x,4)
	IF FOUND()
		m.item=i_name
		@z,8 GET m.item ;
			SIZE 1.000,15.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,26 GET arr1(x,5) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,33 GET arr1(x,6) ;
		SIZE 1.000,9.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,42 GET arr1(x,7) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	@z,55 GET arr1(x,31) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,65 GET arr1(x,32) ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	CLEA GETS
	IF arr1(x,4)=0
		IF x#5
			@z,3 CLEAR TO 19,100
			EXIT
		ENDIF
	ENDIF
	IF A=5
		EXIT
	ENDIF
	z=z+1
	x=x+1
	A=A+1
	asno=asno+1
ENDDO
@21,0.2 clea to 22.4,105
@ 21.00,0.434 TO 21.000,102.134 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(0,0,0,0,0,0,)
@21.300,10 SAY "Total";
	SIZE 1.000,4.667 ;
	FONT "MS Sans Serif", 10 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,128,255,255,255)
STORE 0 TO m.tamt,m.tqty
D=1
DO WHILE arr1(D,4)#0
   m.tamt=m.tamt+arr1(D,7)
   m.tqty=m.tqty+arr1(d,5)
   d=D+1
ENDDO
@21.300,26 GET m.tqty;
	SIZE 1.000,5.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "9999" ;
	style "BT";
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
@21.300,42 GET m.tamt ;
	SIZE 1.000,10.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "999999.99";
	style "BT";
	COLOR ,RGB(0,0,128,255,255,255) ;
	ERROR "Blank entry is not allowed"
CLEA GETS
arr1(1,1)=m.inv_no
arr1(1,2)=m.inv_dt
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

PROCE seleitem
DEFINE WINDOW _qjn12zbvh ;
   AT  0.000, 0.000  ;
   SIZE 20.231,56.800 ;
   ICON FILE ICON5.ICO;
   FONT "MS Sans Serif", 8 ;
   title "Material Selection";
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
   sele a
   set order to
   set filter to
   set order to tag shd_name
   m.i_code=0
   	@1.0,7.5 SAY "Customer    :" ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		color rgb(0,0,255,255,255,255)
	DO selecust
	IF m.c_name#' '
		m.mt_code=SHD_CODE
		m.item=shd_name
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
		SET FILTER TO ALLTRIM(SUBSTR(shd_name,1,LEN(ALLTRIM(mc_name1))))=ALLTRIM(mc_name1)
		GO TOP
		m.c_name=shd_name
		EXIT
	ENDIF
	IF inval1=5 OR inval1=24
		mc_name=SPACE(40)
		FOR A= 1 TO 40
			mc_name=mc_name+carr1(A,1)
		ENDFOR
		SET FILTER TO
		SET FILTER TO ALLTRIM(SUBSTR(shd_name,1,LEN(ALLTRIM(mc_name))))=ALLTRIM(mc_name)
		COUNT TO nrec
		IF nrec=0
			SET FILTER TO
		ENDIF
		SET ORDER TO TAG shd_name
		DEFINE POPUP cust FROM 3,10 TO 22,55 PROMP FIELD alltrim(shd_name)+space(2)+"("+alltrim(shd_add1)+space(1)+","+alltrim(shd_add2)+")"
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
		SET FILTER TO ALLTRIM(SUBSTR(shd_name,1,LEN(ALLTRIM(mc_name1))))=ALLTRIM(mc_name1)
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
mc_name=shd_name
CLEA

PROCE centry1
m.c_name=SPACE(40)
m.c_name=shd_name
HIDE POPUP cust
DEAC POPUP cust
RETU

PROC adisp
mc_name1=SPACE(40)
FOR t= 1 TO C
	mc_name1=mc_name1+carr1(t,1)
ENDFOR
SET FILTER TO
SET FILTER TO ALLTRIM(SUBSTR(shd_name,1,LEN(ALLTRIM(mc_name1))))=ALLTRIM(mc_name1)
GO TOP
COUNT TO nrec
IF nrec=0
	SET FILTER TO
ENDI
SET ORDER TO TAG shd_name
DEFINE POPUP cust FROM 3,10 TO 22,55 PROMP FIELD alltrim(shd_name)+space(2)+"("+alltrim(shd_add1)+space(1)+","+alltrim(shd_add2)+")"
ON SELE POPUP cust DO Centry1
SHOW POPUP cust
HIDE POPUP cust

PROCE dsize
STORE 0 TO m.size
DEFINE WINDOW _ro10p300f ;
	AT  0.000, 28.000  ;
	SIZE 26.333,55.8000 ;
	TITLE "Customer Size" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	FLOAT ;
	CLOSE ;
	MINIMIZE ;
	COLOR RGB(0,0,255,255,255,255) IN WIND cvwind
DEFINE WINDOW _ro10p3;
	AT  0.000, 0.000;
	SIZE 27.233,86.8000;
	TITLE "Customer Size";
	FONT "MS Sans Serif", 8;
	STYLE "B" ;
	FLOAT ;
	CLOSE ;
	MINIMIZE ;
	COLOR RGB(0,0,255,255,255,255) IN WIND cvwind	
DEFINE WINDOW _ro10p2;
	AT  0.000, 0.000;
	SIZE 27.233,66.8000;
	TITLE "Customer Size";
	FONT "MS Sans Serif", 8;
	STYLE "B" ;
	FLOAT ;
	CLOSE ;
	MINIMIZE ;
	COLOR RGB(0,0,255,255,255,255) IN WIND cvwind		
*MOVE WINDOW _ro10p300f CENTER
DO CASE
CASE arr1(K,35)=1
ACTI WINDOW _ro10p300f
for sa=1 to 1
	@ 0.299,0.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 12 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,86.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,11.333 SAY "Length:" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,26.000 GET arr1(k,18) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.000,10.333 SAY "Chest:" ;
		SIZE 1.000,11.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.000,26.00 GET arr1(k,19) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 5.500,12.333 SAY "Waist:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 5.500,26.000 GET arr1(k,20);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 7.000,11.333 SAY "Shoulder:" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 7.000,26.0 GET arr1(k,21);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 8.500,13.333 SAY "Sleeve:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,26.000 GET arr1(k,22) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)		
	@10.000,15.333 SAY "Neck:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@10.000,26.000 GET arr1(k,23);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)		
	@11.423,0.334 TO 11.423,86.134;
		PEN 1, 8;
		STYLE "1" COLOR RGB(128,,,0,0,0,)
	@11.500,0.333 SAY "Collar:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@11.500,8.000 GET arr1(k,70);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c B.DOWN";
		COLOR ,RGB(255,0,0,255,255,255)
	@11.500,23.000 GET arr1(k,71);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c REG.";
		COLOR ,RGB(255,0,0,255,255,255)				
	@11.500,33.000 GET arr1(k,72);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BAN";
		COLOR ,RGB(255,0,0,255,255,255)
	@11.500,43.000 GET arr1(k,73);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SAFARI";
		COLOR ,RGB(255,0,0,255,255,255)
		
	@13.000,0.333 SAY "Collar Size:";
		SIZE 1.000,12.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@13.000,15.000 GET arr1(k,74);
		SIZE 1.000,10.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		pict "@!";
		COLOR ,RGB(255,0,0,255,255,255)
		
	@14.500,0.333 SAY "Stiching Style:" ;
		SIZE 1.000,15.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@14.500,18.000 GET arr1(k,75);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SP";
		COLOR ,RGB(255,0,0,255,255,255)
	@14.500,28.000 GET arr1(k,76);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c PP";
		COLOR ,RGB(255,0,0,255,255,255)
	@16.000,0.333 SAY "Pocket:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@16.000,12.000 GET arr1(k,77);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c ONE";
		COLOR ,RGB(255,0,0,255,255,255)	
	@16.000,22.000 GET arr1(k,78);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c TWO";
		COLOR ,RGB(255,0,0,255,255,255)
	@16.000,32.000 GET arr1(k,79);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c THREE";
		COLOR ,RGB(255,0,0,255,255,255)
	@17.500,1.333 SAY "Remarks:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)		
	@17.500,15.000 GET arr1(k,32);
		SIZE 1.000,40.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		PICT "@!N40";
		COLOR ,RGB(255,0,0,255,255,255)
	@18.500,15.000 GET arr1(k,80);
		SIZE 1.000,50.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		PICT "@!N50";
		COLOR ,RGB(255,0,0,255,255,255)						
	@20.823,0.334 TO 20.823,86.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)		
	@21.000,0.333 SAY "The above sizes are correct" ;
		SIZE 1.000,28.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@23.000,12 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif   	   
endfor	
deAC WINDOW _ro10p300f
CASE arr1(K,35)=2
ACTI WINDOW _ro10p300f
for sa=1 to 1
	@ 0.299,0.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,10.000;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,60.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,14.333 SAY "Length:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,26.000 GET arr1(k,24) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.000,15.333 SAY "Waist:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.000,26.00 GET arr1(k,25) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 5.500,17.333 SAY "Hip:" ;
		SIZE 1.000,5.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 5.500,26.000 GET arr1(k,26);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 7.000,14.333 SAY "Inseam:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 7.000,26.0 GET arr1(k,27);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 8.500,14.333 SAY "Bottom:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,26.000 GET arr1(k,28) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@10.000,16.333 SAY "Knee:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@10.000,26.000 GET arr1(k,29);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@11.500,15.333 SAY "Thigh:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@11.500,26.000 GET arr1(k,30);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 12.823,0.334 TO 12.823,60.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(128,,,0,0,0,)
	@13.000,0.333 SAY "Style :" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@13.000,8.000 GET arr1(k,58);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 1P";
		COLOR ,RGB(255,0,0,255,255,255)
	@13.000,16.000 GET arr1(k,59);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 2P";
		COLOR ,RGB(255,0,0,255,255,255)
	@13.000,24.000 GET arr1(k,60);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 3P";
		COLOR ,RGB(255,0,0,255,255,255)
	@13.000,32.000 GET arr1(k,61);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BP";
		COLOR ,RGB(255,0,0,255,255,255)
	@13.000,40.000 GET arr1(k,62);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c FF";
		COLOR ,RGB(255,0,0,255,255,255)	
	@15.000,0.333 SAY "Pockets:";
		SIZE 1.000,9.000;
		FONT "MS Sans Serif", 8;
		STYLE "BT";
		PICTURE "@J";
		COLOR RGB(0,128,0,255,255,255)
	@15.000,10.000 GET arr1(k,63);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c CP";
		COLOR ,RGB(255,0,0,255,255,255)
	@15.000,20.000 GET arr1(k,64);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SP";
		COLOR ,RGB(255,0,0,255,255,255)		
	@15.000,30.000 GET arr1(k,65);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BP-1";
		COLOR ,RGB(255,0,0,255,255,255)
	@15.000,40.000 GET arr1(k,66);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BP-2";
		COLOR ,RGB(255,0,0,255,255,255)
	@17.000,0.333 SAY "Loop:";
		SIZE 1.000,11.000;
		FONT "MS Sans Serif", 8;
		STYLE "BT";
		PICTURE "@J";
		COLOR RGB(0,128,0,255,255,255)
	if arr1(k,67)="  "
	   arr1(k,67)="8"
	endif   	
	@17.000,13.000 GET arr1(k,67);
		SIZE 1.000,8.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		pict "@!";
		COLOR ,RGB(255,0,0,255,255,255)
	@19.000,0.333 SAY "Trun Up:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
		
	@19.000,11.000 GET arr1(k,81);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c TRUN UP";
		COLOR ,RGB(255,0,0,255,255,255)			
	@21.000,0.333 SAY "Remarks:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
		
	@21.000,11.000 GET arr1(k,32);
		SIZE 1.000,40.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		PICT "@!N40";
		COLOR ,RGB(255,0,0,255,255,255)
	@22.000,11.000 GET arr1(k,80);
		SIZE 1.000,50.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		PICT "@!N50";
		COLOR ,RGB(255,0,0,255,255,255)	
	@ 24.000,0.333 SAY "The above sizes are correct" ;
		SIZE 1.000,25.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@24.000,37 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif   	   	
endfor	
CASE arr1(K,35)=3
ACTI WINDOW _ro10p3
for sa=1 to 1
	@ 0.299,12.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 12 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,86.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,1.333 SAY "Length :" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,16.000 GET arr1(k,18) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.000,0.333 SAY "Chest    :" ;
		SIZE 1.000,11.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.000,16.00 GET arr1(k,19) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 5.500,2.333 SAY "Waist  :" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 5.500,16.000 GET arr1(k,20);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 7.000,1.333 SAY "Shoulder:" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 7.000,16.0 GET arr1(k,21);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 8.500,3.333 SAY "Sleeve:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,16.000 GET arr1(k,22) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@10.000,3.333 SAY "X.Back:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@10.000,16.000 GET arr1(k,23);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)				

	@2.50,30.333 SAY "Style:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@2.500,40.000 GET arr1(k,49);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SB";
		COLOR ,RGB(255,0,0,255,255,255)
			
	@2.500,50.000 GET arr1(k,50);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c DB";
		COLOR ,RGB(255,0,0,255,255,255)
		
	@2.500,60.000 GET arr1(k,51);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c JP";
		COLOR ,RGB(255,0,0,255,255,255)
				
	@4.000,30.333 SAY "Button:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@4.000,40.000 GET arr1(k,52);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 3B";
		COLOR ,RGB(255,0,0,255,255,255)
			
	@4.000,50.000 GET arr1(k,53);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 2B";
		COLOR ,RGB(255,0,0,255,255,255)
		
	@5.50,30.333 SAY "Cut:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@5.500,40.000 GET arr1(k,54);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BACK";
		COLOR ,RGB(255,0,0,255,255,255)			
	@5.500,50.000 GET arr1(k,55);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SIDE";
		COLOR ,RGB(255,0,0,255,255,255)
	@5.500,60.000 GET arr1(k,82);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c NO CUT";
		COLOR ,RGB(255,0,0,255,255,255)					
	@7.000,30.333 SAY "Bottom:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@7.000,40.000 GET arr1(k,56);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c ST";
		COLOR ,RGB(255,0,0,255,255,255)
			
	@7.000,50.000 GET arr1(k,57);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c RD";
		COLOR ,RGB(255,0,0,255,255,255)	

	@11.500,3.333 SAY "Remarks:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
		
	@11.500,15.000 GET arr1(k,32);
		SIZE 1.000,40.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		PICT "@!N40";
		COLOR ,RGB(255,0,0,255,255,255)	
			
	@ 12.823,0.334 TO 12.823,86.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(128,,,0,0,0,)		
	@13.000,2.333 SAY "Length:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@13.000,16.000 GET arr1(k,24) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@14.500,2.333 SAY "Waist:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@14.500,16.00 GET arr1(k,25) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@16.000,2.333 SAY "Hip:" ;
		SIZE 1.000,5.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@16.000,16.000 GET arr1(k,26);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 17.500,2.333 SAY "Inseam:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 17.500,16.0 GET arr1(k,27);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@19.00,2.333 SAY "Bottom:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@19.000,16.000 GET arr1(k,28) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@20.500,2.333 SAY "Knee:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@20.500,16.000 GET arr1(k,29);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@22.000,2.333 SAY "Thigh:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@22.000,16.000 GET arr1(k,30);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)				
	@14.000,30.333 SAY "Style :" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@14.000,40.000 GET arr1(k,58);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 1P";
		COLOR ,RGB(255,0,0,255,255,255)
	@14.000,48.000 GET arr1(k,59);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 2P";
		COLOR ,RGB(255,0,0,255,255,255)
	@14.000,56.000 GET arr1(k,60);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 3P";
		COLOR ,RGB(255,0,0,255,255,255)
	@14.000,64.000 GET arr1(k,61);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BP";
		COLOR ,RGB(255,0,0,255,255,255)
	@14.000,72.000 GET arr1(k,62);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c FF";
		COLOR ,RGB(255,0,0,255,255,255)	
	@15.500,30.333 SAY "Pockets:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@15.500,40.000 GET arr1(k,63);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c CP";
		COLOR ,RGB(255,0,0,255,255,255)
	@15.500,50.000 GET arr1(k,64);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SP";
		COLOR ,RGB(255,0,0,255,255,255)
	@15.500,60.000 GET arr1(k,65);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BP-1";
		COLOR ,RGB(255,0,0,255,255,255)
	@15.500,70.000 GET arr1(k,66);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BP-2";
		COLOR ,RGB(255,0,0,255,255,255)
	@17.000,30.333 SAY "Loop:";
		SIZE 1.000,6.000;
		FONT "MS Sans Serif", 8;
		STYLE "BT";
		PICTURE "@J";
		COLOR RGB(0,128,0,255,255,255)
	if arr1(k,67)="  "
	   arr1(k,67)="8"
	endif   			
	@17.000,40.000 GET arr1(k,67);
		SIZE 1.000,8.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		pict "@!";
		COLOR ,RGB(255,0,0,255,255,255)
	@18.500,30.333 SAY "Trun Up:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
		
	@18.500,40.000 GET arr1(k,81);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c TRUN UP";
		COLOR ,RGB(255,0,0,255,255,255)			
		
	@23.500,3.333 SAY "Remarks:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)				

	@23.500,15.000 GET arr1(k,80);
		SIZE 1.000,50.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		PICT "@!N50";
		COLOR ,RGB(255,0,0,255,255,255)	
	@ 25.000,0.333 SAY "The above sizes are correct" ;
		SIZE 1.000,28.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@25.000,40 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;	
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif   	   
endfor	
DEAC WINDOW _ro10p3
CASE arr1(K,35)=4
ACTI WINDOW _ro10p2
for sa=1 to 1
	@ 0.299,0.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,15.000 ;
		FONT "MS Sans Serif", 12 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,86.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,1.333 SAY "Length :" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,16.000 GET arr1(k,18) ;
		SIZE 1.000,7.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.000,0.333 SAY "Chest    :" ;
		SIZE 1.000,11.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.000,16.00 GET arr1(k,19) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 5.500,2.333 SAY "Waist  :" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 5.500,16.000 GET arr1(k,20);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 7.000,1.333 SAY "Shoulder:" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 7.000,16.0 GET arr1(k,21);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 8.500,3.333 SAY "Sleeve:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,16.000 GET arr1(k,22) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
		
	@10.000,3.333 SAY "X.Back:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@10.000,16.000 GET arr1(k,23);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)	
	@11.423,0.334 TO 11.423,86.134;
		PEN 1, 8;
		STYLE "1" COLOR RGB(128,,,0,0,0,)				
	@11.50,4.333 SAY "Style:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@11.500,16.000 GET arr1(k,49);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SB";
		COLOR ,RGB(255,0,0,255,255,255)			
	@11.50,26.000 GET arr1(k,50);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c DB";
		COLOR ,RGB(255,0,0,255,255,255)
		
	@11.50,36.000 GET arr1(k,51);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c JP";
		COLOR ,RGB(255,0,0,255,255,255)
				
	@13.000,3.333 SAY "Button:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@13.000,16.000 GET arr1(k,52);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 3B";
		COLOR ,RGB(255,0,0,255,255,255)
			
	@13.000,26.000 GET arr1(k,53);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 2B";
		COLOR ,RGB(255,0,0,255,255,255)		
	@14.50,6.333 SAY "Cut:" ;
		SIZE 1.000,5.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@14.500,16.000 GET arr1(k,54);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BACK";
		COLOR ,RGB(255,0,0,255,255,255)			
	@14.500,26.000 GET arr1(k,55);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SIDE";
		COLOR ,RGB(255,0,0,255,255,255)
	@14.50,36.000 GET arr1(k,82);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c NO CUT";
		COLOR ,RGB(255,0,0,255,255,255)					
	@16.000,3.333 SAY "Bottom:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@16.000,16.000 GET arr1(k,56);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c ST";
		COLOR ,RGB(255,0,0,255,255,255)
			
	@16.000,26.000 GET arr1(k,57);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c RD";
		COLOR ,RGB(255,0,0,255,255,255)	

	@17.500,2.333 SAY "Remarks:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
		
	@17.500,16.000 GET arr1(k,32);
		SIZE 1.000,40.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		PICT "@!N40";
		COLOR ,RGB(255,0,0,255,255,255)						

	@20.823,0.334 TO 20.823,86.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)		
	@21.000,0.333 SAY "The above sizes are correct" ;
		SIZE 1.000,28.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@22.500,12 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif   	   
endfor	
deAC WINDOW _ro10p2

CASE arr1(K,35)=5
ACTI WINDOW _ro10p3
for sa=1 to 1
	@ 0.299,12.333 SAY ALLTRIM(m.ITEM) ;
		SIZE 1.000,15.000 ;
		FONT "MS Sans Serif", 12 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@ 1.923,0.334 TO 1.923,86.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(,,,0,0,0,)
	@ 2.500,3.333 SAY "Length:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 2.500,16.000 GET arr1(k,18) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 4.000,3.333 SAY "Chest:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 4.000,16.00 GET arr1(k,19) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 5.500,3.333 SAY "Waist:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 5.500,16.000 GET arr1(k,20);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 7.000,3.333 SAY "Shoulder:" ;
		SIZE 1.000,10.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 7.000,16.0 GET arr1(k,21);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@ 8.500,3.333 SAY "Sleeve:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 8.500,16.000 GET arr1(k,22) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)		
	@10.000,3.333 SAY "Neck:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@10.000,16.000 GET arr1(k,23);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)		
		
	@2.500,30.333 SAY "Collar:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@2.500,39.000 GET arr1(k,70);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c B.DOWN";
		COLOR ,RGB(255,0,0,255,255,255)
	@2.500,53.000 GET arr1(k,71);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c REG.";
		COLOR ,RGB(255,0,0,255,255,255)				
	@2.500,63.000 GET arr1(k,72);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BAN";
		COLOR ,RGB(255,0,0,255,255,255)
	@2.500,73.000 GET arr1(k,73);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SAFARI";
		COLOR ,RGB(255,0,0,255,255,255)
		
	@4.000,30.333 SAY "Collar Size:";
		SIZE 1.000,12.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@4.000,46.000 GET arr1(k,74);
		SIZE 1.000,10.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		pict "@!";
		COLOR ,RGB(255,0,0,255,255,255)
		
	@5.500,30.333 SAY "Stiching Style:" ;
		SIZE 1.000,15.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@5.500,47.000 GET arr1(k,75);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SP";
		COLOR ,RGB(255,0,0,255,255,255)
	@5.500,58.000 GET arr1(k,76);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SP";
		COLOR ,RGB(255,0,0,255,255,255)
	@7.000,30.333 SAY "Pocket:" ;
		SIZE 1.000,8.500 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@7.000,40.000 GET arr1(k,77);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c ONE";
		COLOR ,RGB(255,0,0,255,255,255)	
	@7.000,50.000 GET arr1(k,78);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c TWO";
		COLOR ,RGB(255,0,0,255,255,255)
	@7.000,60.000 GET arr1(k,79);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c THREE";
		COLOR ,RGB(255,0,0,255,255,255)		
	@11.500,3.333 SAY "Remarks:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
		
	@11.500,15.000 GET arr1(k,32);
		SIZE 1.000,40.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		PICT "@!N40";
		COLOR ,RGB(255,0,0,255,255,255)		
	@12.823,0.334 TO 12.823,86.134 ;
		PEN 1, 8 ;
		STYLE "1" COLOR RGB(128,,,0,0,0,)
	
	@13.000,2.333 SAY "Length:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@13.000,16.000 GET arr1(k,24) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)

	@14.500,2.333 SAY "Waist:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@14.500,16.00 GET arr1(k,25) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@16.000,2.333 SAY "Hip:" ;
		SIZE 1.000,5.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@16.000,16.000 GET arr1(k,26);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@ 17.500,2.333 SAY "Inseam:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@ 17.500,16.0 GET arr1(k,27);
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@19.00,2.333 SAY "Bottom:" ;
		SIZE 1.000,8.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@19.000,16.000 GET arr1(k,28) ;
		SIZE 1.000,10.00 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@20.500,2.333 SAY "Knee:" ;
		SIZE 1.000,6.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@20.500,16.000 GET arr1(k,29);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)
	@22.000,2.333 SAY "Thigh:" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@22.000,16.000 GET arr1(k,30);
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(0,0,255,255,255,255)				
	@13.000,30.333 SAY "Style :" ;
		SIZE 1.000,7.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@13.000,40.000 GET arr1(k,58);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 1P";
		COLOR ,RGB(255,0,0,255,255,255)
	@13.000,48.000 GET arr1(k,59);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 2P";
		COLOR ,RGB(255,0,0,255,255,255)
	@13.000,56.000 GET arr1(k,60);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c 3P";
		COLOR ,RGB(255,0,0,255,255,255)
	@13.000,64.000 GET arr1(k,61);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BP";
		COLOR ,RGB(255,0,0,255,255,255)
	@13.000,72.000 GET arr1(k,62);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c FF";
		COLOR ,RGB(255,0,0,255,255,255)	
	@14.500,30.333 SAY "Pockets:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@14.500,40.000 GET arr1(k,63);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c CP";
		COLOR ,RGB(255,0,0,255,255,255)
	@14.500,50.000 GET arr1(k,64);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c SP";
		COLOR ,RGB(255,0,0,255,255,255)
	@14.500,60.000 GET arr1(k,65);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BP-1";
		COLOR ,RGB(255,0,0,255,255,255)
	@14.500,70.000 GET arr1(k,66);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c BP-2";
		COLOR ,RGB(255,0,0,255,255,255)
	@16.000,30.333 SAY "Loop:";
		SIZE 1.000,6.000;
		FONT "MS Sans Serif", 8;
		STYLE "BT";
		PICTURE "@J";
		COLOR RGB(0,128,0,255,255,255)
	if arr1(k,67)="  "
	   arr1(k,67)="8"
	endif   			
	@16.000,40.000 GET arr1(k,67);
		SIZE 1.000,8.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		pict "@!";
		COLOR ,RGB(255,0,0,255,255,255)
	@17.500,30.333 SAY "Trun Up:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
		
	@17.500,40.000 GET arr1(k,81);
		SIZE 1.000,2.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		FUNCTION "*c TRUN UP";
		COLOR ,RGB(255,0,0,255,255,255)							
		
	@23.500,3.333 SAY "Remarks:" ;
		SIZE 1.000,9.000 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,128,0,255,255,255)
	@23.500,15.000 GET arr1(k,80);
		SIZE 1.000,50.000;
		FONT "MS Sans Serif", 10;
		style "BT";
		PICT "@!N50";
		COLOR ,RGB(255,0,0,255,255,255)	
	@ 25.000,0.333 SAY "The above sizes are correct" ;
		SIZE 1.000,28.000 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(0,0,128,255,255,255)
	@25.000,40 GET m.size FUNCTION "*H \<No;\<Yes" ;
		DEFAULT " " ;
		STYLE "BT" ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,RGB(255,0,0,255,255,255)
	READ	
	if m.size=1
	   SA=0	   
	   loop
	endif   	   
endfor	
DEAC WINDOW _ro10p3
endcase
deAC WINDOW _ro10p300f
retu	

PROC addcust
SELE A
set order to
set filter to
STORE SPACE(40) TO m.shd_name,m.shd_add1,m.shd_add2,m.shd_add3
STORE SPACE(20) TO m.shd_phno1,m.shd_mail
m.shd_phno2=0
m.shd_code=0
m.shd_dob={}
m.shd_dma={}
DEFINE WIND wqty FROM 5.500,16 TO 29.500,60 ;
	COLOR RGB(0,0,255,255,255,128) in wind cvwind
ACTI WIND wqty
DO WHILE .T.
	@0.800,6 SAY "Name :" ;
		SIZE 1.000,7.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@0.800,15 GET m.shd_name ;
		SIZE 1.000,40.000 ;
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
	@2.800,15 GET m.shd_add1 ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@3.800,15 GET m.shd_add2 ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@4.800,15 GET m.shd_add3 ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@6.800,6 SAY "Phone :" ;
		SIZE 1.000,7.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@6.800,15 GET m.shd_phno1 ;
		SIZE 1.000,15.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@8.800,6 SAY "Mobile:" ;
		SIZE 1.000,7.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@8.800,15 GET m.shd_phno2 ;
		SIZE 1.000,15.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)		
	@10.800,6 SAY "e-mail:" ;
		SIZE 1.000,7.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@10.800,15 GET m.shd_mail ;
		SIZE 1.000,15.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@ 12.800,5 SAY "D.O.B.:" ;
		SIZE 1.000,8.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@ 12.800,15.000 GET m.shd_dob ;
		SIZE 1.000,12.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	@14.800,2.333 SAY "Marr.Anv.:" ;
		SIZE 1.000,11.667 ;
		FONT "MS Sans Serif", 8 ;
		STYLE "BT" ;
		PICTURE "@J" ;
		COLOR RGB(,,,255,255,255)
	@ 14.800,15.000 GET m.shd_dma ;
		SIZE 1.000,12.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,128)
	READ
	IF m.shd_name#'  '
		EXIT
	ENDIF
ENDDO
DEAC WIND wqty
CALCU MAX(shd_code) TO m.shd_code
m.shd_code=m.shd_code+1
APPE BLANK
REPL shd_name WITH m.shd_name,shd_add1 WITH m.shd_add1,shd_add2 WITH m.shd_add2,shd_add3 WITH m.shd_add3
REPL shd_phno1 with m.shd_phno1,shd_phno2 with m.shd_phno2,shd_mail with m.shd_mail,shd_code with m.shd_code
repl shd_dob with m.shd_dob,shd_dma with m.shd_dma
m.ashd_code=m.shd_code
*!*	sele h
*!*	CALCU MAX(c_code) TO aaa
*!*	appe blank
*!*	aaa=aaa+1
*!*	repl c_code with aaa,c_name with m.shd_name,c_add1 with m.shd_add1,c_add2 with m.shd_add2
*!*	repl c_city with m.shd_add3,c_phno2 with m.shd_phno2
RETU

PROC mobdet
SELE A
set order to
set filter to
STORE 0 TO m.shdphno1
m.shd_name=space(40)
DEFINE WIND wqty FROM 5.500,16 TO 12.500,55 ;
COLOR RGB(0,0,255,255,255,128) in wind cvwind
ACTI WIND wqty
@1.800,6 SAY "Mobile No:" ;
	SIZE 1.000,11.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@1.800,20 GET m.shdphno1 ;
	SIZE 1.000,12.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "99999999999";
	COLOR ,RGB(255,0,0,255,255,128)
read
if readkey()=12 or readkey()=268 or m.shdphno1=0
	DEACTI WIND wqty
    retu  
endif  
   loca for shd_phno2=m.shdphno1
   if found()	
      wait wind alltrim(shd_name)+space(2)+alltrim(shd_add1)+space(1)+alltrim(shd_add2)
      m.ashd_code=shd_code
      m.shd_name=shd_name
   else      
	   t1='  '
	   DO MESSAGE WITH t1,"This Mobile No. does not exsit"," ","Message"
	endif
deACTI WIND wqty
retu

PROC olddet
SELE A
set order to
set filter to
m.od_no=0
DEFINE WIND wqty FROM 5.500,16 TO 12.500,55 ;
COLOR RGB(0,0,255,255,255,128) in wind cvwind
ACTI WIND wqty
@1.800,6 SAY "Order No.:" ;
	SIZE 1.000,11.667 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@1.800,20 GET m.od_no;
	SIZE 1.000,7.000 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "99999";
	COLOR ,RGB(255,0,0,255,255,128)
read
if readkey()=12 or readkey()=268 or m.od_no=0
	DEACTI WIND wqty
    retu  
endif  
sele e
loca for order_no=m.od_no
if found()	
   sele a
   loca for shd_code=e->shd_code   
   if found()
	  wait wind alltrim(shd_name)+space(2)+alltrim(shd_add1)+space(1)+alltrim(shd_add2)
      m.ashd_code=shd_code
      m.shd_name=shd_name	   
	endif   
else
   t1='  '
   DO MESSAGE WITH t1,"This Order No. does not exsit"," ","Message"	   
endif	
deACTI WIND wqty
retu
	   
proce olddisp
m.odno=0
m.oddt={}
m.odno=arr1(1,1)
m.oddt=arr1(1,2)
m.oldodno=arr1(1,83)
sele f
COPY TO ARRAY arr1 FOR order_no=m.oldodno
D=1
DO WHILE arr1(D,4)#0
  arr1(d,1)=m.odno
  arr1(d,2)=m.oddt
  arr1(d,83)=m.oldodno
  d=d+1
enddo  
z=9
x=1
asno=1
DO WHILE z<19
	@z,2 GET asno ;
		SIZE 1.000,2.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99" ;
		COLOR ,RGB(255,0,0,255,255,255)
	SELE B
	SET ORDER TO
	SET FILTER TO
	LOCA FOR i_code=arr1(x,4)
	IF FOUND()
		m.item=i_name
		@z,8 GET m.item ;
			SIZE 1.000,15.000 ;
			DEFAULT " " ;
			FONT "MS Sans Serif", 8 ;
			PICTURE "@!" ;
			COLOR ,RGB(255,0,0,255,255,255)
		CLEA GETS
	ENDIF
	@z,26 GET arr1(x,5) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,33 GET arr1(x,6) ;
		SIZE 1.000,9.500 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "99999.99" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,42 GET arr1(x,7) ;
		SIZE 1.000,10.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "999999.99";
		COLOR ,RGB(255,0,0,255,255,255);
		ERROR "Blank entry is not allowed"
	@z,55 GET arr1(x,31) ;
		SIZE 1.000,5.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "9999" ;
		COLOR ,RGB(2550,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"
	@z,65 GET arr1(x,32) ;
		SIZE 1.000,40.000 ;
		DEFAULT " " ;
		FONT "MS Sans Serif", 8 ;
		PICTURE "@!" ;
		COLOR ,RGB(255,0,0,255,255,255) ;
		ERROR "Blank entry is not allowed"		
	CLEA GETS
	IF arr1(x,4)=0
		EXIT
		SELE B
	ENDIF
	z=z+1
	x=x+1
	asno=asno+1
ENDDO
RETU

 proc upcust
   do while .t.
        m.ashd_code=0
		sele a
		set order to
		set filter to
		set order to tag shd_Name
			m.shd_name="  "	
			M.MT_CODE=0
			do SELEITEM			   
			IF M.mt_cODE#0
			    m.ashd_code=shd_code
				M.shd_name=shd_name
			ELSE
			   m.shd_name="   "
			ENDIF						
			IF m.shd_name="   "
				m.cqty=0
				DEFINE WIND wqty FROM 5.500,8 TO 8.500,70;
				COLOR RGB(0,0,0,255,255,128) in cvwind
				ACTI WIND wqty
				@0.200,2 GET m.cqty FUNCTION "*H \<New Customer;\<Mobile No.;\<Old Order No.;\<Cancel"; 
					DEFAULT " ";
					STYLE "BT";
					FONT "MS Sans Serif", 10;
					COLOR ,RGB(255,0,0,255,255,255)
				READ
				DEAC WIND wqty
				do case 
				   case m.cqty=1
						DO addcust
				   case m.cqty=2
						DO mobdet
				   case m.cqty=3
						DO olddet						
				   case m.cqty=4		
					   LOOP
		 		ENDcase
			ENDIF
		if m.ashd_code#0
		   sele d
		   repl all shd_code with m.ashd_code for order_no=arr1(1,1)
   		   sele e
		   repl all shd_code with m.ashd_code for order_no=arr1(1,1)
   		   sele f
		   repl all shd_code with m.ashd_code for order_no=arr1(1,1)
		   exit
		endif   
	enddo			
	sele e
	loca for order_no=arr1(1,1)
	if found()
		minv_no=order_no
		md_code=shd_code
		minv_dt=order_dt
	endif	
	DO vdisp	
	retu
	

		
