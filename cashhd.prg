clos all
store 0 to m.ur_view,m.ur_add,m.ur_edit,m.ur_dele
use userrght
loca for u_code=mu_code and op_code=6
if found()
   scat memvar
endif
if m.ur_view#1   
   do mright
   clos all
   retu
endif
clos all

#REGION 1
PRIVATE wzfields,wztalk
IF SET("TALK") = "ON"
	SET TALK OFF
	m.wztalk = "ON"
ELSE
	m.wztalk = "OFF"
ENDIF
m.wzfields=SET('FIELDS')
SET FIELDS OFF
IF m.wztalk = "ON"
	SET TALK ON
ENDIF
#REGION 0
REGIONAL m.currarea, m.talkstat, m.compstat
set cent on

IF SET("TALK") = "ON"
	SET TALK OFF
	m.talkstat = "ON"
ELSE
	m.talkstat = "OFF"
ENDIF
m.compstat = SET("COMPATIBLE")
SET COMPATIBLE FOXPLUS
m.rborder = SET("READBORDER")
SET readborder ON
m.currarea = SELECT()
SET SAFE OFF
set dele on
set excl off
*       *********************************************************
*       *
*       *     S2130376/Windows Databases, Indexes, Relations
*       *
*       *********************************************************
*
SELE A
USE chlg
set order to TAG ch_code
*       *********************************************************
*       *
*       *               Windows Window definitions
*       *
*       *********************************************************
*
IF NOT WEXIST("_ro10p300f")
	DEFINE WINDOW _ro10p300f ;
		AT  0.000, 0.000  ;
		SIZE 10.937,83.333 ;
		TITLE "Opening Cash" ;
		FONT "MS Sans Serif", 8 ;
		STYLE "B" ;
		FLOAT ;
		fill file back.bmp;
		icon file icon5.ico;
		CLOSE ;
		MINIMIZE ;
		COLOR RGB(0,0,255,255,255,255)
	MOVE WINDOW _ro10p300f CENTER
ENDIF
*       *********************************************************
*       *
*       *           CUST/Windows Setup Code - SECTION 2
*       *
*       *********************************************************
*
#REGION 1
#DEFINE c_dbfempty		'Database is empty, add a record?'
#DEFINE c_edits			'Please finish your edits.'
#DEFINE c_topfile		'Top of file.'
#DEFINE c_endfile		'End of file.'
#DEFINE c_brtitle		'Locate Record'
#DEFINE c_nolock		'Sorry, could not lock record -- try again later.'
#DEFINE c_ecancel		'Edits Canceled.'
#DEFINE c_delrec		'Delete selected record?'
#DEFINE c_nofeat		'Feature not available yet.'
#DEFINE c_nowiz			'Wizard application is not available.'
#DEFINE c_makerepo		'Creating report with Report Wizard.'
#DEFINE c_norepo		'Could not create report.'
#DEFINE c_delnote 		'Deleting records...'
#DEFINE c_readonly 		'Table is read-only. No editing allowed.'
#DEFINE c_notable 		'No table selected. Open table or run query.'
#DEFINE c_badexpr		'Invalid expression.'
#DEFINE c_locwiz		'Locate WIZARD.APP:'
#DEFINE c_multitable	'You have multiple related tables. Adding records in not allowed.'

MOVE WINDOW '_ro10p300f' CENTER
PRIVATE isediting,isadding,wztblarr
PRIVATE wzolddelete,wzolderror,wzoldesc
PRIVATE wzalias, tempcurs,wzlastrec
PRIVATE isreadonly,find_drop,is2table

IF EMPTY(ALIAS())
	WAIT WINDOW c_notable
	RETURN
ENDIF

m.wztblarr= ''
m.wzalias=SELECT()
m.isediting=.F.
m.isadding=.F.
m.is2table = .F.
m.wzolddelete=SET('DELETE')
SET DELETED ON
m.tempcurs=SYS(2015)  &&used if General field
m.wzlastrec = 1
m.wzolderror=ON('error')
*N ERROR DO wizerrorhandler
wzoldesc=ON('KEY','ESCAPE')
ON KEY LABEL ESCAPE
m.find_drop = IIF(_DOS,0,2)

m.isreadonly=IIF(isread(),.T.,.F.)
IF m.isreadonly
	WAIT WINDOW c_readonly TIMEOUT 1
ENDIF


*F RECCOUNT()=0 AND !m.isreadonly AND fox_alert(C_DBFEMPTY)
*   APPEND BLANK
*NDIF

