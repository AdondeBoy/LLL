*------------------------------------------------------------------------------
* SYSTEM VARIABLES
*------------------------------------------------------------------------------

; --- KEYBOARD RELATED VARIABLES ----------------------------------------------
; KEYS: RIGHT,D,LEFT,A,UP,W,TAB,SPACE,ESC        

KBDVAL      DS.B    1

; --- MOUSE RELATED VARIABLES -------------------------------------------------

MOUVAL      DS.B    1                       ; LEFT CLICK IN LAST BIT
            DS.W    0
MOUPOS      DS.L    1


; --- SCREEN RELATED VARIABLES ------------------------------------------------

SCRINTCT    DS.B    1                       ; INTERRUPT COUNTER/FLAG
SCRCYCCT    DS.B    1                       ; CYCLE COUNTER
            DS.W    0








*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
