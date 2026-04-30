      m.mobno=9810786655
	  sele j
 	  use sendsms
	  dele all
	  appe blank
*	  repl refno with alltrim(str(inv_no))
	  repl to with alltrim(str(m.mobno))
	  repl msg with "Dear Customer, Thanks for your order of Custom Tailoring to us.We hope to give you desired fit and timely delivery. Do check readiness of order on phone before coming ,on due date,if possible. Regards Team Raymond . MGF Mall"
	  brow
	  copy to sendsms.xls type xl5
	  !sendsms.exe
	  retu
	  