GOTO TOP
SCATTER MEMVAR MEMO

*       *********************************************************
*       *
*       *               CUST/Windows Screen Layout
*       *
*       *********************************************************
*

#REGION 1
IF WVISIBLE("_ro10p300f")
	ACTIVATE WINDOW _ro10p300f SAME
ELSE
	ACTIVATE WINDOW _ro10p300f NOSHOW
ENDIF
@0,77.400 SAY "sc.bmp"BITMAP
@ 0.385,4.000 SAY "Opening Cash" ;
	FONT "MS Sans Serif", 14 ;
	STYLE "BT" ;
	COLOR RGB(0,128,0,255,255,255)
@ 2.992,0.000 TO 2.992,83.333 ;
	PEN 1, 8 ;
	STYLE "1" ;
	COLOR RGB(0,0,0,255,255,255)
@ 3.769,4.333 SAY "Date:" ;
	SIZE 1.000,9.000 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@ 3.769,16.000 GET m.date;
	SIZE 1.000,12.400;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "@E" ;
	WHEN isediting ;
	COLOR ,RGB(255,0,0,255,255,255)
@ 5.769,4.333 SAY "Cash:" ;
	SIZE 1.000,9.000 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	PICTURE "@J" ;
	COLOR RGB(,,,255,255,255)
@ 5.769,16.000 GET m.debit ;
	SIZE 1.000,11.120 ;
	DEFAULT " " ;
	FONT "MS Sans Serif", 8 ;
	PICTURE "999999.99" ;
	WHEN isediting ;
	COLOR ,RGB(255,0,0,255,255,255)
@ 7.691,0.000 TO 7.691,83.333 ;
	PEN 1, 8 ;
	STYLE "1" ;
	COLOR RGB(0,0,0,255,255,255)
@ 8.845,1.667 GET m.top_btn ;
	PICTURE "@*HN \<Top" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('TOP') ;
	MESSAGE 'Go to first record.'
@ 8.845,9.667 GET m.prev_btn ;
	PICTURE "@*HN \<Prev" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('PREV') ;
	MESSAGE 'Go to previous record.'
@ 8.845,17.667 GET m.next_btn ;
	PICTURE "@*HN \<Next" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('NEXT') ;
	MESSAGE 'Go to next record.'
@ 8.845,25.667 GET m.end_btn ;
	PICTURE "@*HN \<End" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('END') ;
	MESSAGE 'Go to last record.'
@ 8.845,33.667 GET m.loc_btn ;
	PICTURE "@*HN \<Locate" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('LOCATE') ;
	MESSAGE 'Locate a record.'
@ 8.845,41.667 GET m.add_btn ;
	PICTURE "@*HN \<Add" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('ADD') ;
	MESSAGE 'Add a new record.'
@ 8.845,49.667 GET m.edit_btn ;
	PICTURE "@*HN Ed\<it" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('EDIT') ;
	MESSAGE 'Edit current record.'
@ 8.845,57.667 GET m.del_btn ;
	PICTURE "@*HN \<Delete" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('DELETE') ;
	MESSAGE 'Delete current record.'
@ 8.845,65.667 GET m.prnt_btn ;
	PICTURE "@*HN P\<rint" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('PRINT') ;
	MESSAGE 'Print report.'
@ 8.845,73.667 GET m.exit_btn ;
	PICTURE "@*HN \<Close" ;
	SIZE 1.769,7.833,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B" ;
	VALID btn_val('EXIT') ;
	MESSAGE 'Close screen.'

IF NOT WVISIBLE("_ro10p300f")
	ACTIVATE WINDOW _ro10p300f
ENDIF


*       *********************************************************
*       *
*       *    WindowsREAD contains clauses from SCREEN s2130376
*       *
*       *********************************************************
*

READ CYCLE ;
	ACTIVATE readact() ;
	DEACTIVATE readdeac() ;
	NOLOCK

RELEASE WINDOW _ro10p300f

*       *********************************************************
*       *
*       *                Windows Closing Databases
*       *
*       *********************************************************
*

IF USED("cust")
	SELECT cust
	USE
ENDIF

SELECT (m.currarea)


#REGION 0

SET readborder &rborder

IF m.talkstat = "ON"
	SET TALK ON
ENDIF
IF m.compstat = "ON"
	SET COMPATIBLE ON
ENDIF


*       *********************************************************
*       *
*       *                CUST/Windows Cleanup Code
*       *
*       *********************************************************
*

