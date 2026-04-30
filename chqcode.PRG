set date brit
set cent on
set safe off
set dele on
set excl off
set conf on
set exact on
public mshd_name
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record
PRIVATE s_date,l_date,hdlist
do while .t.
flag=.t.
mflag=.t.
flag1=.t.
s_date={}
l_date={}
mcrdr=space(2)
m.s_name=space(40)
m.brand=space(40)
m.item=space(40)
m.size=space(10)
m.style=space(20)
m.shade=space(15)
m.q_code=space(20)
m.colour=space(20)
store 0 to m.s_code,m.b_code,m.sh_code,m.pd_code,m.i_code,M.RATE,m.m_r_p,m.cl_code,m.sty_code,m.upcode
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
sele d
use sale
sele e
use purchase
sele f
use stock
sele g
use slretu
sele h
use purretu
sele 11
use upqcode
DEFINE WINDOW _qjn12zbvh ;
   AT  0.000, 0.000  ;
   SIZE 24.231,96.800 ;
   FONT "MS Sans Serif", 8 ;
   fill file back.bmp;
   icon file icon5.ico;
   title "Update Quality Code" ;
   color rgb(0,0,255,255,255,255) ;
   FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh 
@0.0,16 SAY "Quality Code" ;
   FONT "MS Sans Serif", 12 ;
   STYLE "BTU" ;
   color rgb(0,128,0,255,255,255)
@0,89.200 say "sc.bmp"bitmap        
for a=1 to 1
	@2.5,2 say "Bar Code :" ;
	   FONT "MS Sans Serif", 8 ;
	   STYLE "BT" 
	@2.5,50 say "Quality Code :" ;
	   FONT "MS Sans Serif", 8 ;
	   STYLE "BT"    
	@4.0,3 say "Company :" ;
	   FONT "MS Sans Serif", 8 ;
	   STYLE "BT" 
	@5.5,8 say "Item :" ;
	   FONT "MS Sans Serif", 8 ;
	   STYLE "BT" 
	@5.5,57.500 say "Brand :";
	   FONT "MS Sans Serif", 8;
	   STYLE "BT"
	@7.0,8 say "Shade:" ;
	   FONT "MS Sans Serif", 8 ;
	   STYLE "BT" 
	@7.0,34.500 say "Size  :" ;
	   FONT "MS Sans Serif", 8 ;
	   STYLE "BT" 	   
	@ 2.5,18 GET m.sh_code pict "99999999";
		COLOR ,RGB(255,0,0,255,255,255)
	read
	if readkey()=12 or readkey()=268
	   deac wind _qjn12zbvh
	   retu
	endif 
	sele a
	set order to tag s_code
	sele b
	set order to tag pd_code
	sele c	
	set rela to s_code into a,pd_code into b
 if m.sh_code#0	  
	loca for sh_code=m.sh_code
	if found()
	   m.q_code=q_code
	   m.s_code=s_code
	   m.i_code=i_code
	   m.b_code=b_code
	   m.sty_code=sty_code
	   m.shade=shade
	   m.m_r_p=m_r_p
	   m.pd_code=pd_code
	   @ 2.5,68 GET m.q_code pict "!!!!!!!!!!!!";
		  COLOR ,RGB(255,0,0,255,255,255)		  
	 else
	   as=" "
	   do message with as,"This Bar code does not exist."," ","Warning"
	   m.sh_code=0
	   a=0
	   loop
	 endif  
