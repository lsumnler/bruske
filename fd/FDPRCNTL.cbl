000100******************************************************************
000200*  11/14/91  JCM  Split FICA: SOCIAL SEC/MEDICARE
000300*  12/09/91  JCM  Add PR-CONTROL-GROSS-PRIOR-YR
000400*  11/17/93  JCM  Add MISC DATES AND VARIABLES
000500*  05/12/94  JCM  Add PRCTL-ADJ-WRK-SCH-FLAG for Pied & Sthn
000600*  09/06/94  JCM  Add DIRECT DEPOSIT INFO    X(400) => X(800)
000700*  10/20/94  JCM  Add XMIT prefix for communications to bank
000800*  11/11/94  JCM  Add Settlement days
000900*  03/24/95  JCM  Add Missed Hours YTD flag
001000*  07/19/95  JCM  Add Overtime Calculation flag
001100*  07/20/95  JCM  Change sick to pers; add location
001200*  10/25/95  JCM  Add excess rate for incentive calc
001300*  11/06/95  JCM  Add deduct code/description
001400*  11/08/95  JCM  Add TIMEDT cutoff date (PATTSUM)
001500*  11/13/95  JCM  Add FORM NUMBER for printing (btdpost, pasyvar
001600*  01/08/96  JCM  Add alternate SWT & acct # code for MI
001700*  02/13/96  JCM  Add as of date for zeroing files
001800*  03/15/96  JCM  Add histry work file for multiplier
001900*  04/18/96  JCM  Add PRCTL-SWT-ALT-MI-ID for 941
002000*  11/12/96  JCM  Add PRCTL-FROM-ADJ-CS-DATE
002100*                   & PRCTL-THRU-ADJ-CS-DATE
002200*  05/21/97  JCM  Add PRCTL-SSTE-VAC-USE-PRIOR-EARN
002300*  09/10/97  JCM  Add PRCTL-NEW-YEAR-DATE
002400*  03/26/98  JCM  Add 401(k) fields
002500*  12/15/98  RGR  Renamed PRCTL-USE-PRHISTRY to -USE-AVG-RATE
002600*  01/11/99  BJE  Added flag to limit 401K deductions to % of
002700*                 weekly earnings (PRCTL-401K-LIMIT-TO-PCT);
002800*                 table to prioritize deductions
002900*                 (PRCTL-PRIORITIZE-DEDUCTIONS)
003000*  10/17/03  GJB  Added Positive Pay fields for LaSalle Bank
003100*  03/09/04  RGR  Added PRCTL-401K-CATCHUP-MIN-AGE,
003200*                       PRCTL-401K-CATCHUP-AMT-LIMIT
003300*  04/05/04  RGR  Added PRCTL-GA-DOL-ACCOUNT,
003400*                       PRCTL-GA-DOL-TAX-PCT
003500*  12/05/05  RGR  Added PRCTL-PERS-HRS-HANDLING-CODE
003600*  03/30/06  RGR  Added PRCTL-ALT-STATE,
003700*                       PRCTL-ALT-ST-UNEMP-PCT,
003800*                       PRCTL-ALT-ST-UNEMP-MAX
003900*  12/22/06  RGR  Added PRCTL-ALLOW-TD-ENTRY-DYS-AHEAD
004000*  12/22/11  RGR  Changed - PRCTL-DD-AREA (various changes)
004100*  12/27/08  RGR  Added PRCTL-OT-40-INCL-HOLIDAY-FLAG
004200*  01/11/12  LMS  Changed - To bring Borg into Payroll System
004300*                     1.  Expand PRCTL-DEDUCTION &
004400*                         PRCTL-PRIORITIZE-DEDUCTIONS to 12
004500*                         table entries.  In addition add filler
004600*                         after each table area for potential
004700*                         expansion.  PRCTL-PRIORITIZE-DEDUCTIONS
004800*                         expanded from Pic 9 to Pic 99.
004900*                     2.  Area of fields added for Roth 401K
005000*                     3.  Borg additional fields.
005100*                     4.  Change -MI (Michigan designation) to
005200*                         -ST.
005300*                     5.  Expand size of numeric field from
005400*                         9(5)v99 to 9(6)v99 for
005500*                         PRCTL-MAX-SS-FICA-WAGES
005600*                         PRCTL-FED-UNEMP-MAX
005700*                         PRCTL-ST-UNEMP-MAX
005800*                         PRCTL-ST-DISABL-MAX
005900*                         PRCTL-ALT-ST-UNEMP-MAX
006000******************************************************************
006100 FD  PAYROLL-CONTROL-FILE
006200      RECORD CONTAINS 800 COMPRESSED CHARACTERS
006300      LABEL RECORDS ARE STANDARD
006400      VALUE OF
006500         FILENAME IS PAYROLL-CONTROL-FILENAME
006600          LIBRARY IS PAYROLL-CONTROL-LIBRARY
006700           VOLUME IS PAYROLL-CONTROL-VOLUME
006800            SPACE IS PAYROLL-CONTROL-FILE-SPACE.
006900
007000 01  PAYROLL-CONTROL-RECORD.
007100      03 PAYROLL-CONTROL-KEY.
007200          05 PRCTL-EMPLOYER-NO                PIC 9(2).
007300      03 PRCTL-EMPLOYER-NAME.
007400          05 PRCTL-COMPANY-CD                 PIC X(1).
007500          05 FILLER                           PIC X(24).
007600      03 PRCTL-ADDRESS-1                      PIC X(25).
007700      03 PRCTL-ADDRESS-2                      PIC X(25).
007800      03 PRCTL-ADDRESS-3                      PIC X(25).
007900      03 PRCTL-FED-ID-NO.
008000          05 PRCTL-FED-ID-NO9                 PIC X(9).
008100          05 FILLER                           PIC X(2).
008200      03 PRCTL-STATE-ID-NO                    PIC X(11).
008300      03 PRCTL-CITY-ID-NO                     PIC X(11).
008400      03 PRCTL-EMPLOYER-SS-FICA-PCT           PIC 9(2)V99.
008500      03 PRCTL-EMPLOYEE-SS-FICA-PCT           PIC 9(2)V99.
008600      03 PRCTL-MAX-SS-FICA-WAGES              PIC 9(6)V99.
008700      03 PRCTL-EMPLOYER-MC-FICA-PCT           PIC 9(2)V99.
008800      03 PRCTL-EMPLOYEE-MC-FICA-PCT           PIC 9(2)V99.
008900      03 PRCTL-MAX-MC-FICA-WAGES              PIC 9(6)V99.
009000      03 PRCTL-FED-UNEMP-PCT                  PIC 9(2)V99.
009100      03 PRCTL-FED-UNEMP-MAX                  PIC 9(6)V99.
009200      03 PRCTL-ST-UNEMP-PCT                   PIC 9(2)V99.
009300      03 PRCTL-ST-UNEMP-MAX                   PIC 9(6)V99.
009400      03 PRCTL-ST-DISABL-PCT                  PIC 9(2)V99.
009500      03 PRCTL-ST-DISABL-MAX                  PIC 9(6)V99.
009600      03 PRCTL-PERS-PAY-EXEMPT-FLG            PIC X(1).
009700      03 PRCTL-DISTRIBUTION-CODE              PIC X(1).
009800      03 PRCTL-RESTAURANT                     PIC X(1).
009900      03 PRCTL-INTERFACE-TO-GL                PIC X(1).
010000      03 PRCTL-USE-JOB-NUMBERS                PIC X(1).
010100      03 PRCTL-LAST-CHECK-NUMBER              PIC 9(6).
010200      03 PRCTL-GL-ACCOUNTS.
010300          05 PRCTL-VAC-PAY-ACCOUNT            PIC 9(4).
010400          05 PRCTL-HOL-PAY-ACCOUNT            PIC 9(4).
010500          05 PRCTL-PERS-PAY-ACCOUNT           PIC 9(4).
010600          05 PRCTL-SPEC-PAY-ACCOUNT           PIC 9(4).
010700          05 PRCTL-EMPLOYER-FICA              PIC 9(4).
010800          05 PRCTL-FICA-ACCOUNT.
010900             07 PRCTL-FICA-MAIN-ACCOUNT       PIC 9(4).
011000             07 PRCTL-FICA-SUB-ACCOUNT        PIC 9(3).
011100          05 PRCTL-FWT-ACCOUNT.
011200             07 PRCTL-FWT-MAIN-ACCOUNT        PIC 9(4).
011300             07 PRCTL-FWT-SUB-ACCOUNT         PIC 9(3).
011400          05 PRCTL-SWT-ACCOUNT.
011500             07 PRCTL-SWT-MAIN-ACCOUNT        PIC 9(4).
011600             07 PRCTL-SWT-SUB-ACCOUNT         PIC 9(3).
011700          05 PRCTL-OST-ACCOUNT.
011800             07 PRCTL-OST-MAIN-ACCOUNT        PIC 9(4).
011900             07 PRCTL-OST-SUB-ACCOUNT         PIC 9(3).
012000          05 PRCTL-CWT-ACCOUNT.
012100             07 PRCTL-CWT-MAIN-ACCOUNT        PIC 9(4).
012200             07 PRCTL-CWT-SUB-ACCOUNT         PIC 9(3).
012300          05 PRCTL-SAV-BOND-ACCOUNT.
012400             07 PRCTL-SAV-BOND-MAIN-ACCOUNT   PIC 9(4).
012500             07 PRCTL-SAV-BOND-SUB-ACCOUNT    PIC 9(3).
012600          05 PRCTL-SAV-ACCT-ACCOUNT.
012700             07 PRCTL-SAV-ACCT-MAIN-ACCOUNT   PIC 9(4).
012800             07 PRCTL-SAV-ACCT-SUB-ACCOUNT    PIC 9(3).
012900          05 PRCTL-LOAN-ACCOUNT.
013000             07 PRCTL-LOAN-MAIN-ACCOUNT       PIC 9(4).
013100             07 PRCTL-LOAN-SUB-ACCOUNT        PIC 9(3).
013200          05 PRCTL-GARNISH-ACCOUNT.
013300             07 PRCTL-GARNISH-MAIN-ACCOUNT    PIC 9(4).
013400             07 PRCTL-GARNISH-SUB-ACCOUNT     PIC 9(3).
013500          05 PRCTL-CHECKING-ACCOUNT.
013600             07 PRCTL-CHECKING-MAIN-ACCOUNT   PIC 9(4).
013700             07 PRCTL-CHECKING-SUB-ACCOUNT    PIC 9(3).
013800          05 PRCTL-MEALS-ACCOUNT.
013900             07 PRCTL-MEALS-MAIN-ACCOUNT      PIC 9(4).
014000             07 PRCTL-MEALS-SUB-ACCOUNT       PIC 9(3).
014100      03 PRCTL-GROSS-PRIOR-YR.
014200         05 PRCTL-GROSS-PRIOR-YR9             PIC 9(02).
014300      03 PRCTL-SEN-ADJ-DAYS.
014400*                 030 INDAK; 000 P&S
014500         05 PRCTL-SEN-ADJ-DAYS9               PIC 9(03).
014600      03 PRCTL-STATE                          PIC X(02).
014700      03 PRCTL-BEG-TIME-CARD-DATE.
014800         05 PRCTL-BEG-TIME-CARD-YY            PIC 9(02).
014900         05 PRCTL-BEG-TIME-CARD-MM            PIC 9(02).
015000         05 PRCTL-BEG-TIME-CARD-DD            PIC 9(02).
015100      03 PRCTL-VAC-CURR-BEG-DATE.
015200         05 PRCTL-VAC-CURR-BEG-DATE-YY        PIC 9(02).
015300         05 PRCTL-VAC-CURR-BEG-DATE-MM        PIC 9(02).
015400         05 PRCTL-VAC-CURR-BEG-DATE-DD        PIC 9(02).
015500      03 PRCTL-VAC-CURR-END-DATE.
015600         05 PRCTL-VAC-CURR-END-DATE-YY        PIC 9(02).
015700         05 PRCTL-VAC-CURR-END-DATE-MM        PIC 9(02).
015800         05 PRCTL-VAC-CURR-END-DATE-DD        PIC 9(02).
015900      03 PRCTL-PEN-CURR-BEG-DATE.
016000         05 PRCTL-PEN-CURR-BEG-DATE-YY        PIC 9(02).
016100         05 PRCTL-PEN-CURR-BEG-DATE-MM        PIC 9(02).
016200         05 PRCTL-PEN-CURR-BEG-DATE-DD        PIC 9(02).
016300      03 PRCTL-PEN-CURR-END-DATE.
016400         05 PRCTL-PEN-CURR-END-DATE-YY        PIC 9(02).
016500         05 PRCTL-PEN-CURR-END-DATE-MM        PIC 9(02).
016600         05 PRCTL-PEN-CURR-END-DATE-DD        PIC 9(02).
016700      03 PRCTL-PS-PRIOR-END-DATE.
016800         05 PRCTL-PS-PRIOR-END-DATE-YY        PIC 9(02).
016900         05 PRCTL-PS-PRIOR-END-DATE-MM        PIC 9(02).
017000         05 PRCTL-PS-PRIOR-END-DATE-DD        PIC 9(02).
017100      03 PRCTL-PS-CURR-BEG-DATE.
017200         05 PRCTL-PS-CURR-BEG-DATE-YY         PIC 9(02).
017300         05 PRCTL-PS-CURR-BEG-DATE-MM         PIC 9(02).
017400         05 PRCTL-PS-CURR-BEG-DATE-DD         PIC 9(02).
017500      03 PRCTL-PS-CURR-END-DATE.
017600         05 PRCTL-PS-CURR-END-DATE-YY         PIC 9(02).
017700         05 PRCTL-PS-CURR-END-DATE-MM         PIC 9(02).
017800         05 PRCTL-PS-CURR-END-DATE-DD         PIC 9(02).
017900      03 PRCTL-PS-BEG-DATE.
018000         05 PRCTL-PS-BEG-DATE-YY              PIC 9(02).
018100         05 PRCTL-PS-BEG-DATE-MM              PIC 9(02).
018200         05 PRCTL-PS-BEG-DATE-DD              PIC 9(02).
018300      03 PRCTL-GARN-BEG-DATE.
018400         05 PRCTL-GARN-BEG-DATE-YY            PIC 9(02).
018500         05 PRCTL-GARN-BEG-DATE-MM            PIC 9(02).
018600         05 PRCTL-GARN-BEG-DATE-DD            PIC 9(02).
018700      03 PRCTL-LOAN-BEG-DATE.
018800         05 PRCTL-LOAN-BEG-DATE-YY            PIC 9(02).
018900         05 PRCTL-LOAN-BEG-DATE-MM            PIC 9(02).
019000         05 PRCTL-LOAN-BEG-DATE-DD            PIC 9(02).
019100      03 PRCTL-MTD-LAST-CLEARED-DATE.
019200         05 PRCTL-MTD-LAST-YY                 PIC 9(02).
019300         05 PRCTL-MTD-LAST-MM                 PIC 9(02).
019400         05 PRCTL-MTD-LAST-DD                 PIC 9(02).
019500      03 PRCTL-QTD-LAST-CLEARED-DATE.
019600         05 PRCTL-QTD-LAST-YY                 PIC 9(02).
019700         05 PRCTL-QTD-LAST-MM                 PIC 9(02).
019800         05 PRCTL-QTD-LAST-DD                 PIC 9(02).
019900      03 PRCTL-YTD-LAST-CLEARED-DATE.
020000         05 PRCTL-YTD-LAST-YY                 PIC 9(02).
020100         05 PRCTL-YTD-LAST-MM                 PIC 9(02).
020200         05 PRCTL-YTD-LAST-DD                 PIC 9(02).
020300      03 PRCTL-ADJ-WRK-SCH-FLAG               PIC X(01).
020400*          P & S use;  Indak does not
020500      03 PRCTL-ADD-VAC-TO-EARNINGS-FLAG       PIC X(01).
020600      03 PRCTL-DD-AREA.
020700         05 PRCTL-DD-FLAG                     PIC X(01).
020800         05 PRCTL-DD-CO-NAME                  PIC X(16).
020900         05 PRCTL-DD-IMMED-DEST-NAME          PIC X(23).
021000         05 PRCTL-DD-IMMED-DEST-ROUTING.
021100            07 PRCTL-DD-IMMED-DEST-ROUT-PFX   PIC X(01).
021200            07 PRCTL-DD-IMMED-DEST-ROUT8      PIC X(08).
021300            07 PRCTL-DD-IMMED-DEST-ROUT-CHK   PIC X(01).
021400         05 PRCTL-DD-IMMED-ORIG-NAME          PIC X(23).
021500         05 PRCTL-DD-IMMED-ORIG-ROUTING.
021600            07 PRCTL-DD-IMMED-ORIG-ROUT-PFX   PIC X(01).
021700            07 PRCTL-DD-IMMED-ORIG-ROUT8      PIC X(08).
021800            07 PRCTL-DD-IMMED-ORIG-ROUT-CHK   PIC X(01).
021900         05 PRCTL-DD-FILLER                   PIC X(38).
022000*           12/22/11  Was 40-character password -- not used
022100         05 PRCTL-DD-LIBRARY-PREFIX           PIC X(2).
022200         05 PRCTL-DD-SETTLEMENT.
022300            07 PRCTL-DD-SETTLEMENT9           PIC 9(1).
022400      03 PRCTL-MISSED-YTD-FLAG                PIC X(01).
022500*  Y if P&S&Y to show YTD Missed on earn summ cds & missed rpt
022600      03 PRCTL-OVERTIME-FLAG                  PIC X(01).
022700*           "W" for Weekly Calculation based on over 40 hours
022800*                (Currently used by Piedmont/Southern/Yona
022900*           "D" for Daily or over 8 hrs a day -- DEFAULT.
023000      03 PRCTL-LOCATION                       PIC X(01).
023100*           I=INDAK, P=PIEDMONT, S=SOUTHERN, Y=YONA
023200      03 PRCTL-EXCESS-RATE                    PIC 9(1)V99.
023300*        USED BY SDTE AND PTDEDIT NORMAL SET AT 1.8
023400      03 PRCTL-DEDUCTION-AREA.
023500         05 PRCTL-DEDUCTS OCCURS 12 TIMES.
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
023600            07 PRCTL-DE-CODE                  PIC X(2).
023700            07 PRCTL-DE-DESCRIPTION           PIC X(9).
23800      03 FILLER                               PIC X(44).
023900*    USED BY VARIOUS PRGS: SEMM, SETD, PEMPBALS, ETC.
024000      03 PRCTL-CUTOFF-TIMEDT-DATE.
024100         05 PRCTL-CUTOFF-TIMEDT-YY            PIC 9(02).
024200         05 PRCTL-CUTOFF-TIMEDT-MM            PIC 9(02).
024300         05 PRCTL-CUTOFF-TIMEDT-DD            PIC 9(02).
024400      03 PRCTL-SUPPRESS-AMT-YN                PIC X(1).
024500*   USED BY PATTSUM
024600      03 PRCTL-PRT-ALL-YN                     PIC X(1).
024700*   USED BY PATTSUM
024800      03 PRCTL-FORM-NUMBER                    PIC 9(3).
024900*   USED BY BTDPOST, PASYVAR
025000      03 PRCTL-SWT-ALT-FOR-ST.
025100          05 PRCTL-SWT-ALT-ST                 PIC X(2).
025200          05 PRCTL-SWT-ALT-ACCOUNT.
025300             07 PRCTL-SWT-ALT-MAIN-ACCOUNT    PIC 9(4).
025400             07 PRCTL-SWT-ALT-SUB-ACCOUNT     PIC 9(3).
025500      03 PRCTL-LAST-MTH-CLEARED.
025600         05 PRCTL-LAST-MTH-CLEARED-YY         PIC 9(02).
025700         05 PRCTL-LAST-MTH-CLEARED-MM         PIC 9(02).
025800      03 PRCTL-LAST-QTR-CLEARED.
025900         05 PRCTL-LAST-QTR-CLEARED-YY         PIC 9(02).
026000         05 PRCTL-LAST-QTR-CLEARED-MM         PIC 9(02).
026100      03 PRCTL-LAST-YR-CLEARED.
026200         05 PRCTL-LAST-YR-CLEARED-YYYY        PIC 9(04).
026300      03 PRCTL-USE-AVG-RATE                   PIC X(01).
026400      03 PRCTL-SWT-ALT-ST-ID                  PIC X(11).
026500*        USED FOR MI 941
026600      03 PRCTL-FROM-ADJ-CS-DATE.
026700         05 PRCTL-FROM-ADJ-CS-DATE-YY         PIC 9(2).
026800         05 PRCTL-FROM-ADJ-CS-DATE-MM         PIC 9(2).
026900         05 PRCTL-FROM-ADJ-CS-DATE-DD         PIC 9(2).
027000      03 PRCTL-THRU-ADJ-CS-DATE.
027100         05 PRCTL-THRU-ADJ-CS-DATE-YY         PIC 9(2).
027200         05 PRCTL-THRU-ADJ-CS-DATE-MM         PIC 9(2).
027300         05 PRCTL-THRU-ADJ-CS-DATE-DD         PIC 9(2).
027400      03 PRCTL-SSTE-VAC-USE-PRIOR-EARN        PIC X(01).
027500      03 PRCTL-NEW-YEAR-DATE.
027600         05 PRCTL-NEW-YEAR-DATE-YY            PIC 9(2).
027700         05 PRCTL-NEW-YEAR-DATE-MM            PIC 9(2).
027800         05 PRCTL-NEW-YEAR-DATE-DD            PIC 9(2).
027900      03 PRCTL-401K-AREA.
028000         05 PRCTL-401K-FLAG                   PIC X(1).
028100**           Y=Yes  N=No 401K Plan
028200         05 PRCTL-401K-OCCURS-LOCX.
028300            07 PRCTL-401K-OCCURS-LOC          PIC 9(2).
028400**           Deduction Code Occurs = 5 if 401K
028500         05 PRCTL-401K-PCT-LIMIT              PIC V99.
028600**           15% limit
028700         05 PRCTL-401K-AMT-LIMIT              PIC 9(6).
028800**           $10,000 Dollar Limit
028900         05 PRCTL-401K-LIMIT-TO-PCT           PIC X(1).
029000**           Only allow deductions to be a percent
029100      03 PRCTL-ROTH-401K-AREA.
029200         05 PRCTL-ROTH-401K-FLAG              PIC X(1).
029300         05 PRCTL-ROTH-401K-OCC-LOCX          PIC X(2).
029400         05 PRCTL-ROTH-401K-OCC-LOC REDEFINES
029500              PRCTL-ROTH-401K-OCC-LOCX.
029600            07 PRCTL-ROTH-401K-OCC-LOC9       PIC 9(2).
029700         05 PRCTL-ROTH-401K-PCT-LIMIT         PIC V99.
029800         05 PRCTL-ROTH-401K-AMT-LIMIT         PIC 9(6).
029900         05 PRCTL-ROTH-401K-PCT-ONLY-FLAG     PIC 9(6).
030000         05 PRCTL-ROTH-401K-CATCHUP-LIMIT     PIC 9(6).
030100      03 PRCTL-PRIORITIZE-DEDUCTTIONS OCCURS 12 TIMES.
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
030200         05 PRCTL-PRIORITIZE-DEDUCTION        PIC 9(2).
30300      03 FILLER                               PIC X(16).
030400**       This allows for the changing of order in which we process
030500**       deductions in table EMP-DED-EARN
030600      03 PRCTL-PP-BANK-ID                     PIC X(15).
030700*        Bank Account# for LaSalle Bank Positive Pay file
030800      03 PRCTL-PP-AUTHORIZED                  PIC X(1).
030900*        Y/N - Create Positive Pay files?
031000      03 PRCTL-401K-CATCHUP-AGE               PIC 9(2).
031100*        Minimum age at which 401K Catchup may be used
031200      03 PRCTL-401K-CATCHUP-LIMIT             PIC 9(5).
031300*        For emp's >= the age above, can deduct up to this amount
031400*        in addition to 401K-AMT-LIMIT
031500      03 PRCTL-GA-DOL-ACCOUNT                 PIC X(8).
031600*        Georgia Dept. Of Labor account number
031700      03 PRCTL-GA-DOL-TAX-PCT                 PIC 9(2)V999.
031800*        Contribution tax + administrative assesment.
031900*        May be different for each of the GA plants
032000      03 PRCTL-PERS-HRS-HANDLING-CODE             PIC X(1).
032100*        Blank = Normal
032200*          P   = Pay for pers/bday hrs without affecting hrs used.
032300*                (Used once per year, near year-end, to allow
032400*                 paying employees for unused pers/bday hrs)
032500*          U   = Apply to pers/bday hrs used without paying.
032600*                (Used after employees have been paid for unused
032700*                 pers/bday hrs)
032800      03 PRCTL-ALT-STATE                      PIC X(02).
032900*        state of other location at which employees may work
033000      03 PRCTL-ALT-ST-UNEMP-PCT               PIC 9(2)V99.
033100      03 PRCTL-ALT-ST-UNEMP-MAX               PIC 9(6)V99.
033200      03 PRCTL-ALLOW-TD-ENTRY-DYS-AHEAD       PIC 9(1).
033300*        Allow entry of Time Details this many days ahead
033400*        Normally 0, change temporarily in special situations
033500*         0   = none (can only enter TD's for days up until today)
033600*         1-9 = allowed number of days -- 1 = can enter tomorrow's
033700      03 PRCTL-OT-40-INCL-HOLIDAY-FLAG           PIC X(1).
033800*        If PRCTL-OVERTIME-FLAG = "W" (overtime based on 40 hrs),
033900*           Y = include paid holiday hours in the 40
034000*           N = do not include paid holiday hours in the 40
034100*        If PRCTL-OVERTIME-FLAG = "D" (overtime based on 8 hrs),
034200*           Doesn't matter - set to N
034300      03 PRCTL-BORG-ADDL-FIELDS.
034400         05 PRCTL-SHORT-TERM-DIS-ACCT.
034500            07 PRCTL-STD-MAIN-ACCT            PIC 9(4).
034600            07 PRCTL-STD-SUB-ACCT             PIC 9(3).
034700         05 PRCTL-CHILD-SUPP-ACCOUNT.
034800            07 PRCTL-CHILD-SUPP-MAIN-ACCT     PIC 9(4).
034900            07 PRCTL-CHILD-SUPP-SUB-ACCT      PIC 9(3).
035000         05 PRCTL-PROC-FEE-ACCOUNT.
035100            07 PRCTL-PROC-FEE-MAIN-ACCT       PIC 9(4).
035200            07 PRCTL-PROC-FEE-SUB-ACCT        PIC 9(3).
035300         05 PRCTL-SHORT-TERM-DIS-PCT          PIC 9(2).
035400         05 PRCTL-SHORT-TERM-DIS REDEFINES
035500              PRCTL-SHORT-TERM-DIS-PCT.
035600            07 PRCTL-SHORT-TERM-DIS-DEC       PIC V99.
035700         05 PRCTL-PROC-FEE                    PIC 9(2)V99.
035800         05 PRCTL-LONG-TERM-INS-RATE          PIC 9(1)V99.
035900         05 PRCTL-LASER-FORM-FLAG             PIC X(1).
036000*        for checks & weekly summary (Y=laser blank=N)
036100      03 FILLER                               PIC X(72).
