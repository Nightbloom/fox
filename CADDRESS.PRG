set dele on
set excl off
CLOS ALL
STORE 0 TO m.shl,m.ans
DO WHILE .T.
	DEFINE WINDOW _qjn12zbvh ;
		AT  0.000, 0.000  ;
		SIZE 14.231,54.800 ;
		FONT "MS Sans Serif", 8 ;
		TITLE "Address" ;
		fill file back.bmp;
		icon file icon5.ico;
		COLOR RGB(0,0,255,255,255,255);
		FLOAT NOCLOSE MINIMIZE SYSTEM
	MOVE WINDOW _qjn12zbvh CENTER
	ACTIVATE WINDOW _qjn12zbvh NOSHOW
	m.shl=1
	@0,47.200 SAY "sc.bmp"BITMAP
	@ 0.146,10.000 SAY "Option"  ;
		FONT "MS Sans Serif", 12 ;
		COLOR RGB(0,128,0,255,255,255) ;
		STYLE "BTIU"
	@ 3.092,9.000 GET m.schl;
		PICTURE "@*RVN \<Customer;C\<ash Memo;\<Reports;\<Industry";
		SIZE 1.308,12.000,0.308 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 10 ;
		COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R ;
		STYLE "BT"
	@ 11.154,11.600 GET m.ans ;
		PICTURE "@*HT \<OK;Ca\<ncel" ;
		SIZE 1.769,8.667,0.667 ;
		DEFAULT 1 ;
		FONT "MS Sans Serif", 10 ;
		STYLE "B"
	ACTIVATE WINDOW _qjn12zbvh
	READ CYCLE MODAL
	IF READKEY()=12
		RELEASE WINDOW _qjn12zbvh
		RETURN
	ENDIF
	IF m.ans=1
		DO CASE
		CASE m.schl=1
			DO custdt
		CASE m.schl=2
			DO entcm
		CASE m.schl=3
			DO ccmrep
		CASE m.schl=4
			DO industdt
		ENDCASE
	ENDIF
	IF ans = 2
		EXIT
	ENDIF
ENDDO
RELEASE WINDOW _qjn12zbvh
RETURN

