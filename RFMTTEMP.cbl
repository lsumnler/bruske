000100 IDENTIFICATION DIVISION.
000200
000300 PROGRAM-ID. NNNNNN01.
000400*****************************************************************
000500*  Written  01/11/12  LMS
000600*  One-time program used to reformat the XXXXXXXXXXXXXXXXXXXX
000700*  to accommodate changes to bring Borg onto Indak Payroll
000800*  system.
000900*****************************************************************
001000
001100 AUTHOR. Len Sumnler
001200
001300 ENVIRONMENT DIVISION.
001400
001500 CONFIGURATION SECTION.
001600
001700 SOURCE-COMPUTER. WANG-2200-VS.
001800 OBJECT-COMPUTER. WANG-2200-VS.
001900
002000     COPY FIGCONS.
002100
002200 INPUT-OUTPUT SECTION.
002300
002400 FILE-CONTROL.
002500
002600      COPY SLCRT.
002700
002800     SELECT OTIME-DETAIL-FILE
002900         ASSIGN       TO "OTIMEDT", "DISK", NODISPLAY
003000         ORGANIZATION IS INDEXED
003100         ACCESS MODE  IS DYNAMIC
003200         RECORD KEY   IS OTD-KEY
003300         ALTERNATE RECORD KEY
003400             1 IS OTD-ALT-KEY-1 WITH DUPLICATES
003500             2 IS OTD-ALT-KEY-2 WITH DUPLICATES
003600         FILE STATUS  IS OTD-FILE-STATUS.
003700
003800      COPY SLTIMEDT.
003900
004000
004100/
004200 DATA DIVISION.
004300
004400 FILE SECTION.
004500
004600      COPY FDCRT.
004700
004800 FD  OTIME-DETAIL-FILE
004900*  2/19/91 RGR - comments only
005000*  5/24/91 JCM work schedule time for start/stop/lunch
005100* 10/14/91 JCM Added TD-ADJ-EARNED-HRS &
005200*                    TD-ADJ-EARNED-HRS-FLAG
005300* 10/30/91 JCM Added TD-EARNED-HRS-ADJ-FLAG
005400*  3/10/94 JCM Added TD-ALT-KEY-3
005500*  5/23/94 JCM Added TD-ADJ-WRK-SCH-FLAG for PIED/STHN
005600*  1/19/95 JCM Added TD-FIX-ADJ-WRK-SCH-FLAG for PIED/STHN
005700*  2/02/95 JCM Added TD-TRAINING-FLAG for PIED/STHN
005800* 12/15/98 RGR Added TD-USED-AVG-RATE-FLAG
005900*  3/18/99 JCM Revised prim key for y2k & wrksch rec was x(180)
006000*  6/11/03 RGR Changed comments re: training-flag
006100*
006200         RECORD CONTAINS 240 COMPRESSED CHARACTERS
006300         LABEL RECORDS ARE STANDARD
006400         VALUE OF
006500             FILENAME IS OTD-FILE-NAME
006600             LIBRARY  IS OTD-LIBRARY
006700             VOLUME   IS OTD-VOLUME
006800             SPACE    IS OTD-SPACE.
006900
007000 01  OTD-RECORD.
007100     05 OTD-KEY.
007200         10 OTD-EMP-NUM                          PIC 9(4).
007300         10 OTD-ALT-KEY-1.
007400             15 OTD-DATE-WORKED-CYMD             PIC 9(8).
007500             15 FILLER REDEFINES OTD-DATE-WORKED-CYMD.
007600                 20 OTD-DATE-WORKED-CC           PIC 9(2).
007700                 20 OTD-DATE-WORKED-YMD          PIC 9(6).
007800                 20 FILLER REDEFINES OTD-DATE-WORKED-YMD.
007900                     25 OTD-DATE-WORKED-YY       PIC 9(2).
008000                     25 OTD-DATE-WORKED-MM       PIC 9(2).
008100                     25 OTD-DATE-WORKED-DD       PIC 9(2).
008200         10 OTD-HRS-TYPE-CODE                    PIC X.
008300*            Allows holiday and other hours to overlap on holiday.
008400*            H = holiday hrs  N = non-holiday hrs
008500         10 OTD-START-TIME                       PIC 99V99.
008600     05  OTD-START-APPROVAL-FLAG                 PIC X.
008700*        Y = override "normal working hours" limitations when
008800*            computing hrs worked
008900     05  OTD-STOP-TIME                           PIC 99V99.
009000     05  OTD-STOP-APPROVAL-FLAG                  PIC X.
009100*        Y = override "normal working hours" limitations when
009200*            computing hrs worked
009300     05  OTD-EMP-NAME                            PIC X(28).
009400     05  OTD-ALT-KEY-2.
009500         10 OTD-OP-CODE.
009600             15 OTD-OP-CODE4                     PIC X(4).
009700             15 FILLER                          PIC X(6).
009800*           operation code - must exist in OPCODE file
009900     05  OTD-DIST-CODE                           PIC X(4).
010000*        payroll distribution category from OPCODE file record
010100     05  OTD-PCS-MADE                            PIC 9(6).
010200     05  OTD-STD-RATE                            PIC 999V99.
010300*        (hrs per thousand, from OPCODE file)
010400     05  OTD-TYPE                                PIC X.
010500*        I = Incentive  H = Hourly   else blank
010600     05  OTD-ADJUSTED-HRS                        PIC 99V99.
010700     05  OTD-ADJ-EARNED-HRS                      PIC 99V99.
010800*        (pcs-made / 1000 * std-rate)
010900     05  OTD-POST-FLAG                           PIC X.
011000*        Y = hours from this record have been written to PRTIMFIL
011100     05  OTD-ENTERED-USER-ID                     PIC X(3).
011200     05  OTD-UPDATE-USER-ID                      PIC X(3).
011300     05  OTD-UPDATE-DATE.
011400         10  OTD-UPDATE-DATE-YY                  PIC 9(2).
011500         10  OTD-UPDATE-DATE-MM                  PIC 9(2).
011600         10  OTD-UPDATE-DATE-DD                  PIC 9(2).
011700     05  OTD-UPDATE-TIME.
011800         10  OTD-UPDATE-TIME-HH                  PIC 9(2).
011900         10  OTD-UPDATE-TIME-MM                  PIC 9(2).
012000     05  OTD-ADJ-START-TIME                      PIC 99V99.
012100     05  OTD-ADJ-STOP-TIME                       PIC 99V99.
012200     05  OTD-ABSENCE-CODE                        PIC X.
012300*        from OPCODE file record
012400     05  OTD-CORRECTION-FLAG                     PIC X.
012500*        Y or N; V if Void
012600     05  OTD-DAY-OF-WEEK                         PIC X.
012700     05  OTD-WRKSCH-KEY8.
012800         10  OTD-WRKSCH-CODE                     PIC X(4).
012900         10  OTD-WRKSCH-DAY-OF-WEEK              PIC X.
013000         10  OTD-WRKSCH-EFF-COMPL-CYMD           PIC 9(8).
013100          10  FILLER REDEFINES OTD-WRKSCH-EFF-COMPL-CYMD.
013200             15 OTD-WRKSCH-EFF-COMPL-CC      PIC 9(2).
013300             15 OTD-WRKSCH-EFF-COMPL-YMD     PIC 9(6).
013400     05  OTD-WRKSCH-DATA.
013500         10  OTD-WRKSCH-START-TIME               PIC 99V99.
013600         10  OTD-WRKSCH-STOP-TIME                PIC 99V99.
013700         10  OTD-WRKSCH-LUNCH-START              PIC 99V99.
013800         10  OTD-WRKSCH-LUNCH-STOP               PIC 99V99.
013900     05  OTD-EARNED-HRS                          PIC 99V99.
014000     05  OTD-ADJ-EARNED-HRS-FLAG                 PIC X(01).
014100*           Prts as "A" next to "EARNED HRS" on SDTE
014200*           If SDTE adjusts Missed/Earned Hrs, Flag = "A"
014300     05  OTD-EARNED-HRS-ADJ-FLAG                 PIC X(01).
014400*           If SDTE determines that earned hrs are adjustable,
014500*            user is prompted; Y=Yes N=No
014600     05 OTD-ALT-KEY-3.
014700         10  OTD-DATE-WORKED-CYMD-3              PIC 9(8).
014800         10  OTD-TEAM-3.
014900             15  OTD-TEAM                        PIC X(3).
015000         10  OTD-STAT-3.
015100             15  OTD-STAT-FLAG-1                 PIC X.
015200             15  OTD-STAT-FLAG-2                 PIC X.
015300             15  OTD-STAT-FLAG-3                 PIC X.
015400         10  OTD-NAME-3                          PIC X(10).
015500         10  OTD-INITIAL-3                       PIC X.
015600         10  OTD-STOP-TIME-3                     PIC 99V99.
015700     05  OTD-ADJ-WRK-SCH-FLAG                    PIC X(1).
015800*           Y if adjusted, else blank
015900     05  OTD-FIX-ADJ-WRK-SCH-FLAG                PIC X(1).
016000     05  OTD-TRAINING-FLAG                       PIC X(1).
016100*         "#" IN TRAINING  (else blank)
016200*         Note: Dist Code is forced to OFST, Std Rate and Pcs Made
016300*               will be present, earned hrs related flds all
016400*               zero or blank
016500     05  OTD-USED-AVG-RATE-FLAG                  PIC X.
016600*        Y or N; Y = ADJ-EARNED-HRS was calculated to pay employee
016700*                    at her average rate.
016800     05  FILLER                                 PIC X(59).
016900
017000
017100      COPY FDTIMEDT.
017200
017300/
017400 WORKING-STORAGE SECTION.
017500
017600 77  APPLICATION-NAME  PIC X(30) VALUE SPACES.
017700
017800 01  OK-TO-GO                   PIC X VALUE " ".
017900
018000 01  OTD-FILE-NAME                      PIC X(8) VALUE "OTIMEDT".
018100 01  OTD-LIBRARY                        PIC X(8) VALUE SPACES.
018200 01  OTD-VOLUME                         PIC X(6) VALUE SPACES.
018300 01  OTD-SPACE                          PIC 9(6) VALUE ZEROES.
018400
018500 01  OTD-FILE-STATUS                    PIC X(2) VALUE SPACES.
018600
018700    COPY WSTIMEDT.
018800
018900    COPY WSCRT.
019000
019100    COPY WSMESSG.
019200    COPY WSESCAPE.
019300    COPY WSFILACC.
019400    COPY WSWAIT.
019500    COPY WSFILEST.
019600* SCREEN SECTION.
019700
019800* DUMMY SCREEN.
019900 01  ENTRY-SCREEN-1 USAGE IS DISPLAY-WS.
020000
020100     COPY SDFILACC.
020200
020300     COPY SDWAIT.
020400
020500/
020600 PROCEDURE DIVISION.
020700
020800 DECLARATIVES.
020900
021000      COPY DSTIMEDT.
021100
021200 END DECLARATIVES.
021300
021400/
021500 MAIN-LOGIC SECTION.
021600
021700 INITIALIZATION.
021800     DISPLAY "This program reformats the Time Detail file in
021900-        "preperation for bring Borg into the payroll system.".
022000
022100     ACCEPT OK-TO-GO.
022200     IF OK-TO-GO NOT = "Y" AND NOT = "y"
022300         GO TO INITIALIZATION.
022400     OPEN INPUT OTIME-DETAIL-FILE.
022500     OPEN OUTPUT TIME-DETAIL-FILE.
022600
022700     PERFORM PROCESS-INPUT THRU
022800             PROCESS-INPUT-EXIT
022900         UNTIL OTD-FILE-STATUS = AT-END.
023000
023100
023200 END-OF-PROGRAM SECTION.
023300
023400 EXIT-PROGRAM.
023500     EXIT PROGRAM.
023600
023700 DONE.
023800     STOP RUN.
023900
024000 END-OF-PROGRAM-EXIT.  EXIT.
024100
024200 CLOSING-PROCEDURE SECTION.
024300
024400 PROCESS SECTION.
024500
024600 PROCESS-INPUT.
024700
024800     READ OTIME-DETAIL-FILE NEXT.
024900     IF OTD-FILE-STATUS = AT-END
025000         GO TO PROCESS-INPUT-EXIT.
025100
025200
025300     WRITE TD-RECORD.
025400
025500 PROCESS-INPUT-EXIT.  EXIT.
025600
