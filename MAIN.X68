* =============================================================================
* TITLE       : LLL
* AUTHOR      : Santiago Rattenbach y Albert Salom
* =============================================================================

            ORG     $1000
        
            INCLUDE "SYSTEM.X68"
            INCLUDE "PLAYER.X68"
            INCLUDE "STATE.X68"
            INCLUDE "SYSCONST.X68"            
            INCLUDE "MAP.X68"
            INCLUDE "CONST.X68"
            INCLUDE "GFX.X68"
            INCLUDE "INTRO.X68"
            INCLUDE "GENERAL.X68"
            INCLUDE "INKLING.X68"
            
            INCLUDE "DATA/MAPDATA.X68"
            INCLUDE "DATA/GFXDATA.X68"
            INCLUDE "DATA/SPRDATA.X68"
            INCLUDE "DATA/COLDATA.X68"
            INCLUDE "DATA/STRDATA.X68"
        
START:  

; ------------ INITIALIZATION -------------------------------------------------

            JSR     SYSINIT
            JSR     STAINI
            
.LOOP

; ------------ UPDATE ---------------------------------------------------------

; READ INPUT DEVICES
            JSR     STAUPD
            
; UPDATE GAME LOGIC 
            

; ------------ SYNC -----------------------------------------------------------

.WAIT       TST.B   (SCRINTCT)
            BEQ     .WAIT
            CLR.B   (SCRINTCT)

; ------------ PLOT -----------------------------------------------------------       
            
            JSR     STAPLOT
            TRAP    #SCRTRAP
            
            BRA     .LOOP
            
            SIMHALT
            
            INCLUDE "VARS.X68"
            INCLUDE "SYSVARS.X68"

            END    START        
































*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
