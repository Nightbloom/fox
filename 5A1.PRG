clos all
sele a
use item
sele b
use 1abc
go top
do while not eof()
    sele a
    loca for b_code=b->b_code
    if found()
       sele b       
       repl ITEM WITH A->ITEM,BRAND WITH A->BRAND
       ENDIF
       SELE B
       SKIP
       ENDDO
       CLOS ALL
       
      
      
       