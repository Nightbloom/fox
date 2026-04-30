clos all
sele a
use 1hsn
sele b
use item
go top
do while not eof()
   sele a
   loca for pd_code=b->pd_code
   if found()
      sele b
      repl hsn_code with a->hsn_code
    endif
    sele b
    skip
enddo
clos all
      