#REGION 1
SET DELETED &wzolddelete
SET FIELDS &wzfields
ON ERROR &wzolderror
ON KEY LABEL ESCAPE &wzoldesc
DO CASE
CASE _DOS AND SET('DISPLAY')='VGA25'
	@24,0 CLEAR TO 24,79
CASE _DOS AND SET('DISPLAY')='VGA50'
	@49,0 CLEAR TO 49,79
CASE _DOS
	@24,0 CLEAR TO 24,79
ENDCASE

****Procedures****


*       *********************************************************
*       *
*       *    CUST/Windows Supporting Procedures and Functions
*       *
*       *********************************************************
*

#REGION 1
PROCEDURE readdeac
IF isediting
	ACTIVATE WINDOW '_ro10p300f'
	WAIT WINDOW c_edits NOWAIT
ENDIF
IF !WVISIBLE(WOUTPUT())
	CLEAR READ
	RETURN .T.
ENDIF
RETURN .F.

PROCEDURE readact
IF !isediting
	SELECT (m.wzalias)
	SHOW GETS
ENDIF
DO REFRESH
RETURN

PROCEDURE wizerrorhandler
* This very simple error handler is primarily intended
* to trap for General field OLE errors which may occur
* during editing from the MODIFY GENERAL window.
WAIT WINDOW MESSAGE()
RETURN


PROCEDURE printrec
PRIVATE solderror,wizfname,saverec,savearea,tmpcurs,tmpstr
PRIVATE prnt_btn,p_recs,p_output,pr_out,pr_record
STORE 1 TO p_recs,p_output
STORE 0 TO prnt_btn
STORE RECNO() TO saverec
m.solderror=ON('error')
DO pdialog
IF m.prnt_btn = 2
	RETURN
ENDIF
IF !FILE(ALIAS()+'.FRX')
	m.wizfname=SYS(2004)+'WIZARDS\'+'WIZARD.APP'
	IF !FILE(m.wizfname)
		ON ERROR *
		m.wizfname=LOCFILE('WIZARD.APP','APP',c_locwiz)
		ON ERROR &solderror
		IF !'WIZARD.APP'$UPPER(m.wizfname)
			WAIT WINDOW c_nowiz
			RETURN
		ENDIF
	ENDIF
	WAIT WINDOW c_makerepo NOWAIT
	m.savearea=SELECT()
	m.tmpcurs='_'+LEFT(SYS(3),7)
	CREATE CURSOR (m.tmpcurs) (comment m)
	m.tmpstr = '* LAYOUT = COLUMNAR'+CHR(13)+CHR(10)
	INSERT INTO (m.tmpcurs) VALUES(m.tmpstr)
	SELECT (m.savearea)
	DO (m.wizfname) WITH '','WZ_QREPO','NOSCRN/CREATE',ALIAS(),m.tmpcurs
	USE IN (m.tmpcurs)
	WAIT CLEAR
	IF !FILE(ALIAS()+'.FRX')  &&wizard could not create report
		WAIT WINDOW c_norepo
		RETURN
	ENDIF
ENDIF
SELE A
*INDEX ON c_name+c_add1 TAG nameadd 
m.pr_out=IIF(m.p_output=1,'TO PRINT NOCONSOLE','PREVIEW')
m.pr_record=IIF(m.p_recs=1,'NEXT 1','ALL')
REPORT FORM (ALIAS()) &pr_out &pr_record
GO m.saverec
SET ORDER TO TAG c_name
RETURN


PROCEDURE btn_val
PARAMETER m.btnname
DO CASE
CASE  m.btnname='TOP'
	GO TOP
	WAIT WINDOW c_topfile NOWAIT
CASE  m.btnname='PREV'
	IF !BOF()
		SKIP -1
	ENDIF
	IF BOF()
		WAIT WINDOW c_topfile NOWAIT
		GO TOP
	ENDIF
CASE  m.btnname='NEXT'
	IF !EOF()
		SKIP 1
	ENDIF
	IF EOF()
		WAIT WINDOW c_endfile NOWAIT
		GO BOTTOM
	ENDIF
CASE  m.btnname='END'
	GO BOTTOM
	WAIT WINDOW c_endfile NOWAIT
CASE  m.btnname='LOCATE'
CASE  m.btnname='ADD'  AND !isediting &&add record
	if m.ur_add=1
		isediting=.T.
		isadding=.T.
		=edithand('ADD')
		_CUROBJ=1
		DO REFRESH
		SHOW GETS
		RETURN
	else
	   do mright 
	endif

