clos all
sele a
use 1abc
repl all qty with 0
sele b
use 2abc
go top
do while not eof()
   sele a
   loca for sh_code=b->sh_code
   if found()
      repl qty with b->balance
   else
      sele b   
      repl qty with 1
   endif
   sele b
   skip
enddo
clos all
      