endif   
if m.sh_code=0
	@ 2.5,68 GET m.q_code pict "!!!!!!!!!!!!";
	  COLOR ,RGB(255,0,0,255,255,255)
	read
	if readkey()=12 or readkey()=268
	   deac wind _qjn12zbvh
	   clos all
	   retu
	endif
	loca for q_code=m.q_code
	if found()
	    m.s_name=a->s_name
	    m.item=b->item
	    m.brand=b->brand
		@4.0,18 GET a->s_name pict "@!";
			COLOR ,RGB(255,0,0,255,255,255)
		@ 5.5,18 GET b->item pict "@!";
		    size 1,25;
		    COLOR ,RGB(255,0,0,255,255,255)
		@ 5.5,68 GET b->brand pict "@!" ;
		    size 1,25;
			COLOR ,RGB(255,0,0,255,255,255)	
		m.b_code=b_code
		m.i_code=i_code			  
	    m.s_code=s_code
	    for aj=1 to 1
		    @ 22.200,0.334  CLEA TO 23.923,100.334
			@ 22.200,0.334 TO 23.923,100.334 ;
			    PEN 1, 8 ;
			    STYLE "1" COLOR RGB(128,,,255,255,255)
			@ 22.200,0.334 FILL TO 23.923,100.334 ;
				COLOR RGB(,,,255,255,128)
			@22.500,10 SAY "Return at Quality Code,Select the shade";
			     FONT "MS Sans Serif", 8 ;
				 STYLE "BT" ;
				 COLOR RGB(,,255,128,128,0)
			@22.500,3 SAY "<Esc>" ;
			     FONT "MS Sans Serif", 8;
				 STYLE "BT";
				 COLOR RGB(255,0,0,128,128,0)
			SELE C
		    SET ORDER TO
			SET FILTER TO
			SET FILTER TO b_code=m.b_code and q_code=ALLTRIM(m.q_code)
			go top
			set order to TAG qpdshade
			DEFINE POPUP pshade FROM 10,50 TO 20,70 PROMPT FIELD ALLTRIM(shade);
			SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Shade"
			ON SELECTION POPUP pshade DO entry1
			ACTI POPUP pshade			
			@ 7.0,18 GET m.shade pict "@!";
			   size 1,15;
			   COLOR ,RGB(255,0,0,255,255,255)
			clea gets   
			if m.shade="  "   
	           a=0
	           loop
	        endif
	    for aj1=1 to 1	   
		    @ 22.200,0.334  CLEA TO 23.923,100.334
			@ 22.200,0.334 TO 23.923,100.334 ;
			    PEN 1, 8 ;
			    STYLE "1" COLOR RGB(128,,,255,255,255)
			@ 22.200,0.334 FILL TO 23.923,100.334 ;
				COLOR RGB(,,,255,255,128)
			@22.500,10 SAY "Return at shade,Select the size";
			     FONT "MS Sans Serif", 8 ;
				 STYLE "BT" ;
				 COLOR RGB(,,255,128,128,0)
			@22.500,3 SAY "<Esc>" ;
			     FONT "MS Sans Serif", 8;
				 STYLE "BT";
				 COLOR RGB(255,0,0,128,128,0)	    
	        m.size="   "     
			SELE C
			SET ORDER TO
			SET FILTER TO
			SET FILTER TO ALLTRIM(q_code)=ALLTRIM(m.q_code) AND ALLTRIM(shade)=ALLTRIM(m.shade)
			GO TOP
			SET ORDER TO TAG SIZE
			DEFINE POPUP psize FROM 10,50 TO 20,70 PROMPT FIELD ALLTRIM(SIZE) ;
			SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Size"
			ON SELECTION POPUP psize DO entry2
			ACTI POPUP psize	    
			@ 7.0,45 GET m.size pict "@!" ;
			   size 1,10;
			   COLOR ,RGB(255,0,0,255,255,255)	    	    
			clea gets
			if m.size="   "
			  aj=0
			  m.shade="   "
			  loop
			endif  
		endfor &&aj1				   
		endfor &&aj				   
	else
	   as=" "
	   do message with as,"Quality code does not exist."," ","Warning"
	   m.sh_code=0
	   a=0
		loop
	endif
endif
endfor
m.s_code=s_code
m.i_code=i_code
m.b_code=b_code
m.sty_code=sty_code
m.cl_code=cl_code
m.pd_code=pd_code
m.s_Name=a->s_Name
m.item=b->item
m.brand=b->brand
m.shade=shade
m.size=size
m.style=style
m.colour=colour
@2.5,18 GET m.sh_code pict "99999999";
      COLOR ,RGB(255,0,0,255,255,255)	   
