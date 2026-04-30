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
store 0 to m.s_code,m.b_code,m.sh_code,m.pd_code,m.i_code,M.RATE
mopbal=0
mshd_code=1
sele a
use supplier
set order to tag s_name 
set order to tag s_code
sele b
use item
set order to tag pd_code
sele c
use stshade
*set order to tag qshsz
set rela to pd_code into b,s_code into a

DEFINE WINDOW _qjn12zbvh ;
   AT  0.000, 0.000  ;
   SIZE 20.231,56.800 ;
   FONT "MS Sans Serif", 8 ;
   title "Update M.R.P." ;
   fill file back.bmp;
   icon file icon5.ico;
   color rgb(0,0,255,255,255,255) ;
   FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh 
@0.0,16 SAY "M.R.P." ;
   FONT "MS Sans Serif", 12 ;
   STYLE "BTU" ;
   color rgb(0,128,0,255,255,255)
@0,49.200 say "sc.bmp"bitmap        
@2.5,0 say "Quality Code :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@4.5,4 say "Company :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@6.5,8 say "Item :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@8.5,6.500 say "Brand :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
sele c
*set order to tag qshsz
set rela to s_code into a,pd_code into b
@ 2.5,18 GET m.q_code pict "!!!!!!!!!!!!!!!!!!!!" ;
COLOR ,RGB(255,0,0,255,255,255)
read
if readkey()=12 or readkey()=268
   flag=.f.
    RELEASE WINDOW _qjn12zbvh
    clos all
	RETURN
 endif	 
loca for q_code=m.q_code
if found()
   m.pd_code=pd_code   
   m.s_code=s_code
else
   as=" "
   do message with as,"Quality code does not exist."," ","Warning"
   flag1=.f.
	loop
endif
@4.5,18 GET a->s_name pict "@!s30" ;
	COLOR ,RGB(255,0,0,255,255,255)
@ 6.5,18 GET b->item pict "@!s30" ;
	COLOR ,RGB(255,0,0,255,255,255)
@ 8.5,18 GET b->brand pict "@!s30" ;
	COLOR ,RGB(255,0,0,255,255,255)
	clear get
	
@10.5,6.500 say "M.R.P. :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@ 10.5,18 GET m.rate pict "99999.99" ;
	valid !empty(m.rate) ;
   size 1.769,9.667 ;
	COLOR ,RGB(255,0,0,255,255,255) ;
	error "Blank entry is not allowed"
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
set conf off
RELEASE WINDOW _qjn12zbvh
if m.prnt_btn=2
  if flock()
	   repl all m_r_p with m.rate for q_code=m.q_code
  endif
  unlock all	   
endif   
if m.prnt_btn=1
  RELEASE WINDOW _qjn12zbvh
   retu
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

