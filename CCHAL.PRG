do while .t.
clos all
store 0 to m.shl,m.ans
DEFINE WINDOW _qjn12zbvh;
   AT  0.000, 0.000;
   SIZE 11.031,50.800;
   FONT "MS Sans Serif", 8;
   fill file back.bmp;
   title "Store Challan";   
   color rgb(0,0,255,255,255,255) ;
   	icon file icon5.ico;
   FLOAT NOCLOSE SYSTEM  
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh 
@ 9.200,0.334 CLEAR TO 10.923,110.334
@ 9.200,0.334 TO 10.923,100.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@9.200,0.334 FILL TO 10.923,100.334 ;
	COLOR RGB(,,,255,255,128)
@9.200,1 SAY "msign2.bmp"BITMAP	;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@9.500,16 SAY "return to main menu.";
	FONT "MS Sans Serif", 9;
	STYLE "BT" ;
	COLOR RGB(,,255,128,128,0)
@9.500,8 SAY "<Esc>" ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(255,0,0,128,128,0)   
m.schl=0
@0,42.200 SAY "sc.bmp"BITMAP
@ 0.446,15.000 SAY "Option";
   FONT "MS Sans Serif", 12;
   color rgb(0,128,0,255,255,255);
   STYLE "BTU"   
@ 3.592,10.000 GET m.schl;
   PICTURE "@*V Store Challan \<Issue;Store \<Challan Receive";
   SIZE 1.308,8.000,0.908;
   FONT "MS Sans Serif", 11 ;
   COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
   STYLE "BT"
@9.292,40.000 GET m.ans;
   PICTURE "@*V \<Return";
   SIZE 1.208,6.000,.3;
   FONT "MS Sans Serif", 10;
   COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R ;
   STYLE "BT"               
READ 
if readkey()=12 
   RELEASE WINDOW _qjn12zbvh
   retu
endif
if m.ans=1
   RELEASE WINDOW _qjn12zbvh
   retu
endif    
RELEASE WINDOW _qjn12zbvh
do case
   case m.schl=1
        do chisinv
   case m.schl=2
        do chrvinv
endcase         		
RELEASE WINDOW _qjn12zbvh
enddo
