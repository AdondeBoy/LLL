* =============================================================================
* SYSTEM CONSTANTS
* =============================================================================

; --- SCREEN RELATED CONSTANTS ------------------------------------------------

SCRHEIGH    EQU     480                     ; ALTO DE LA PANTALLA
SCRWIDTH    EQU     640                     ; ANCHO DE LA PANTALLA
SCRIRQ      EQU     1
SCRTIM      EQU     40                      ; 40 MS
TIMSTRV     EQU     20                      ; 20 MS


; --- TRAP RELATED CONSTANTS --------------------------------------------------

KBDTRAP     EQU     0                       ; KEYBOARD UPDATE TRAP
SCRTRAP     EQU     1
MOUTRAP     EQU     2                       ; MOUSE UPDATE TRAP
SNDTRAP     EQU     4                       ; SOUND PLAY TRAP


; --- KEY CODES ---------------------------------------------------------------

KBDRIGHT1   EQU     $27                     ; RIGHT BUTTON KEY
KBDRIGHT2   EQU     'D'                     ; RIGHT BUTTON CHARACTER
KBDLEFT1    EQU     $25                     ; LEFT BUTTON KEY 
KBDLEFT2    EQU     'A'                     ; LEFT BUTTON CHARACTER
KBDUP1      EQU     $26                     ; UP BUTTON KEY
KBDUP2      EQU     'W'                     ; UP BUTTON CHARACTER
KBDSPACE    EQU     $20                     ; SPACE BUTTON KEY
KBDESC      EQU     $1B                     ; PAUSE BUTTON KEY (ESC)

; --- KEYBOARD MASKS ----------------------------------------------------------

KBDMSKRT1   EQU     $01                     ; RIGHT BUTTON 1 MASK
KBDMSKRT2   EQU     $02                     ; RIGHT BUTTON 2 MASK
KBDMSKLF1   EQU     $04                     ; LEFT BUTTON 1 MASK
KBDMSKLF2   EQU     $08                     ; LEFT BUTTON 2 MASK
KBDMSKUP1   EQU     $10
KBDMSKUP2   EQU     $20
KBDMSKSPC   EQU     $40                     ; SPACE BUTTON MASK
KBDMSKESC   EQU     $80                    ; ESC BUTTON MASK

; --- KEYBOARD BITPBIT --------------------------------------------------------

KBDBITRT1   EQU     0
KBDBITRT2   EQU     1
KBDBITLF1   EQU     2
KBDBITLF2   EQU     3
KBDBITUP1   EQU     4
KBDBITUP2   EQU     5
KBDBITSPC   EQU     6
KBDBITESC   EQU     7
















*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~0~
*~Tab size~4~
