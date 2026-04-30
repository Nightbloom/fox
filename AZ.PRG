clos all
sele a
use stshade
repl all qty with 0
sele b
use stopen
go top
do while not eof()  
     sele a
	 loca for sh_code=b->sh_code
	 if found()
	   repl qty with qty+b->qty
    endif  
    sele b
    skip
enddo
clos all
     
