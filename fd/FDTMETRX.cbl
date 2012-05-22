000100 FD  PAY-TIME-TRX-FILE
000200*    Changed  6/27/91 RGR (expanded & moved owed-amt)
000300*    10/28/92 JCM  Added TIME-VACATION-HOURS-USED
000400*    04/27/93 JCM  Added TIME-YEAR-BIRTHDAY-HRS-USED
000500*    09/09/94 JCM  Added info for direct deposit
000600*    07/20/95 JCM  Change SICK to PERS
000700*    05/30/96 JCM  Temp vac pay by min 40 hrs x rate
000800*    07/12/96 JCM  Add v99 to bday
000900*    02/05/97 JCM  Add v99 to vac; and vac ctr
001000*    12/01/97 JCM  Expanded TIME-GARNISH-BAL-DUE
001100*    06/23/98 JCM  Expand FWT to 9(4)v99
001200*    09/30/98 JCM  Define hash tot as add rout8 not rout9
001300*    11/30/04 RGR  Made TIME-YEAR-BDAY-HRS-USED signed COMP;
001400*                  removed TIME-YEAR-BIRTHDAY-HRS-USED
001500*    01/17/12 TR   Modified for Borg Payroll project.
001600******************************************************************
001700
001800      RECORD CONTAINS 950 COMPRESSED CHARACTERS
001900      LABEL RECORDS ARE STANDARD
002000      VALUE OF
002100         FILENAME IS "PRTIMFIL"
002200*        LIBRARY IS "INDKFLIB"
002300         SPACE IS PAY-TIME-TRX-FILE-SPACE.
002400
002500 01  PAY-TIME-TRX-RECORD.                                    
002600      03 TIME-DEPARTMENT-NO                PIC 9(4).         
002700      03 PAY-TIME-TRX-KEY.                                   
002800          05 TIME-EMP-NUMBER               PIC 9(4).         
002900          05 TIME-RECORD-TYPE              PIC 9(1).         
003000      03 TIME-EMP-NAME                     PIC X(28).        
003100      03 TIME-EMP-SOC-SEC-NO               PIC 9(9).         
003200      03 TIME-EMP-PAY-FREQ                 PIC X(1).         
003300      03 TIME-EMP-TYPE                     PIC X(1).         
003400      03 TIME-SUPERVISOR                   PIC X(2).         
003500      03 TIME-PAY-PERIOD-DATE              PIC 9(6).         
003600*         mmddyy format
003700      03 TIME-SALARY-FLAG                  PIC X(1).         
003800      03 TIME-REGULAR-HOURS                PIC S9(3)V99 COMP.
003900      03 TIME-OVERTIME-HOURS               PIC S9(3)V99 COMP.
004000      03 TIME-VACATION-HOURS               PIC S9(3)V99 COMP.
004100      03 TIME-HOLIDAY-HOURS                PIC S9(3)V99 COMP.
004200      03 TIME-PERS-HOURS                   PIC S9(3)V99 COMP.
004300      03 TIME-SPECIAL-HOURS                PIC S9(3)V99 COMP.
004400      03 TIME-TEMP-1-DE-CODE               PIC X(2).         
004500      03 TIME-TEMP-1-DE-DESC               PIC X(7).         
004600      03 TIME-TEMP-1-TYPE                  PIC X(1).         
004700      03 TIME-TEMP-1-AMOUNT                PIC S9(4)V99 COMP.
004800      03 TIME-TEMP-2-DE-CODE               PIC X(2).         
004900      03 TIME-TEMP-2-DE-DESC               PIC X(7).         
005000      03 TIME-TEMP-2-TYPE                  PIC X(1).         
005100      03 TIME-TEMP-2-AMOUNT                PIC S9(4)V99 COMP.
005200      03 TIME-TEMP-3-DE-CODE               PIC X(2).         
005300      03 TIME-TEMP-3-DE-DESC               PIC X(7).         
005400      03 TIME-TEMP-3-TYPE                  PIC X(1).         
005500      03 TIME-TEMP-3-AMOUNT                PIC S9(4)V99 COMP.
005600      03 TIME-ADV-VAC-WEEKS                PIC 9(1).         
005700      03 TIME-WEEKS-WORKED                 PIC S9(2)V99 COMP.
005800      03 TIME-SALARY                       PIC S9(5)V99 COMP.
005900      03 TIME-REGULAR-PAY                  PIC S9(4)V99 COMP.
006000      03 TIME-OVERTIME-PAY                 PIC S9(4)V99 COMP.
006100      03 TIME-VACATION-PAY                 PIC S9(4)V99 COMP.
006200      03 TIME-HOLIDAY-PAY                  PIC S9(4)V99 COMP.
006300      03 TIME-PERS-PAY                     PIC S9(4)V99 COMP.
006400      03 TIME-SPECIAL-PAY                  PIC S9(4)V99 COMP.
006500      03 TIME-GROSS-PAY                    PIC S9(5)V99 COMP.
006600      03 TIME-TAXABLE-GROSS-PAY            PIC S9(5)V99 COMP.
006700      03 TIME-FICA                         PIC S9(4)V99 COMP.
006800      03 TIME-FWT                          PIC S9(4)V99 COMP.
006900      03 TIME-SWT                          PIC S9(3)V99 COMP.
007000      03 TIME-OST                          PIC S9(3)V99 COMP.
007100      03 TIME-CWT                          PIC S9(3)V99 COMP.
007200      03 TIME-SAVINGS-BOND-DED             PIC S9(3)V99 COMP.
007300      03 TIME-SAVINGS-ACCOUNT-DED          PIC S9(3)V99 COMP.
007400      03 TIME-LOAN-DED                     PIC S9(3)V99 COMP.
007500      03 TIME-GARNISHEE-DED                PIC S9(3)V99 COMP.
007700      03 TIME-DEDUCTIONS-EARNINGS OCCURS 12 TIMES            
007800           INDEXED BY TIME-DEDUCTIONS-INDEX.
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
007900          05 TIME-DE-CODE                  PIC X(2).         
008000          05 TIME-DE-DESC                  PIC X(7).         
008100          05 TIME-DE-AMOUNT                PIC S9(3)V99 COMP.
008200          05 TIME-DE-TYPE                  PIC X(1).         
008300          05 TIME-DE-OWED-AMT              PIC 9(5)V99 COMP. 
008400          05 TIME-DE-PREPAID-BAL           PIC 9(3)V99 COMP. 
008500          05 TIME-DE-FILLER                PIC X(07).        
008700      03 TIME-NET-PAY                      PIC S9(5)V99 COMP.
008800      03 TIME-EMPLR-FICA                   PIC S9(4)V99 COMP.
008900      03 TIME-CHECK-NUMBER                 PIC 9(6).         
009000      03 TIME-CHECK-DATE                   PIC 9(6).         
009100      03 FILLER REDEFINES TIME-CHECK-DATE.                   
009200          05 TIME-CHECK-MM                 PIC 9(2).         
009300          05 TIME-CHECK-DD                 PIC 9(2).         
009400          05 TIME-CHECK-YY                 PIC 9(2).         
009500      03 TIME-EARNED-HOURS                 PIC S9(3)V99 COMP.
009600**        calculated = incent-earned-hrs  +  missed-earned-hr
009700      03 TIME-REPAIR-HOURS                 PIC S9(3)V99 COMP.
009800      03 TIME-IDLE-HOURS                   PIC S9(3)V99 COMP.
009900      03 TIME-OFF-STANDARD-HOURS           PIC S9(3)V99 COMP.
010000      03 TIME-MISSED-HOURS                 PIC S9(3)V99 COMP.
010100**        calculated = missed-actual-hrs  -  missed-earned-hr
010200      03 TIME-SPC-HOURS                    PIC S9(3)V99 COMP.
010300      03 TIME-EARNED-PAY                   PIC S9(4)V99 COMP.
010400      03 TIME-REPAIR-PAY                   PIC S9(4)V99 COMP.
010500      03 TIME-IDLE-PAY                     PIC S9(4)V99 COMP.
010600      03 TIME-OFF-STANDARD-PAY             PIC S9(4)V99 COMP.
010700      03 TIME-MISSED-PAY                   PIC S9(4)V99 COMP.
010800      03 TIME-SPC-PAY                      PIC S9(4)V99 COMP.
010900      03 TIME-AVERAGE-RATE                 PIC S9(3)V999 COMP
011100      03 TIME-INCENT-ACTUAL-HRS            PIC S9(3)V99 COMP.
011200      03 TIME-MISSED-EARNED-HRS            PIC S9(3)V99 COMP.
011300      03 TIME-MISSED-ACTUAL-HRS            PIC S9(3)V99 COMP.
011400      03 TIME-INCENT-EARNED-HRS            PIC S9(3)V99 COMP.
011500      03 TIME-GARNISH-BAL-DUE              PIC S9(5)V99 COMP.
011600      03 TIME-LOAN-BAL-DUE                 PIC S9(4)V99 COMP.
011700      03 TIME-VACATION-HRS-USEDX.                            
011800          05 TIME-VACATION-HRS-USED        PIC S9(3)V99 COMP.
011900      03 TIME-RESERVED-FOR-EXPANSION-1     PIC X(2).         
012000      03 TIME-DD-FLAG                      PIC X(1).         
012100      03 TIME-DD-INFO.                                       
012200          05 TIME-DD-ACCT-TYPE             PIC X(1).         
012300          05 TIME-DD-TRN-CODE              PIC X(2).         
012400          05 TIME-DD-ROUTING-NO9           PIC 9(9).         
012500          05 TIME-DD-ROUTING-NO REDEFINES TIME-DD-ROUTING-NO9
012700             07 TIME-DD-ROUTING-A          PIC X(4).         
012800             07 TIME-DD-ROUTING-B          PIC X(4).         
012900             07 TIME-DD-ROUTING-CHK-DGT    PIC X(1).         
013000          05 TIME-DD-ROUTING-NOZ REDEFINES TIME-DD-ROUTING-NO
016900          05 TIME-VAC-BY-WK-PAY            PIC S9(4)V99 COMP.
017000          05 TIME-VAC-BY-WK-NUM            PIC 9(1).         
017100          05 TIME-VAC-SEN-DATE             PIC 9(6).         
017200          05 TIME-VAC-A-PROG-PAY           PIC S9(4)V99 COMP.
017300          05 TIME-VAC-D-BY-PR-GR-PAY       PIC S9(4)V99 COMP.
017400**        05 TIME-VAC-A-PROG-USED          PIC X(1).
017500          05 TIME-VAC-REAL-WKS-USED        PIC 9(1).         
017600** STD stands for SHORT TERM DISABILITY.
017700      03 TIME-STD-HOURS                    PIC S9(3)V99 COMP.
017800      03 TIME-STD-OVT-HOURS                PIC S9(3)V99 COMP.
017900      03 TIME-STD-PAY                      PIC S9(4)V99 COMP.
018000      03 TIME-STD-OVT-PAY                  PIC S9(4)V99 COMP.
018100      03 TIME-PROC-FEE-DED-AMT             PIC S9(3)V99 COMP.
018200      03 TIME-SUPPORT-DED-TABLE OCCURS 5 TIMES.              
018300         05 TIME-SUPPORT-DED-CODE          PIC X(02).        
018400         05 TIME-SUPPORT-DED-DESC          PIC X(09).        
018500         05 TIME-SUPPORT-DED-AMT           PIC S9(4)V99 COMP.
018600         05 TIME-SUPPORT-DED-DUE           PIC S9(5)V99 COMP.
018700         05 TIME-SUPPORT-DED-FILL          PIC X(10).        
018300         05 TIME-SUPPORT-DED-CODE          PIC X(02).        
018400         05 TIME-SUPPORT-DED-DESC          PIC X(09).        
018500         05 TIME-SUPPORT-DED-AMT           PIC S9(4)V99 COMP.
018600         05 TIME-SUPPORT-DED-DUE           PIC S9(5)V99 COMP.
018700         05 TIME-SUPPORT-DED-FILL          PIC X(10).        
018300         05 TIME-SUPPORT-DED-CODE          PIC X(02).        
018400         05 TIME-SUPPORT-DED-DESC          PIC X(09).        
018500         05 TIME-SUPPORT-DED-AMT           PIC S9(4)V99 COMP.
018600         05 TIME-SUPPORT-DED-DUE           PIC S9(5)V99 COMP.
018700         05 TIME-SUPPORT-DED-FILL          PIC X(10).        
018300         05 TIME-SUPPORT-DED-CODE          PIC X(02).        
018400         05 TIME-SUPPORT-DED-DESC          PIC X(09).        
018500         05 TIME-SUPPORT-DED-AMT           PIC S9(4)V99 COMP.
018600         05 TIME-SUPPORT-DED-DUE           PIC S9(5)V99 COMP.
018700         05 TIME-SUPPORT-DED-FILL          PIC X(10).        
018300         05 TIME-SUPPORT-DED-CODE          PIC X(02).        
018400         05 TIME-SUPPORT-DED-DESC          PIC X(09).        
018500         05 TIME-SUPPORT-DED-AMT           PIC S9(4)V99 COMP.
018600         05 TIME-SUPPORT-DED-DUE           PIC S9(5)V99 COMP.
018700         05 TIME-SUPPORT-DED-FILL          PIC X(10).        
018800      03 FILLER                            PIC X(63).        
