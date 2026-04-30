clos all
sele a
use cust
set order to tag c_code
sele b
use 1slsum
set rela to c_code into a
copy field inv_no,inv_dt,a->C_name,a->c_add1,a->c_add2,a->C_gst,gtotal to mgfsale type xls
clos all
