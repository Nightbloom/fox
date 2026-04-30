clos all
sele a
use dealer
set order to tag d_code
sele b
use supplier
set order to tag s_code
sele c
use item
set order to tag pd_code
sele d
use 1abc excl
index on str(s_code)+str(i_code)+str(b_code)+q_code+shade+size tag all
set rela to d_code into a,s_code into b,pd_code into c
copy field a->D_Name,b->s_name,c->item,c->brand,q_code,shade,size,m_r_p,qty,pack_date,sh_code to stock_pack type xls
clos all