@4.0,18 GET a->s_name pict "@!";
	COLOR ,RGB(255,0,0,255,255,255)
@ 5.5,18 GET b->item pict "@!";
   size 1,25;
	COLOR ,RGB(255,0,0,255,255,255)
@ 5.5,68 GET b->brand pict "@!" ;
   size 1,25;
	COLOR ,RGB(255,0,0,255,255,255)
@7.0,8 say "Shade:" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@7.0,34.500 say "Size  :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@7.0,56.500 say "M.R.P. :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT"    
@ 7.0,18 GET shade pict "@!";
   size 1,15;
	COLOR ,RGB(255,0,0,255,255,255)
@ 7.0,45 GET size pict "@!" ;
   size 1,10;
	COLOR ,RGB(255,0,0,255,255,255)	
	clear get	
@ 7.0,68 GET m_r_P pict "99999.99" ;
   size 1.769,9.667 ;
  COLOR ,RGB(255,0,0,255,255,255) 
clea gets  
@8.5,6 say "Colour :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@8.5,58.500 say "Style :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@ 8.5,18 GET colour pict "@!";
   size 1,15;
	COLOR ,RGB(255,0,0,255,255,255)
@ 8.5,68 GET style pict "@!" ;
   size 1,10;
	COLOR ,RGB(255,0,0,255,255,255)	
clear get
@ 22.200,0.334  CLEA TO 23.923,100.334
@10.0,2.500 say "You want to change :";
   FONT "MS Sans Serif", 9;
   STYLE "BT"
@10.0,30.600 GET m.prnt_btn;
   PICTURE "@*HT Ca\<ncel;\<Ok ";
   SIZE 1.769,8.667,0.667;
   DEFAULT 1;
   FONT "MS Sans Serif", 9;
   STYLE "B"
read
if readkey()=12 or readkey()=268
   loop
endif   
if m.prnt_btn=1
   loop
endif   
@11.900,0.334 TO 11.900,95.334 ;
	PEN 1, 8 ;
	STYLE "1" COLOR RGB(128,,,255,255,255)
@14.0,3 say "Company :";
   FONT "MS Sans Serif", 8;
   STYLE "BT" 
@15.5,8 say "Item :";
   FONT "MS Sans Serif", 8;
   STYLE "BT" 
@15.5,57.500 say "Brand :";
   FONT "MS Sans Serif", 8;
   STYLE "BT"
@17.0,8 say "Shade:" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@17.0,34.500 say "Size  :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@17.0,56.500 say "M.R.P. :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT"       
@18.5,6 say "Colour :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT" 
@18.5,58.500 say "Style :" ;
   FONT "MS Sans Serif", 8 ;
   STYLE "BT"    	
@14.0,18 GET m.s_name pict "@!";
	COLOR ,RGB(255,0,0,255,255,255)
@15.5,18 GET m.item pict "@!";
   size 1,25;
	COLOR ,RGB(255,0,0,255,255,255)
@15.5,68 GET m.brand pict "@!" ;
   size 1,25;
	COLOR ,RGB(255,0,0,255,255,255)	
@17.0,18 GET m.shade pict "@!";
   size 1,15;
	COLOR ,RGB(255,0,0,255,255,255)
@17.0,45 GET m.size pict "@!" ;
   size 1,10;
	COLOR ,RGB(255,0,0,255,255,255)	
	clear get	
@17.0,68 GET m.m_r_P pict "99999.99" ;
   size 1.769,9.667 ;
  COLOR ,RGB(255,0,0,255,255,255) 	
@18.5,18 GET m.colour pict "@!";
   size 1,15;
	COLOR ,RGB(255,0,0,255,255,255)
@18.5,68 GET m.style pict "@!" ;
   size 1,10;
	COLOR ,RGB(255,0,0,255,255,255)		
