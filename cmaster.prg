do while .t.
store 0 to m.choice,m.ans
DEFINE WINDOW _qjn ;
   AT  0.000, 0.000  ;
   SIZE 23.231,51.800 ;
   FONT "MS Sans Serif", 8 ;
   title "Option" ;  
   fill file back.bmp;
   icon file icon5.ico; 
   color rgb(0,0,255,255,255,255) ;
   FLOAT NOCLOSE MINIMIZE SYSTEM  
MOVE WINDOW _qjn CENTER
ACTIVATE WINDOW _qjn 
@0,44.200 SAY "sc.bmp"BITMAP
@ 21.200,0.334 CLEAR TO 22.923,110.334
@ 21.200,0.334 TO 22.923,100.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@21.200,0.334 FILL TO 22.923,100.334 ;
	COLOR RGB(,,,255,255,128)
@21.200,1 SAY "msign2.bmp"BITMAP	;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@21.500,16 SAY "return to main menu.";
	FONT "MS Sans Serif", 9;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@21.500,8 SAY "<Esc>" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(255,0,0,128,128,0)   
@ 0.246,10.000 SAY "Option"  ;
   FONT "MS Sans Serif", 12 ;
   color rgb(0,128,0,255,255,255) ;
   STYLE "BTU"
@ 2.692,9.000 GET m.choice;
   PICTURE "@*V \<Item;\<Supplier;\<Customer;S\<alesman;O\<pening Stock;\<User;Ra\<ymond Cash in hand;Sale Ta\<x;\<Gift Voucher";
   SIZE 1.308,12.000,0.308 ;
   DEFAULT 1 ;
   FONT "MS Sans Serif", 10 ;
   COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
   STYLE "BT"
@21.292,40.000 GET m.ans;
   PICTURE "@*V \<Return";
   SIZE 1.208,6.000,.3;
   FONT "MS Sans Serif", 10;
   COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
   STYLE "BT"               
READ    
if readkey()=12 
   RELEASE WINDOW _qjn 
   retu
endif
if m.ans=1
   RELEASE WINDOW _qjn 
   retu
endif    
RELEASE WINDOW _qjn 
	do case 
		case m.choice=1
	        do company
		case m.choice=2
	        do supplier
		case m.choice=3
	        do cust
	    case m.choice=4
		    do sman        
		case m.choice=5
	        do copen
		case m.choice=6
		    do entuser
		case m.choice=7
	        do cashhd
 		case m.choice=8
		    do entstfm
 		case m.choice=9
		    do entgift		    
	endcase
RELEASE WINDOW _qjn
enddo
RETURN

proc copen
do while .t.
store 0 to m.choice,m.ans
DEFINE WINDOW _qjnos ;
   AT  0.000, 0.000  ;
   SIZE 12.231,51.800 ;
   FONT "MS Sans Serif", 8 ;
   title "Option" ;  
   fill file back.bmp;
   icon file icon5.ico; 
   color rgb(0,0,255,255,255,255) ;
   FLOAT NOCLOSE MINIMIZE SYSTEM  
MOVE WINDOW _qjnos CENTER
ACTIVATE WINDOW _qjnos 
@0,44.200 SAY "sc.bmp"BITMAP
@ 10.200,0.334 CLEAR TO 11.923,110.334
@ 10.200,0.334 TO 11.923,100.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@10.200,0.334 FILL TO 11.923,100.334 ;
	COLOR RGB(,,,255,255,128)
@10.200,1 SAY "msign2.bmp"BITMAP	;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@10.500,16 SAY "return to main menu.";
	FONT "MS Sans Serif", 9;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@10.500,8 SAY "<Esc>" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(255,0,0,128,128,0)   
@ 0.246,10.000 SAY "Option"  ;
   FONT "MS Sans Serif", 12 ;
   color rgb(0,128,0,255,255,255) ;
   STYLE "BTU"
@ 3.692,5.000 GET m.choice;
   PICTURE "@*V O\<pening Stock;Opening & \<Closing Stock Report";
   SIZE 1.308,12.000,0.508 ;
   DEFAULT 1 ;
   FONT "MS Sans Serif", 10 ;
   COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
   STYLE "BT"
@10.292,40.000 GET m.ans;
   PICTURE "@*V \<Return";
   SIZE 1.208,6.000,.3;
   FONT "MS Sans Serif", 10;
   COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
   STYLE "BT"               
READ    
if readkey()=12 
   RELEASE WINDOW _qjnos  
   retu
endif
if m.ans=1
   RELEASE WINDOW _qjnos  
   retu
endif    
RELEASE WINDOW _qjnos  
	do case 
		case m.choice=1
	        do osinv
		case m.choice=2
	        do stkdiff
	endcase
RELEASE WINDOW _qjnos 
enddo
RETURN

proc cbar
do while .t.
store 0 to m.choice,m.ans
DEFINE WINDOW _qjnos ;
   AT  0.000, 0.000  ;
   SIZE 12.231,51.800 ;
   FONT "MS Sans Serif", 8 ;
   title "Option" ;  
   fill file back.bmp;
   icon file icon5.ico; 
   color rgb(0,0,255,255,255,255) ;
   FLOAT NOCLOSE MINIMIZE SYSTEM  
MOVE WINDOW _qjnos CENTER
ACTIVATE WINDOW _qjnos 
@0,44.200 SAY "sc.bmp"BITMAP
@ 10.200,0.334 CLEAR TO 11.923,110.334
@ 10.200,0.334 TO 11.923,100.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@10.200,0.334 FILL TO 11.923,100.334 ;
	COLOR RGB(,,,255,255,128)
@10.200,1 SAY "msign2.bmp"BITMAP	;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@10.500,16 SAY "return to main menu.";
	FONT "MS Sans Serif", 9;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@10.500,8 SAY "<Esc>" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(255,0,0,128,128,0)   
@ 0.246,10.000 SAY "Option"  ;
   FONT "MS Sans Serif", 12 ;
   color rgb(0,128,0,255,255,255) ;
   STYLE "BTU"
@ 3.692,10.000 GET m.choice;
   PICTURE "@*V \<Barcode Label;Barcode \<Entry";
   SIZE 1.308,12.000,0.508 ;
   DEFAULT 1 ;
   FONT "MS Sans Serif", 10 ;
   COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
   STYLE "BT"
@10.292,40.000 GET m.ans;
   PICTURE "@*V \<Return";
   SIZE 1.208,6.000,.3;
   FONT "MS Sans Serif", 10;
   COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
   STYLE "BT"               
READ    
if readkey()=12 
   RELEASE WINDOW _qjnos  
   retu
endif
if m.ans=1
   RELEASE WINDOW _qjnos  
   retu
endif    
RELEASE WINDOW _qjnos  
	do case 
		case m.choice=1
	        do osinv
		case m.choice=2
	        do stkdiff
	endcase
RELEASE WINDOW _qjnos 
enddo
RETURN
