clos all
sele a
use supplier
set order to tag s_code
sele b
use 1item
set rela to s_code into a
copy field a->S_name,item,brand,size,hsn_code to prdhsn type xls
clos all

