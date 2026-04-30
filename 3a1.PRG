clos all
sele a
use purch excl
index on sh_code tag sh_code
sele b
use 1abc excl
index on sh_code tag sh_code
go top
do while not eof()
   sele a
   seek b->sh_code
   if found()
      sele b
      repl pinv_no with a->pinv_no,pinv_dt with a->pinv_dt
   endif
   sele b
   skip
enddo
clos all
     