CASE  m.btnname='EDIT'  AND !isediting &&edit record
	if m.ur_edit=1
	IF EOF() OR BOF()
		WAIT WINDOW c_endfile NOWAIT
		RETURN
	ENDIF
	IF RLOCK()
		isediting=.T.
		_CUROBJ=1
		DO REFRESH
		RETURN
	ELSE
		WAIT WINDOW c_nolock
	ENDIF
	else
	   do mright 
	endif
	
CASE m.btnname='EDIT'  AND isediting &&save record
	if m.ur_edit=1
	IF isadding
		=edithand('SAVE')
	ELSE
		IF EMPTY(m.date)
			WAIT WINDOW "Date can not be blank"
		ELSE
			IF EMPTY(m.debit)
				WAIT WINDOW "Amount can not be blank "
			ELSE
				LOCA FOR ch_code=m.ch_code
				IF FOUND()
				 *mu*
				  if flock()
					GATHER MEMVAR MEMO
				  endif
				  unlock all				  	
					GO TOP
					mbal=0
					SCAN
						REPL balance WITH mbal+debit-credit
						mbal=balance
					ENDSCAN
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	UNLOCK
	isediting=.F.
	isadding=.F.
	DO REFRESH
	else
	   do mright 
	endif
	
CASE m.btnname='DELETE'  AND isediting 	&&cancel record
	if m.ur_dele=1

	IF isadding
		=edithand('CANCEL')
	ENDIF
	isediting=.F.
	isadding=.F.
	UNLOCK
	WAIT WINDOW c_ecancel NOWAIT
	DO REFRESH
	else
	   do mright 
	endif
	
CASE m.btnname='DELETE'
	if m.ur_dele=1

	IF EOF() OR BOF()
		WAIT WINDOW c_endfile NOWAIT
		RETURN
	ENDIF
	else
	   do mright 
	endif
	
CASE m.btnname='PRINT'
CASE m.btnname='EXIT'
	m.bailout=.T.	&&this is needed if used with FoxApp
	CLEAR READ
	RETURN
ENDCASE
SCATTER MEMVAR MEMO
SHOW GETS
RETURN


PROCEDURE REFRESH
DO CASE
CASE m.isreadonly AND RECCOUNT()=0
	SHOW GETS DISABLE
	SHOW GET exit_btn ENABLE
CASE m.isreadonly
	SHOW GET add_btn DISABLE
	SHOW GET del_btn DISABLE
	SHOW GET edit_btn DISABLE
CASE (RECCOUNT()=0 OR EOF()) AND !m.isediting
	SHOW GETS DISABLE
	SHOW GET add_btn ENABLE
	SHOW GET exit_btn ENABLE
CASE m.isediting
	SHOW GETS ENABLE
	SHOW GET find_drop DISABLE
	SHOW GET top_btn DISABLE
	SHOW GET prev_btn DISABLE
	SHOW GET loc_btn DISABLE
	SHOW GET next_btn DISABLE
	SHOW GET end_btn DISABLE
	SHOW GET add_btn DISABLE
	SHOW GET prnt_btn DISABLE
	SHOW GET exit_btn DISABLE
	SHOW GET edit_btn,1 PROMPT "\<Save"
	SHOW GET del_btn,1 PROMPT "\<Cancel"
	ON KEY LABEL ESCAPE DO btn_val WITH 'DELETE'
	RETURN
OTHERWISE
	SHOW GET edit_btn,1 PROMPT "Ed\<it"
	SHOW GET del_btn,1 PROMPT "\<Delete"
	SHOW GETS ENABLE
ENDCASE
IF m.is2table
	SHOW GET add_btn DISABLE
ENDIF
ON KEY LABEL ESCAPE
RETURN


PROCEDURE edithand
PARAMETER m.paction
* procedure handles edits
DO CASE
CASE m.paction = 'ADD'
	SCATTER MEMVAR MEMO BLANK
CASE m.paction = 'SAVE'
	IF EMPTY(m.date)
		WAIT WINDOW "Date not be blank"
	ELSE
		IF EMPTY(m.debit)
			WAIT WINDOW "Amount can not be blank."
		ELSE
			COUNT TO nrec
			IF nrec=0
			 *mu*
			   if flock()
			   	m.ch_code=1
				APPE BLANK
				REPL DATE WITH m.date
				REPL ch_code WITH m.ch_code
				REPL debit WITH m.debit,crdr WITH 'Dr'
				REPL particular WITH "Opening Cash in Hand"
			  endif
			  unlock all 	
			ELSE
				a1=SPACE(1)
				DO MESSAGE WITH a1,"Opening cash is already exsit."," ","Message"
				GO TOP
				DO REFRESH
			ENDIF
		ENDIF
	ENDIF