clea gets	
for am=1 to 1
@12.0,2 say "Bar Code :" ;
	 FONT "MS Sans Serif", 8 ;
	 STYLE "BT" 
@12.5,50 say "Quality Code :" ;
	 FONT "MS Sans Serif", 8 ;
	 STYLE "BT"    
@12.5,18 GET m.sh_code pict "99999999" ;
	COLOR ,RGB(255,0,0,255,255,255)
clea gets
@ 12.5,68 GET m.q_code pict "!!!!!!!!!!!!";
   COLOR ,RGB(255,0,0,255,255,255)
read		  
if readkey()=12 or readkey()=268
   mflag=.f.  
   exit
endif    
for am1= 1 to 1
@ 22.200,0.334  CLEA TO 23.923,100.334
@ 22.200,0.334 TO 23.923,100.334 ;
     PEN 1, 8 ;
	 STYLE "1" COLOR RGB(128,,,255,255,255)
@ 22.200,0.334 FILL TO 23.923,100.334 ;
	 COLOR RGB(,,,255,255,128)
@22.500,10 SAY "Return at Quality Code,Select the field";
     FONT "MS Sans Serif", 8 ;
	 STYLE "BT" ;
	 COLOR RGB(,,255,128,128,0)
@22.500,3 SAY "<Esc>" ;
     FONT "MS Sans Serif", 8;
	 STYLE "BT";
	 COLOR RGB(255,0,0,128,128,0)
	 m.upcode=0
	 sele 11
 	 DEFINE POPUP hcomp FROM 8,60 TO 22,95 PROMPT FIELD ALLTRIM(upqcode);
 	 SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Field Name"
  	 ON SELE POPUP hcomp DO entry6
	 ACTI POPUP hcomp	 	 
    if m.upcode=1
		@ 22.200,0.334  CLEA TO 23.923,100.334
		@ 22.200,0.334 TO 23.923,100.334 ;
    		 PEN 1, 8 ;
			 STYLE "1" COLOR RGB(128,,,255,255,255)
		@ 22.200,0.334 FILL TO 23.923,100.334 ;
			 COLOR RGB(,,,255,255,128)
		@22.500,10 SAY "Return at field selection,enter the shade";
    		 FONT "MS Sans Serif", 8;
			 STYLE "BT";
			 COLOR RGB(,,255,128,128,0)
		@22.500,3 SAY "<Esc>";
	    	 FONT "MS Sans Serif", 8;
			 STYLE "BT";
			 COLOR RGB(255,0,0,128,128,0)   					 
		@17.0,18 GET m.shade pict "@!";
		   size 1,15;
		   COLOR ,RGB(255,0,0,255,255,255)
		read
		if readkey()=12 or readkey()=268 or m.shade="  "
		   am1=0
		   loop
		endif			    
	endif	
  if m.upcode=2
	@ 22.200,0.334  CLEA TO 23.923,100.334
	@ 22.200,0.334 TO 23.923,100.334 ;
    	 PEN 1, 8 ;
		 STYLE "1" COLOR RGB(128,,,255,255,255)
	@ 22.200,0.334 FILL TO 23.923,100.334 ;
		 COLOR RGB(,,,255,255,128)
	@22.500,10 SAY "Return at field selection,Select the size";
    	 FONT "MS Sans Serif", 8;
		 STYLE "BT";
		 COLOR RGB(,,255,128,128,0)
	@22.500,3 SAY "<Esc>";
    	 FONT "MS Sans Serif", 8;
		 STYLE "BT";
		 COLOR RGB(255,0,0,128,128,0)   		
	SELE B
	SET ORDER TO
	SET FILTER TO
	SET FILTER TO b_code=m.b_code
	GO TOP
	SET ORDER TO TAG SIZE
	DEFINE POPUP psize FROM 8,60 TO 22,95 PROMPT FIELD ALLTRIM(SIZE);
	SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Size"
	ON SELECTION POPUP psize DO entry2
	ACTI POPUP psize		 
	@17.0,45 GET m.size pict "@!" ;
	   size 1,10;
	   COLOR ,RGB(255,0,0,255,255,255)		
	clea gets		
	if m.pd_code=0
	   am1=0
	   loop
	endif		
 endif	
    if m.upcode=5
		@ 22.200,0.334  CLEA TO 23.923,100.334
		@ 22.200,0.334 TO 23.923,100.334 ;
    		 PEN 1, 8 ;
			 STYLE "1" COLOR RGB(128,,,255,255,255)
		@ 22.200,0.334 FILL TO 23.923,100.334 ;
			 COLOR RGB(,,,255,255,128)
		@22.500,10 SAY "Return at size,enter the m.r.p.";
    		 FONT "MS Sans Serif", 8;
			 STYLE "BT";
			 COLOR RGB(,,255,128,128,0)
		@22.500,3 SAY "<Esc>";
    		 FONT "MS Sans Serif", 8;
			 STYLE "BT";
			 COLOR RGB(255,0,0,128,128,0)   			
		@17.0,68 GET m.m_r_P pict "99999.99";
		   size 1.769,9.667;
		   COLOR ,RGB(255,0,0,255,255,255)
		read  
		if readkey()=12 or readkey()=268 
		   am1=0
		   loop
		endif   	
	endif
    if m.upcode=3
		@ 22.200,0.334  CLEA TO 23.923,100.334
		@ 22.200,0.334 TO 23.923,100.334 ;
    		 PEN 1, 8 ;
			 STYLE "1" COLOR RGB(128,,,255,255,255)
		@ 22.200,0.334 FILL TO 23.923,100.334 ;
			 COLOR RGB(,,,255,255,128)
		@22.500,10 SAY "Return at field selection,select the colour";
    		 FONT "MS Sans Serif", 8;
			 STYLE "BT";
			 COLOR RGB(,,255,128,128,0)
		@22.500,3 SAY "<Esc>";
    		 FONT "MS Sans Serif", 8;
			 STYLE "BT";
			 COLOR RGB(255,0,0,128,128,0)   				
		m.colour=SPACE(10)
		SELE 14
		SET ORDER TO TAG COLOUR
		DEFINE POPUP pcolour FROM 10,40 TO 27,65 PROMPT FIELD ALLTRIM(COLOUR);
		TITLE "Colour" SHADOW  SCROLL MARGIN MARK CHR(16)
		ON SELECTION POPUP pcolour DO entry8
		ACTIVATE POPUP	pcolour		 
		@18.5,18 GET m.colour pict "@!";
		   size 1,15;
		   COLOR ,RGB(255,0,0,255,255,255)
		clea gets	   
		if m.cl_code=0	
		   am6=0
		   loop
		endif
	endif	
    if m.upcode=4
		@ 22.200,0.334  CLEA TO 23.923,100.334
		@ 22.200,0.334 TO 23.923,100.334 ;
    		 PEN 1, 8 ;
			 STYLE "1" COLOR RGB(128,,,255,255,255)
		@ 22.200,0.334 FILL TO 23.923,100.334 ;
			 COLOR RGB(,,,255,255,128)
		@22.500,10 SAY "Return at colour,select the style";
    		 FONT "MS Sans Serif", 8;
			 STYLE "BT";
			 COLOR RGB(,,255,128,128,0)
		@22.500,3 SAY "<Esc>";
    		 FONT "MS Sans Serif", 8;
			 STYLE "BT";
			 COLOR RGB(255,0,0,128,128,0)   					   
		sele 13	 
		DEFINE POPUP pstyle FROM 10,65 TO 20,85 PROMPT FIELD ALLTRIM(style);
		SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Style"
		ON SELECTION POPUP pstyle DO entry7
		ACTI POPUP pstyle		 
	@18.5,68 GET style pict "@!" ;
	   size 1,10;
	  COLOR ,RGB(255,0,0,255,255,255)	
	clear get	
	if m.sty_code=0 
 	   am1=0
	   loop
	endif   
