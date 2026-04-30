clos all
sele a
use stshade
sele b
use stopen
go top
do while not eof()
   sele a
   loca for sh_code=b->sh_code
   if found()
      sele b
      repl ex_rate with a->Ex_rate,m_r_P with a->m_r_p
      repl amt with qty*ex_rate
   endif
   sele b
   skip
enddo
clos all
sele a
use stopen
d=1
t=1
do while not eof()
   sele a
   repl inv_no with t
   skip
   d=d+1
   if d>500
      t=t+1
      d=1
   endif
enddo
clos all
      
      

