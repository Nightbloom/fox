*:******************************************************************************
*: Procedure file: C:\VA\ROHIT\TOOLS.PRG
*:         System: TRADING INVOICE AND STOCK
*:         Author: SANJIV,AJAY,VIJAY
*:      Copyright (c) JUNE-1997, SOLVENT-C
*:  Last modified: 04/07/97 at 16:16:10
*:
*:         Set by: BTN_VAL            (procedure in MAINSCRN.PRG)
*:
*:          Calls: PDIALOG            (procedure in INVMAIN.PRG)
*:               : JBACKUP.PRG
*:               : JRECALL.PRG
*:               : JREINDEX.PRG
*:               : JRESET.PRG
*:               : JRSTPASS.PRG
*:
*:      Documented 22:02:48                                FoxDoc version 3.00a
*:*****************************************************************************
*CLEAR
do while .t.
SET TALK OFF
SET CLOCK OFF
set dele on
set excl off
CLOSE ALL
STORE 1 TO m.p_output
STORE 2 TO m.prnt_btn
DO pdialog
IF m.prnt_btn=2
   RETURN
ENDIF
DO CASE
CASE m.p_output=1
   DO expense
CASE m.p_output=2
   DO entexp
CASE m.p_output=3
  DO rrkamt
*  DO raentexp     
*ASE m.p_output=4
*   DO cklab
*  do rakamt
*ASE m.p_output=5 
ENDCASE
enddo
*!*****************************************************************************
*!
*!      Procedure: PDIALOG
*!
*!      Called by: TOOLS.PRG                         
*!               : PRINTREC           (procedure in INVMAIN.PRG)
*!               : PRINTINV           (procedure in INVMAIN.PRG)
*!               : STATUSREPO         (procedure in MANUF.PRG)
*!               : JBACKUP.PRG                       
*!               : JRECALL.PRG                       
*!               : PRINT_REP          (procedure in INVREP.PRG)
*!
*!*****************************************************************************
PROCEDURE pdialog
DEFINE WINDOW _qjn12zbvh ;
   AT  0.000, 0.000  ;
   SIZE 12.231,63.800 ;
   fill file back.bmp;
   icon file icon5.ico;   
   FONT "MS Sans Serif", 8 ;
   FLOAT NOCLOSE MINIMIZE SYSTEM ;
   title "Option"
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh NOSHOW
@0.0,56.400 say "sc.bmp"bitmap
@ 0.146,19.000 SAY "Option:"  ;
   FONT "MS Sans Serif", 12 ;
   STYLE "BUT" ;
   COLOR RGB(0,128,0,255,255,255) 
@ 2.692,17.000 GET m.p_output ;
   PICTURE "@*RVN A\<ccount;Ra\<ymond Voucher";
   SIZE 1.308,12.000,0.308 ;
   DEFAULT 1 ;
   FONT "MS Sans Serif", 10 ;
   STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,b/B,W/R
@ 9.254,16.600 GET m.prnt_btn ;
   PICTURE "@*HT \<OK;Ca\<ncel" ;
   SIZE 1.769,8.667,0.667 ;
   DEFAULT 1 ;
   FONT "MS Sans Serif", 10 ;
   STYLE "B"
ACTIVATE WINDOW _qjn12zbvh
READ CYCLE MODAL
RELEASE WINDOW _qjn12zbvh
RETURN

*: EOF: TOOLS.PRG
*   PICTURE "@*RVN A\<ccount;Ra\<ymond Voucher; \<R.A.Tailor Voucher;\<Karigar Labour;Raymond \<Staff Voucher";