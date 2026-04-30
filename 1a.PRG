clos all
sele a
use stopen
copy to 1open for inv_no>=32
use
use 1open excl
alter table 1open add colu gst_per n(5,2)
clos all

sele a
use item
set order to tag pd_code
sele b
use 1open
set rela to pd_code into a
repl all gst_per with a->t_per
clos all

sele b
use 1open
repl all ex_rate with (ex_rate*100)/(gst_per+100)

clos all

 
