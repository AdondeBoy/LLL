*------------------------------------------------------------------------------
* INKLING MANAGEMENT
*------------------------------------------------------------------------------

; -----------------------------------------------------------------------------
INKINIT
; INITIALIZE INKLING VARIABLES
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------

            CLR.B   (INKSAVLS)              ; RESET INKLINGS SAVED
            MOVE.L   #$00040000,(INKANIOF)
            
            RTS

; -----------------------------------------------------------------------------
INKMAPIN
; GET INKLING INDEX FROM MAP COORDINATES
; INPUT     :
; OUTPUT    :   
; MODIFIES  : (INKINDEX)
; -----------------------------------------------------------------------------
            ; THERE IS ONLY ONE INKLING IN MAPPOSX 0,1,4
            CMP.W   #0,(MAPPOSX)
            BEQ     .GREEN
            
            CMP.W   #1,(MAPPOSX)
            BEQ     .ORANGE
            
            CMP.W   #3,(MAPPOSX)
            BEQ     .PURVYEL
            
            CMP.W   #4,(MAPPOSX)
            BEQ     .BLUE
            
.PURVYEL    CMP.W   #0,(MAPPOSY)            ; BOTH PUR AND YEL SHARE THE SAME 
                                            ; X COORD
            BEQ     .PURPLE
            BRA     .YELLOW
            
.BLUE       CLR.B   (INKINDEX)      ; SAVE THE COLOR INDEX
            BRA     .END
            
.GREEN      MOVE.B  #1,(INKINDEX)
            BRA     .END

.ORANGE     MOVE.B  #2,(INKINDEX)
            BRA     .END
            
.PURPLE     MOVE.B  #3,(INKINDEX)
            BRA     .END    
            
.YELLOW     MOVE.B  #4,(INKINDEX)
            
.END        RTS
            
; -----------------------------------------------------------------------------
INKSAVED
; SET INKLING AS SAVED
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D0-D1,-(A7)
            
            CLR.B   D0  
            CLR.B   D1
            
            MOVE.B  (INKINDEX),D0           
            MOVE.B  (INKSAVLS),D1   
            BSET    D0,D1                   ; SET BIT TO 1 AS SAVED        
            MOVE.B  D1,(INKSAVLS)   
            
            MOVEM.L (A7)+,D0-D1         
.END        RTS

; -----------------------------------------------------------------------------
INKPLOT
; INKLING PLOT
; INPUT     : A0 - ADDRESS OF X AND Y COORDINATES
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D2-D6/A0-A2,-(A7)
            
            LEA     INKCOORD,A0
            MULU.W  #INKCOLOF,D7
            MOVE.W  #INKSIZE,D1
            SUBQ.W  #1,D1
            MOVE.L  (A0),D6                 
            MOVE.W  D6,D3                   ; SAVE Y COORDINATE
            SWAP    D6                      
            MOVE.W  D6,D4                   ; SAVE X COORDINATE
            
            CLR.L   D6
            MOVE.L  (INKANIOF),D5
            MOVE.B  #INKSPROF,D6
            
            CMP.B   #10,(SCRCYCCT)          ; UPDATE SPRITE WHEN COUNTER == 10
            BNE     .NOCHNG
            CLR.B   (SCRCYCCT)              ; RESET COUNTER
            
            SWAP    D5                      ; CHANGE SPRITE OFFSET
            MOVE.L  D5,(INKANIOF)

.NOCHNG     ADD.W   D5,D6
            LEA     SPRLST, A1
            MOVE.L  (A1,D6.W),A1            ; INKLING BASE SPRITE
            LEA     COLPL,A2                ; GET PALLET DATA
            

.YLOOP      MOVE.W  (A0),D4                 ; INITIAL X (REINIT AFTER EACH ROW)
            CLR.W   D5
            MOVE.W  #INKSIZE,D5
            SUBQ.B  #1,D5                   ; ROW ITERATOR
.XLOOP      CLR.L   D2
            MOVE.B  (A1)+,D2
            TST.L   D2                      ; CHECK IF D2 CONTAINS AIR
            BEQ     .PLOT
            
            ADD.W   D7,D2                   ; IF NOT, ADD OFFSET
            
.PLOT       JSR     GFXDRWCL                ; PLOT PIXEL
            ADDQ.W  #1,D4
            DBRA.W  D5,.XLOOP
            ADDQ.W  #1,D3
            DBRA.W  D1,.YLOOP
            
            MOVEM.L (A7)+,D2-D6/A0-A2
            RTS


            
            









*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
