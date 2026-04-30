set date brit
set cent on
set safe off
set dele on
set excl off
set exact on
flag=.t.
flag1=.t.
public mshd_name
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record
PRIVATE s_date,l_date,hdlist
do while .t.
s_date={}
l_date={}
mcrdr=space(2)
m.s_name=space(40)
m.brand=space(40)
m.item=space(40)
m.size=space(10)
m.shade=space(15)
m.q_code=space(20)
store 0 to m.s_code,m.b_code,m.sh_code,m.pd_code,m.i_code,M.RATE,m.gir_no,m.ex_per,m.disc_amt
mopbal=0
mshd_code=1
sele a
use dealer
sele b
use pur_sum
sele c
use purchase
sele d
use sale
sele e
use stshade
sele c
flname=space(8)
flname=sys(3)
copy stru to &flname
sele f
use &flname excl
zap
DEFINE WINDOW _qjn12zbvh ;
   AT  0.000, 0.000  ;
   SIZE 26.231,86.800 ;
   FONT "MS Sans Serif", 8 ;
   title "Update GIR Discount" ;
   fill file back.bmp;
   icon file icon5.ico;
   color rgb(0,0,255,255,255,255) ;
   FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh 
@0.0,16 SAY "GIR Update" ;
   FONT "MS Sans Serif", 12 ;
   STYLE "BTU" ;
   color rgb(0,128,0,255,255,255)
@0,79.200 say "sc.bmp"bitmap        
@2.5,0 say "G.I.R. No. :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@ 2.5,18 GET m.gir_no pict "99999999" ;
COLOR ,RGB(255,0,0,255,255,255)
read
if readkey()=12 or readkey()=268 or m.gir_no=0
   flag=.f.
    RELEASE WINDOW _qjn12zbvh
    clos all
	RETURN
 endif	 
sele a
set order to tag d_code
sele b
set rela to d_code into a
loca for gir_no=m.gir_no
if found()
   scat memvar memo
else
   as=" "
   do message with as,"This GIR No. does not exist."," ","Warning"
   flag1=.f.
	loop
endif
@2.5,40 say "G.I.R. Date :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@ 2.5,55 GET m.gir_dt pict "@E" ;
	COLOR ,RGB(255,0,0,255,255,255)
@4.5,3 say "Supplier :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
m.s_name=space(50)   
sele a
loca for d_code=m.d_code
if found()	
   m.s_Name=d_name
endif   
@4.5,18 GET m.s_name pict "@!s30" ;
	COLOR ,RGB(255,0,0,255,255,255)
	clear get
@6.5,0 say "Invoice No.:" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@ 6.5,18 GET m.pinv_no pict "@!" ;
COLOR ,RGB(255,0,0,255,255,255)
@6.5,40 say "Inv. Date  :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@ 6.5,55 GET m.pinv_dt pict "99999999" ;
COLOR ,RGB(255,0,0,255,255,255)
@8.5,0 say "Grand Total:" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@ 8.5,18 GET m.gtotal pict "99999999.99";
	cOLOR ,RGB(255,0,0,255,255,255)
@8.5,40 say "Total Qty. :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@ 8.5,55 GET m.tqty pict "99999999" ;
	cOLOR ,RGB(255,0,0,255,255,255)
clea gets	
@11.5,2.500 say "Discount :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@11.5,18 GET m.disc_amt pict "999999.99";
    size 1,11;
	cOLOR ,RGB(255,0,0,255,255,255)	
read
m.ex_per=0-((tamt-(gtotal-m.disc_amt))*100/tamt)
@11.5,40.000 say "Ex.Mail %:" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@11.5,55 GET m.ex_per pict "999999.999";
    size 1,11;
	cOLOR ,RGB(255,0,0,255,255,255)		
@14.5,2.500 say "Are you sure :" ;
   FONT "MS Sans Serif", 12 ;
   STYLE "BT" 	
@ 14.5,25.600 GET m.prnt_btn ;
   PICTURE "@*HT Ca\<ncel;\<Ok " ;
   SIZE 1.769,8.667,0.667 ;
   DEFAULT 1 ;
   FONT "MS Sans Serif", 10 ;
   STYLE "B"
read
if m.prnt_btn=2
   sele f 
   use &flname excl
   zap
   appe from purchase for gir_no=m.gir_no
   go top
   do while not eof()
	   if m.ex_per#0			
    	  repl ex_rate with rate+rate*m.ex_per/100
	      repl ex_amount with ex_rate*qty
	      repl ex_per with m.ex_per
	   else
    	  repl ex_rate with rate
	      repl ex_amount with qty*ex_rate
	      repl ex_per with m.ex_per
	    endif
    	skip
    enddo   
 store 0 to m.gtotal1,m.examt    
 sum ex_amount to m.examt
 m.gtotal1=m.gtotal-m.disc_amt   
@18.5,0 say "Grand Total:" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@18.5,18 GET m.gtotal1 pict "99999999.99";
	cOLOR ,RGB(255,0,0,255,255,255)
@18.5,40.000 say "Ex.Mail Amt.:" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@18.5,55 GET m.examt pict "9999999.99";
    size 1,11;
	cOLOR ,RGB(255,0,0,255,255,255)	
clea gets	   
m.ans=0
m.ans=1
@22.5,2.500 say "Save this GIR:" ;
   FONT "MS Sans Serif", 12 ;
   STYLE "BT" 	
@ 22.5,25.600 GET m.ans;
   PICTURE "@*HT Ca\<ncel;\<Ok " ;
   SIZE 1.769,8.667,0.667 ;
   DEFAULT 1 ;
   FONT "MS Sans Serif", 10 ;
   STYLE "B"
read
if m.ans=1
  RELEASE WINDOW _qjn12zbvh
   retu
endif
sele c
set order to
set filter to
set filter to gir_no=m.gir_no
go top
do while not eof()
   if m.ex_per#0			
   	  repl ex_rate with rate+rate*m.ex_per/100
	  repl ex_amount with ex_rate*qty
	  repl ex_per with m.ex_per
   else
   	  repl ex_rate with rate
	  repl ex_amount with qty*ex_rate
	  repl ex_per with m.ex_per
	endif
    skip
enddo   
sele b
loca for gir_no=m.gir_no
if found()
   repl disc_amt with m.disc_amt,gtotal with m.gtotal1,tex_amt with m.examt
endif
sele c
set order to
set filter to
set filter to gir_no=m.gir_no
go top
do while not eof()
   sele e
   loca for sh_code=c->sh_code
   if found()
      repl ex_rate with c->ex_rate
   endif
   sele d
   repl all ex_rate with c->ex_rate for sh_code=c->sh_code
   repl all ex_amt with ex_rate*sl_qty for sh_code=c->sh_code
   sele c
   skip
enddo
endif
enddo   
RETURN


proc entry4
m.shade=shade
deac popup pshade
retu

proc entry5
m.size=size
m.sh_code=sh_code
m.pd_code=pd_code
m.q_code=q_code
deac popup psize
retu

