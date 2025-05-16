DIM column(49 TO 55) AS INTEGER, colorfor(-1 TO 0) AS INTEGER
colorfor(-1) = 4
colorfor(0) = 7
SCREEN 12
Newgame:  moves$ = ""
FOR j% = 49 TO 55
  column(j%) = 417
NEXT
player% = 0
CLS
FOR j% = 92 TO 470 STEP 65
  FOR i% = 120 TO 547 STEP 65
    CIRCLE (i%, j%), 28, 13
  NEXT
NEXT
Showmoves: COLOR colorfor(player%)
LOCATE 2, 15
PRINT "(1)     (2)     (3)     (4)     (5)     (6)     (7)", "Moves= "; moves$
Getkeypress: key$ = INKEY$
SELECT CASE key$
  CASE "1" TO "7": j% = ASC(key$)
                   IF column(j%) < 28 THEN GOTO Getkeypress
                   PAINT (j% * 65 - 3060, column(j%)), , 13
                   column(j%) = column(j%) - 65
                   player% = NOT player%
                   moves$ = moves$ + key$
                   GOTO Showmoves
  CASE "N": IF LEN(moves$) THEN GOTO Newgame
  CASE "X": SYSTEM
END SELECT
GOTO Getkeypress

