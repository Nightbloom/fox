clos all
sele a
use stshade
sele b
use 1sale
go top
do while not eof()
   sele a
   loca for sh_code=b->sh_code
   if found()
      sele b
      repl m_r_p with a->ex_rate
   endif
   sele b
   skip
enddo
clos all
      