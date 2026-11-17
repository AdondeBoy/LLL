*------------------------------------------------------------------------------
* GAME VARIABLES
*------------------------------------------------------------------------------

; --- MAP VARIABLES -----------------------------------------------------------

MAPPOSX     DS.W    1
MAPPOSY     DS.W    1
MAPSCRPT    DS.L    1

; --- PLAYER VARIABLES --------------------------------------------------------

PYRINDX
PYRSPR      DS.B    1                       ; PLAYER CURRENT SPRITE
PYRFACE     DS.B    1                       ; (00 = RIGHT, 04=LEFT)
PYRPOSX     DS.W    1                       ; PLAYER X POSITION
PYRPOSY     DS.W    1                       ; PLAYER Y POSITION
PYRGRV      DS.B    1                       ; (00 = GRAV, 08 = ANTIGRAV)  
PYRXSPD     DS.B    1                       ; HORIZONTAL SPEED
PYRISST     DS.B    1                       ; IS PLAYER STATIC? (FF = Y, 00=N)
PYRLIFE     DS.B    1                       ; (00 = ALIVE, FF = DEAD)
PYRFALL     DS.B    1                       ; (00 = N, FF = Y)

PYRCNT      DS.B    1


            DS.W    0  
            
; --- CHECKPOINT VARIABLES ----------------------------------------------------

SAVEBUFFER
CHKPX       DS.W    1                       ; LAST CHECKPOINT X
CHKPY       DS.W    1                       ; LAST CHECKPOINT Y
CHKMPPX     DS.W    1                       ; MAP X POSITION OF CHECKPOINT
CHKMPPY     DS.W    1                       ; MAP Y POSITION OF CHECKPOINT
CHKPSC      DS.L    1                       ; POINTER TO SCREEN OF CHECKPOINT
CHKPGRV     DS.B    1                       ; GRAVITY OF LAST CHECKPOINT

            DS.W    0
            
; --- INKLING VARIABLES -------------------------------------------------------
            
INKANIOF    DS.L    1                       ; OFFSET USED IN INKLING ANIMATION
INKCOORD    DS.L    1                       ; INKLING COORDINATES IN CUR SCREEN
INKINDEX    DS.B    1                       ; INDEX OF CURRENT INKLING
INKSAVLS    DS.B    1                       ; LIST OF SAVED INKLINGS
; 000YPOGB
            
            DS.W    0
            
; --- STATES VARIABLES --------------------------------------------------------

STACUR      DS.W    1
STANEXT     DS.W    1

; --- INTRO VARIABLES --------------------------------------------------------

INTRBUT
NWGAMBLX    DS.W    1                       ; LEFT X NEW GAME BUTTON                                      
NWGAMBUY    DS.W    1                       ; UP Y NEW GAME BUTTON
NWGAMBRX    DS.W    1                       ; RIGHT X NEW GAME BUTTON
NWGAMBLY    DS.W    1                       ; LOW Y NEW GAME BUTTON
EXITBTLX    DS.W    1                       ; LEFT X EXIT BUTTON                                       
EXITBTUY    DS.W    1                       ; UP Y EXIT BUTTON
EXITBTRX    DS.W    1                       ; RIGHT X EXIT BUTTON
EXITBTLY    DS.W    1                       ; LOW Y EXIT BUTTON


































*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
