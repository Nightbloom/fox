clos all
sele a
use stp
*quit
if bdate#date()
   sele a
   do case
      case bno=1
            clos all
            use stp
            repl bno with 2
      case bno=2
            clos all
            use stp           
            repl bno with 3            
       case bno=3
            clos all
            use stp 
            repl bno with 1
    endcase
    repl bdate with date()
endif      
*!*	  do case
*!*	      case bno=1
*!*	            @0,0 say "rymd2.bmp"bitmap
*!*	      case bno=2
*!*	            @0,0 say "rymd2.bmp"bitmap
*!*	       case bno=3
*!*	           @0,0 say "rymd3.bmp"bitmap
*!*	   endcase          
retu