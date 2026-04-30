clos all
store 0 to a,b
				@1.800,30 GET a ;
					SIZE 1.000,6.000 ;
					DEFAULT " " ;
					FONT "MS Sans Serif", 8 ;
					PICTURE "999999" ;
					ERROR "Blank entry is not allowed" ;
					COLOR ,RGB(255,0,0,255,255,255)
				read
				if a>20
				   if mod(a,20)=0
				      b=a/20
				   else
				      b=a/20
				      b=b+1
				   endif
				endif
wait wind "No. of Page"+space(1)+str(b)				         	
				      
