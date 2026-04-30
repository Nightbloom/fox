clos all
sele a
use item
set order to tag pd_code
sele b
use sale
set filter to pd_code#0
go top 
do while not eof()
   m.mrp=0
   sele a
   loca for pd_code=b->pd_code
   if found()
     if b->d_per#0 and b->d_amt#0
	    m.mrp=b->m_r_p-b->m_r_p*b->d_per/100
	 endif   
	 if b->d_per=0 and b->d_amt#0
	    m.mrp=b->m_r_p-b->d_amt
     endif   
	 if b->d_per=0 and b->d_amt=0
	    m.mrp=b->m_r_p
	 endif   				      							
	 if mrp_gst=1
	   if m.mrp<=mrp_limit
	      repl b->t_per with mrpgst_Per
       else
		  repl b->t_per with t_per
       endif
     else				   		
		  repl b->t_per with t_per
      endif   							   
   endif
   sele b
   skip
enddo      
						

clos all
sele a
use sale 
set order to tag inv_type
total on str(inv_no)+str(t_type) to abc field sl_qty,sl_amt
clos all

sele a
use sale_sum 
repl t_tamt with 0,p_tamt with 0,e_tamt with 0 
sele b
use abc
go top
do while not eof()
   sele a
   loca for inv_no=b->inv_no
   if found()
      do case
         case b->t_type=1
              repl t_tamt with b->sl_amt
         case b->t_type=2
              repl p_tamt with b->sl_amt             
         case b->t_type=3
              repl e_tamt with b->sl_amt                            
       endcase
    endif
    sele b
    skip
enddo
clos all              
