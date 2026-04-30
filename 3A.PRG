clos all
sele a
use stshade
sele b
use sale
set filter to month(inv_dt)=12
go top
do while not eof()
   sele a
   loca for sh_code=b->sh_code
   if found()
      sele b
      repl ex_rate with a->ex_rate
      repl ex_amt with ex_rate*sl_qty
   endif
   sele b
   skip
enddo
clos all
