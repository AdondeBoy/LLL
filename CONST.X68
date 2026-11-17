*------------------------------------------------------------------------------
* GAME CONSTANTS
*------------------------------------------------------------------------------

; --- GENERAL PURPOSE CONSTANTS -----------------------------------------------

GENCHRW     EQU     8*2                       ; WIDTH IN PIXELS OF A TEXT CHAR
GENCHRH     EQU     15*2                      ; HEIGHT IN PIXELS OF A TEXT CHAR
GENVCHRW    EQU     8                       
GENVCHRH    EQU     15


; --- MAP CONSTANTS -----------------------------------------------------------

MAPSCRIX    EQU     1                       ; POSICIÓN X DE LA SCREEN INICIAL
MAPSCRIY    EQU     0                       ; POSICION Y DE LA SCREEN INICIAL

*MAPSCRIX    EQU     4
*MAPSCRIY    EQU     0                 

MAPWIDTH    EQU     5                       ; NUMERO DE SCREENS HORIZONTALES
MAPHEIGH    EQU     5                       ; NUMERO DE SCREENS VERTICALES
MAPSCRW     EQU     40                      ; Nº TILES HORIZONTALES POR SCREEN
MAPSCRH     EQU     30                      ; Nº TILES VERTICALES POR SCREEN
MAPTILEW    EQU     16                      ; TILE WIDTH
MAPTILEH    EQU     16                      ; TILE HEIGHT

; --- PLAYER CONSTANTS --------------------------------------------------------

PYRWIDTH    EQU     30                      ; SPRITE WIDTH
PYRHEIGH    EQU     42                      ; SPRITE HEIGHT
PYRXINI     EQU     20*MAPTILEW             ; PLAYER INITIAL X POSITION
PYRYINI     EQU     12*MAPTILEW-PYRHEIGH    ; PLAYER INITIAL Y POSITION

*PYRXINI     EQU     8*MAPTILEW
*PYRYINI     EQU     15*MAPTILEW-PYRHEIGH

PYRSPDX     EQU     15                      ; PLAYER RUNNING X SPEED
PYRYSPD     EQU     15                      ; PLAYER FALLING Y SPEED
PYRSTTIC    EQU     3                       ; PLAYER FRAME STATIC

; --- INKLING CONSTANTS ---------------------------------------------------------

INKCOLOF    EQU     6                       ; COLOR OFFSET
INKSPROF    EQU     64                      ; INKLING SPRITE LIST OFFSET
INKSIZE     EQU     24                      ; INKLING WIDTH AND HEIGHT

INKTILE     EQU     17                      ; ID INKLING TILE

; --- GAME STATES -------------------------------------------------------------

STANONE     EQU     -1                      ; ONE USE-ONLY
STAINTR     EQU     0                       ; INTRO STATE
STAPLAY     EQU     1                       ; NORMAL GAME STATE
STAVICT     EQU     2                       ; VICTORY STATE

; --- FILE CONSTANTS ----------------------------------------------------------

FILESIZE    EQU     13                      ; IN NUMBER OF BYTES






































*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