endif	
    if m.upcode=6
       for am2=1 to 1
			@ 22.200,0.334  CLEA TO 23.923,100.334
			@ 22.200,0.334 TO 23.923,100.334 ;
    			 PEN 1, 8 ;
				 STYLE "1" COLOR RGB(128,,,255,255,255)
			@ 22.200,0.334 FILL TO 23.923,100.334 ;
				 COLOR RGB(,,,255,255,128)
			@22.500,10 SAY "Return at field,select the item";
    			 FONT "MS Sans Serif", 8;
				 STYLE "BT";
				 COLOR RGB(,,255,128,128,0)
			@22.500,3 SAY "<Esc>";
    			 FONT "MS Sans Serif", 8;
				 STYLE "BT";
				 COLOR RGB(255,0,0,128,128,0)
			sele b
			set filter to s_code=m.s_code
			go top
			SET ORDER TO TAG item
			DEFINE POPUP pbrand FROM 10,40 TO 27,65 PROMPT FIELD ALLTRIM(item);
			SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Item"
			ON SELECTION POPUP pbrand DO entry3
			ACTI POPUP pbrand
			@15.5,18 GET m.item pict "@!";
			   size 1,25;
			   COLOR ,RGB(255,0,0,255,255,255)
			clea gets	
			if m.i_code=0 
		 	   am1=0
			   loop
			endif
       for am3=1 to 1
			@ 22.200,0.334  CLEA TO 23.923,100.334
			@ 22.200,0.334 TO 23.923,100.334 ;
    			 PEN 1, 8 ;
				 STYLE "1" COLOR RGB(128,,,255,255,255)
			@ 22.200,0.334 FILL TO 23.923,100.334 ;
				 COLOR RGB(,,,255,255,128)
			@22.500,10 SAY "Return at item,select the brand";
    			 FONT "MS Sans Serif", 8;
				 STYLE "BT";
				 COLOR RGB(,,255,128,128,0)
			@22.500,3 SAY "<Esc>";
    			 FONT "MS Sans Serif", 8;
				 STYLE "BT";
				 COLOR RGB(255,0,0,128,128,0)			
			SELE B
			SET ORDER TO
			SET FILTER TO
			SET FILTER TO i_code=m.i_code
			GO TOP
			SET ORDER TO TAG  brand 
			GO TOP
			DEFINE POPUP pproduct FROM 10,40 TO 27,65 PROMPT FIELD ALLTRIM(brand) ;
			TITLE "Brand" SHADOW  SCROLL MARGIN MARK CHR(16)
			ON SELECTION POPUP pproduct DO entry4
			ACTI POPUP pproduct			
			@15.5,68 GET m.brand pict "@!" ;
			   size 1,25;
			   COLOR ,RGB(255,0,0,255,255,255)	
			 clea gets  
			if m.b_code=0 
			   m.i_code=0
		 	   am2=0
			   loop
			endif
       for am4=1 to 1
			@ 22.200,0.334  CLEA TO 23.923,100.334
			@ 22.200,0.334 TO 23.923,100.334;
    			 PEN 1, 8;
				 STYLE "1" COLOR RGB(128,,,255,255,255)
			@ 22.200,0.334 FILL TO 23.923,100.334;
				 COLOR RGB(,,,255,255,128)
			@22.500,10 SAY "Return at brand,select the size";
    			 FONT "MS Sans Serif", 8;
				 STYLE "BT";
				 COLOR RGB(,,255,128,128,0)
			@22.500,3 SAY "<Esc>";
    			 FONT "MS Sans Serif", 8;
				 STYLE "BT";
				 COLOR RGB(255,0,0,128,128,0)		
			SELE B
			SET ORDER TO
			SET FILTER TO
			SET FILTER TO b_code=m.b_code
			GO TOP
			SET ORDER TO TAG SIZE
			DEFINE POPUP psize FROM 10,40 TO 20,55 PROMPT FIELD ALLTRIM(SIZE);
			SHADOW SCROLL MARGIN MARK CHR(16) TITLE "Size"
			ON SELECTION POPUP psize DO entry5
			ACTI POPUP psize			
			@17.0,45 GET m.size pict "@!" ;
			  size 1,10;
			  COLOR ,RGB(255,0,0,255,255,255)				
 		    clea gets 
 		    if m.pd_code=0
 		       m.b_code=0
 		       am3=0
 		       loop
 		    endif   
		endfor &&am4
	endfor &&am3
 endfor &&am2
