clos all
sele a
use item
sele b
use 1hsn
go top
do while not eof()
   sele a
   loca for pd_code=b->pd_code
   if found()
      repl hsn_code with alltrim(b->hsn_code)
   endif
   sele b
   skip
enddo
clos all
      