CASE m.paction = 'CANCEL'
	* nothing here
ENDCASE
RETURN

PROCEDURE fox_alert
PARAMETER wzalrtmess
PRIVATE alrtbtn
m.alrtbtn=2
DEFINE WINDOW _qec1ij2t7 AT 0,0 SIZE 8,50 ;
	FONT "MS Sans Serif",10 STYLE 'B' ;
	COLOR ,RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE NOMINIMIZE DOUBLE TITLE WTITLE()
MOVE WINDOW _qec1ij2t7 CENTER
ACTIVATE WINDOW _qec1ij2t7 NOSHOW
@ 2,(50-TXTWIDTH(wzalrtmess))/2 SAY wzalrtmess;
	FONT "MS Sans Serif", 10 STYLE "B"
@ 6,18 GET m.alrtbtn ;
	PICTURE "@*HT \<OK;\?\!\<Cancel" ;
	SIZE 1.769,8.667,1.333 ;
	FONT "MS Sans Serif", 8 STYLE "B"
ACTIVATE WINDOW _qec1ij2t7
READ CYCLE MODAL
RELEASE WINDOW _qec1ij2t7
RETURN m.alrtbtn=1


PROCEDURE pdialog
DEFINE WINDOW _qjn12zbvh ;
	AT  0.000, 0.000  ;
	SIZE 13.231,54.800 ;
	TITLE "Microsoft FoxPro" ;
	FONT "MS Sans Serif", 8 ;
	COLOR ,RGB(0,0,255,255,255,255) ;
	FLOAT NOCLOSE MINIMIZE SYSTEM
MOVE WINDOW _qjn12zbvh CENTER
ACTIVATE WINDOW _qjn12zbvh NOSHOW
@ 2.846,33.600 SAY "Output:"  ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(0,128,0,255,255,255)
@ 2.846,4.800 SAY "Print:"  ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR RGB(0,128,0,255,255,255)
@ 4.692,7.200 GET m.p_recs ;
	PICTURE "@*RVN \<Current Record;\<All Records" ;
	SIZE 1.308,18.500,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 4.692,36.000 GET m.p_output ;
	PICTURE "@*RVN \<Printer;Pre\<view" ;
	SIZE 1.308,12.000,0.308 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "BT" ;
	COLOR ,R/B,R/GR+,,B/B+,R+/B,GR+/W,,B/B,W/R
@ 10.154,16.600 GET m.prnt_btn ;
	PICTURE "@*HT P\<rint;Ca\<ncel" ;
	SIZE 1.769,8.667,0.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B"
ACTIVATE WINDOW _qjn12zbvh
READ CYCLE MODAL
RELEASE WINDOW _qjn12zbvh
RETURN


PROCEDURE loc_dlog
PRIVATE gfields,i
DEFINE WINDOW wzlocate FROM 1,1 TO 20,40;
	SYSTEM GROW CLOSE ZOOM FLOAT FONT "MS Sans Serif",8
MOVE WINDOW wzlocate CENTER
m.gfields=SET('FIELDS',2)
IF !EMPTY(RELATION(1))
	SET FIELDS ON
	IF m.gfields # 'GLOBAL'
		SET FIELDS global
	ENDIF
	IF EMPTY(fldlist())
		m.i=1
		DO WHILE !EMPTY(objvar(m.i))
			IF ATC('M.',objvar(m.i))=0
				SET FIELDS TO (objvar(m.i))
			ENDIF
			m.i = m.i + 1
		ENDDO
	ENDIF
ENDIF
BROWSE WINDOW wzlocate NOEDIT NODELETE ;
	NOMENU TITLE c_brtitle FIELDS c_name :H = 'Cutomer Name',c_add1 :H = 'Address', c_add2 :H = 'Address'
SET FIELDS &gfields
SET FIELDS OFF
RELEASE WINDOW wzlocate
RETURN

PROCE sc
DEFINE WINDOW mtitle1 ;
	AT  2,1 TO 30,95
ACTIVATE WIND mtitle1
@ 3.000,6.000 GET m.xyz ;
	PICTURE "@*BHN sc1.bmp" ;
	SIZE 20.769,90.667 ;
	DEFAULT 1 ;
	FONT "MS Sans Serif", 8 ;
	STYLE "B"
CLEAR GETS
WAIT WINDOW
DEACTIVATE WIND mtitle1
RETU



