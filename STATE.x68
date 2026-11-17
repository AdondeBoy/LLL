; -----------------------------------------------------------------------------
; ESTADOS DEL JUEGO
; ----------------------------------------------------------------------------- 


; -----------------------------------------------------------------------------
STAINI
; INICIALIZA EL ADMINISTRADOR DE ESTADOS
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVE.W  #STANONE,(STACUR)
            MOVE.W  #STAINTR,(STANEXT)       ; MOSTRARA PRIMERO LA INTR
            RTS
            
; -----------------------------------------------------------------------------
STAUPD
; ACTUALIZA EL ESTADO Y LO INICIALIZA SI ES NECESARIO
; INPUT     :
; OUTPUT    :
; MODIFIES  : IF NECESSARY, STACUR
; -----------------------------------------------------------------------------
            MOVEM.L D0-D1/A0-A1,-(A7)
            CLR.L   D0
            MOVE.W  (STANEXT),D0
            CMP.W   (STACUR),D0             ; COMPRUEBA SI SE CAMBIA EL ESTADO
            BEQ     .DOUPD
            MOVE.W  D0,(STACUR)             ; SI SE CAMBIA EL ESTADO
            LSL.L   #2,D0                   ; PREPARE .INI INDEX
            MOVE.L  D0,A0
            MOVE.L  .INI(A0),A0
            JSR     (A0)                    ; SPECIFIED BY INDEX            
.DOUPD      CLR.L   D0                      ; ALWAYS UPDATE           
            MOVE.W  (STACUR),D0
            LSL.L   #2,D0
            MOVE.L  D0,A0
            MOVE.L  .UPD(A0),A0
            JSR     (A0)                    ; JUMP TO ESPECIFIC SUBROUTINE
            MOVEM.L (A7)+,D0-D1/A0-A1
            RTS

.INI        DC.L    STAINTRI,STAPLAYI,STAVICTI
.UPD        DC.L    STAINTRU,STAPLAYU,STAVICTU            

; -----------------------------------------------------------------------------
STAPLOT
; PERFORMS STATE PLOT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0/A0,-(A7)
            CLR.L   D0
            MOVE.W  (STACUR),D0
            LSL.L   #2,D0
            MOVE.L  D0,A0
            MOVE.L  .PLTTBL(A0),A0
            JSR     (A0)                    ; JUMP TO PLOT SUBROUTINE
            MOVEM.L (A7)+,D0/A0
            RTS
.PLTTBL     DC.L    STAINTRP,STAPLAYP,STAVICTP

; -----------------------------------------------------------------------------
STAPLAYI
; INICIALIZA EL ESTADO DE JUEGO
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D1-D2,-(A7)
            JSR     MAPINIT
            JSR     PYRINIT
            JSR     INKINIT
            CLR.B   D1
            MOVE.L  #1,D2
            TRAP    #SNDTRAP                ; PLAYER PLAY SOUND
            MOVEM.L (A7)+,D1-D2
            RTS
            
; -----------------------------------------------------------------------------
STAPLAYU
; ACTUALIZA EL ESTADO DE JUEGO
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------

            TRAP    #KBDTRAP
            JSR     PYRUPD
            JSR     MAPUPD
            RTS
            
; -----------------------------------------------------------------------------
STAPLAYP
; PLAY STATE PLOT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            JSR     MAPPLOT
            JSR     PYRPLOT

            RTS

; -----------------------------------------------------------------------------
STAINTRI    
; INTRO STATE INIT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            RTS

; -----------------------------------------------------------------------------
STAINTRU
; INTRO STATE UPDATE
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            TRAP    #MOUTRAP
            JSR     INTRUPD
            RTS

; -----------------------------------------------------------------------------
STAINTRP    
; INTRO STATE PLOT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; NOTE     - JUST A WRAPPER FOR INTPLOT
; -----------------------------------------------------------------------------
            JSR     INTPLOT
            RTS

; -----------------------------------------------------------------------------
STAVICTI
; VICTORY STATE INIT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            CLR.B   (MOUVAL)
            MOVE.B  #76,D0
            CLR.B   D1
            MOVE.L  #2,D2
            TRAP    #15
            CLR.L   D2
            MOVE.B  #1,D1
            TRAP    #SNDTRAP                ; PLAY FINISH SOUND
            RTS

; -----------------------------------------------------------------------------
STAVICTU
; VICTORY STATE UPDATE
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0,-(A7)
            
            
.CONT       TRAP    #MOUTRAP
            TST.B   (MOUVAL)
            BEQ     .END
            
            MOVE.B  #94,D0
            TRAP    #15
            SIMHALT
            
.END        MOVEM.L (A7)+,D0
            RTS

; -----------------------------------------------------------------------------
STAVICTP
; GAME OVER STATE PLOT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L A0-A1/D0-D7,-(A7)
            
.WAIT       ; DRAW THE SUBTITLE
            MOVE.B  #21,D0
            MOVE.L  #$00FFFFFF,D1
            MOVE.L  #$01090000,D2
            TRAP    #15
            MOVE.B  #80,D0
            TRAP    #15                     ; PEN TO WHITE
            CLR.L   D1
            ADDQ.B  #1,D0
            TRAP    #15                     ; FILL TO BLACK
            MOVE.W  #5,D4
            MOVE.W  #200,D2  
            LEA     STRVICT0,A1
.LOOP       JSR     .PRTCTR
            ADD.W   #15,D2
            MOVEA.L A2,A1
            DBRA    D4,.LOOP
.END        MOVEM.L (A7)+,A0-A1/D0-D7
            RTS
            
.PRTCTR     JSR     GENSTRLN                ; COMPUTE THE TITLE STRING LENGTH
            MOVE.W  D0,D3
            MULU.W  #GENVCHRW,D3             ; CONVERT TO PIXELS
            JSR     GENCENTX                ; GET CENTERED COORDINATE
            MOVE.B  #95,D0
            TRAP    #15            
            
            RTS







































*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
