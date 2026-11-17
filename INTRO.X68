*------------------------------------------------------------------------------
* INTRO
*------------------------------------------------------------------------------
    
; -----------------------------------------------------------------------------
INTRINIT
; INITIALIZE ENEMY
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            CLR.L   (MOUPOS)                ; RESET VAR OF MOUPOS
            RTS

; -----------------------------------------------------------------------------
INTRUPD
; UPDATE THE ENEMY
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVE.L  D1,-(A7)
            TST.B   (MOUVAL)                ; CHECK MOUVAL IF CLICK PRESSED 
            BEQ     .END
            
            MOVE.L  (MOUPOS),D1
            SWAP    D1
            CMP.W   (NWGAMBLY),D1           ; CHECK IF CLICK IN NEWGAME BUTTON
            BGE     .ISEXITB
            
            CMP.W   (NWGAMBUY),D1
            BLE     .END
            
            SWAP    D1
            CMP.W   (NWGAMBLX),D1           
            BLE     .END
            
            CMP.W   (NWGAMBRX),D1
            BGE     .END
            
            MOVE.W  #STAPLAY,(STANEXT)
            BRA     .END
            
.ISEXITB    CMP.W   (EXITBTLY),D1           ; CHECK IF CLICK IN EXIT BUTTON
            BGE     .END
            
            CMP.W   (EXITBTUY),D1
            BLE     .END
            
            SWAP    D1
            CMP.W   (EXITBTLX),D1
            BLE     .END
            
            CMP.W   (EXITBTRX),D1
            BGE     .END
            
            MOVE.B  #94,D0                  ; IF EXIT BUTTON PRESSED
            TRAP    #15
            SIMHALT                         ; FINISH THE GAME
            
.END        MOVE.L  (A7)+,D1
            RTS
            
; -----------------------------------------------------------------------------
INTPLOT
; PLOTS THE INTRO LOGO
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L A0-A2/D0-D7,-(A7)

            ; DRAW THE LOGO. SIZE OF THE PIC IS 276X140
            LEA     GFXLST,A0
            MOVE.W  #(SCRWIDTH-276)/2,D5    ; CENTER X
            MOVE.W  #SCRHEIGH/2-140,D6      ; PIC BOTTOM AT SCREEN CENTER
            MOVE.W  #115,D3
            JSR     GFXDRWID                ; DRAW PIC

            ; DRAW THE SUBTITLE
            LEA     INTRBUT,A3
            MOVE.B  #21,D0
            MOVE.L  #$00FFFFFF,D1
            MOVE.L  #$01120000,D2
            TRAP    #15
            MOVE.B  #80,D0
            TRAP    #15                     ; PEN TO WHITE
            CLR.L   D1
            ADDQ.B  #1,D0
            TRAP    #15                     ; FILL TO BLACK
            LEA     STRINTR0,A1
            MOVE.W  #300,D2
            JSR     .PRTCTR
            MOVE.W  #400,D2
            LEA     STRINTR1,A1
.PRT        JSR     .PRTCTR
            MOVEM.L (A7)+,A0-A2/D0-D7
            RTS
            
.PRTCTR     MOVE.B  #93,D0
            MOVE.B  #3,D1
            TRAP    #15
            JSR     GENSTRLN                ; COMPUTE THE TITLE STRING LENGTH
            MOVE.W  D0,D3
            MULU.W  #GENCHRW,D3             ; CONVERT TO PIXELS
            JSR     GENCENTX                ; GET CENTERED COORDINATE
            MOVE.B  #95,D0
            TRAP    #15
            MOVE.B  #90,D0
            MOVE.W  D2,D4
            ADD.W   #35,D4
            SUB.W   #5,D2
            SUB.W   #16,D1
            ADD.W   #16,D3
            MOVE.W  D1,(A3)+                ; SAVE LX,UY,RX,LY COORDINATES
            MOVE.W  D2,(A3)+
            MOVE.W  D3,(A3)+
            MOVE.W  D4,(A3)+  
            TRAP    #15
            MOVE.B  #93,D0
            MOVE.B  #1,D1
            TRAP    #15

            
            
            RTS








*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
