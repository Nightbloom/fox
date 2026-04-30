clos all
sele a
use stshade
sele b
use 1abc
go top
do while not eof()
    sele a
    loca for sh_code=b->sh_code
    if found()
         sele b
         repl ex_rate with a->ex_rate
         repl ex_amount with ex_rate*qty
    endif
    sele b
    skip
    enddo
    clos all
          