endif	
m.ans=0
@20.0,2.500 say "You want to change more field :";
   FONT "MS Sans Serif", 9 ;
   STYLE "BT" 	
@20.0,45.600 GET m.ans;
   PICTURE "@*HT \<Ok;Ca\<ncel";
   SIZE 1.769,8.667,0.667;
   DEFAULT 1;
   FONT "MS Sans Serif", 9;
   STYLE "B"
read 
if m.ans=1
   am1=0
   loop
endif   
endfor &&am1
endfor &&am
if mflag=.f.
   loop
endif  
@20.0,2.500 clea to 22.0,100
m.ans=0
@20.0,2.500 say "You want to save :";
   FONT "MS Sans Serif", 9 ;
   STYLE "BT" 	
@20.0,30.600 GET m.ans;
   PICTURE "@*HT \<Ok;Ca\<ncel" ;
   SIZE 1.769,8.667,0.667 ;
   DEFAULT 1 ;
   FONT "MS Sans Serif", 9 ;
   STYLE "B"
read
if m.ans=2
   loop
endif   
RELEASE WINDOW _qjn12zbvh
if m.ans=1
if m.i_code#0 and m.b_code#0 and m.pd_code#0
   sele d
   repl all s_code with m.s_code,i_code with m.i_code,b_code with m.b_code,pd_code with m.pd_code,;
   size with alltrim(m.size),shade with alltrim(m.shade),q_code with alltrim(m.q_code) for sh_code=m.sh_code
   
   sele e
   repl all s_code with m.s_code,i_code with m.i_code,b_code with m.b_code,pd_code with m.pd_code,;
   size with alltrim(m.size),shade with alltrim(m.shade),q_code with alltrim(m.q_code),m_r_p with m.m_r_p for sh_code=m.sh_code   
   
   sele f
   repl all i_code with m.i_code,b_code with m.b_code,pd_code with m.pd_code,;
   size with alltrim(m.size),shade with alltrim(m.shade),q_code with alltrim(m.q_code) for sh_code=m.sh_code
   
   sele g
   repl all s_code with m.s_code,i_code with m.i_code,b_code with m.b_code,pd_code with m.pd_code,;
   size with alltrim(m.size),shade with alltrim(m.shade),q_code with alltrim(m.q_code),m_r_p with m.m_r_p for sh_code=m.sh_code
   
   sele c
   set order to
   set filter to
   repl all s_code with m.s_code,i_code with m.i_code,b_code with m.b_code,pd_code with m.pd_code,;
   size with alltrim(m.size),shade with alltrim(m.shade),q_code with alltrim(m.q_code),m_r_p with m.m_r_p for sh_code=m.sh_code   
  
endif   
endif
enddo   
RETURN

PROC entry6
m.upcode=upqcd
DEAC POPUP hcomp
RETU

PROC entry3
m.item=item
m.i_code=i_code
DEAC POPUP pbrand
RETU

PROC entry4
m.brand=brand
m.b_code=b_code
DEAC POPUP pproduct
RETU

PROC entry5
m.size=SIZE
m.pd_code=pd_code
DEAC POPUP psize
RETU

PROC entry7
m.sty_code=sty_code
m.style=style
DEAC POPUP pstyle
RETU

PROC entry8
m.cl_code=cl_code
m.colour=colour
DEAC POPUP pcolour
RETU

proc entry1
m.shade=shade
DEAC POPUP pshade
RETU

PROC entry2
m.size=SIZE
m.pd_code=pd_code
m.sh_code=sh_code
DEAC POPUP psize
RETU