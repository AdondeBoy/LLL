* =============================================================================
* SYSTEM
* =============================================================================

; -----------------------------------------------------------------------------
SYSINIT
; INICIALIZA EL SISTEMA
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            MOVE.L  (A7)+,A0
            JSR     KBDINIT
            JSR     MOUINIT
            JSR     SNDINIT
            JSR     SCRINIT
            
            ANDI.W  #$DFFF,SR             ; MASK SR TO USER
            MOVE.L  A0,-(A7)
            
            RTS
            
; -----------------------------------------------------------------------------
SCRINIT
; INICIALIZA LA PANTALLA. SCREEN RESOLUTION, WINDOWED MODE, CLEAR SCREEN
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0-D3,-(A7)
            ORI.W   #$0700,SR               ; DISABLE INTERRUPTIONS
            MOVE.L  #SCRUPD,($80+SCRTRAP*4) ; INSTALL TRAP
            
            ; SET SCREEN RESOLUTION
            MOVE.L  #SCRWIDTH<<16|SCRHEIGH,D1 
            MOVE.B  #33,D0
            TRAP    #15
            
            ; MODO VENTANA
            MOVE.L  #1,D1
            TRAP    #15
            
            ; CLEAR VISIBLE SCREEN
            MOVE.W  #$FF00,D1
            MOVE.B  #11,D0
            TRAP    #15
            
            ; ENABLE DOUBLE BUFFER
            MOVE.W  #17,D1
            MOVE.B  #92,D0
            TRAP    #15
            
            ; CLEAR HIDDEN SCREEN
            MOVE.W  #$FF00,D1
            MOVE.B  #11,D0
            TRAP    #15
            
            ; EXCEPTION VECTOR
            MOVE.L  #SCRISR, ($60+SCRIRQ*4)
            MOVE.B  #32,D0
            MOVE.B  #5,D1
            TRAP    #15           

            ; ENABLE AUTO IRQ
            MOVE.B  #$80+SCRIRQ,D2
            MOVE.B  #SCRTIM,D3
            MOVE.B  #6,D1
            TRAP    #15
            
            
            CLR.B   (SCRINTCT)
            CLR.B   (SCRCYCCT)
            ANDI.W  #$F8FF,SR               ; ENABLE INTERRUPTIONS
            MOVEM.L (A7)+,D0-D3
            
            RTS
            
            
; -----------------------------------------------------------------------------
SCRISR
; SCREEN TIMER ISR. INCREASES THE INTERRUPT COUNTER AND UPDATES DOUBLE BUFFER.
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            ADDQ.B  #1,(SCRINTCT)           ; UPDATE INT FLAG/COUNTER
            ADDQ.B  #1,(SCRCYCCT)           ; UPDATE CYCLE COUNTER
            RTE

; -----------------------------------------------------------------------------
SCRUPD
; TRAP SERVICE ROUTINE IN CHARGE OF VISUALIZING CURRENT FRAME AND CLEARING
; BUFFER FOR THE NEXT ONE.
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.W D0-D1,-(A7)
            MOVE.B  #94,D0                  ; UPDATE DOUBLE BUFFER
            TRAP    #15
            MOVE.W  #$FF00,D1               ; CLEAR HIDDEN BUFFER
            MOVE.B  #11,D0
            TRAP    #15
            MOVEM.W (A7)+,D0-D1
            RTE


; -----------------------------------------------------------------------------
KBDINIT
; INICIALIZA EL TECLADO
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            CLR.B   (KBDVAL)                 ; INICIALIZA LAS VARIABLES
            MOVE.L  #KBDREAD,($80+KBDTRAP*4) ; INSTALL KBDTRAP
            RTS
            
; -----------------------------------------------------------------------------
KBDREAD
; RUTINA DE SERVICIO QUE ACTUALIZA EL VALOR DE KBDVAL
; INPUT     :
; OUTPUT    : (KBDVAL)
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D0-D3,-(A7)
            MOVE.B  #19,D0
            MOVE.L  #KBDESC<<24+KBDSPACE<<16+KBDUP2<<8+KBDUP1,D1
            TRAP    #15
            MOVE.W  #3,D2
            JSR     .SAVE                   ; SAVE ESCAPE, SPACE AND UP1-2 KEYS
            CLR.L   D1
            MOVE.L  #KBDLEFT2<<24+KBDLEFT1<<16+KBDRIGHT2<<8+KBDRIGHT1,D1
            TRAP    #15
            MOVE.W  #3,D2
            JSR     .SAVE                   ; SAVE LEFT1-2 AND RIGHT1-2 KEYS
            
            MOVE.B  D3,(KBDVAL)
            
            MOVEM.L (A7)+,D0-D3
            RTE
                   
.SAVE       LSL.L   #8,D1                   ; CODIFICANDO A CODIGO BIT A BIT
            ROXL.B  #1,D3
            DBRA.W  D2,.SAVE
            RTS

; -----------------------------------------------------------------------------
MOUINIT
; INICIALIZA EL MOUSE
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            CLR.B   (MOUVAL)                 ; INICIALIZA LAS VARIABLES
            MOVE.L  #MOUREAD,($80+MOUTRAP*4) ; INSTALL MOUTRAP
            RTS


; -----------------------------------------------------------------------------
MOUREAD
; RUTINA DE SERVICIO QUE ACTUALIZA EL VALOR DE MOUVAL Y MOUPOS
; INPUT     :
; OUTPUT    : (MOUVAL) (MOUPOS)
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D0-D1,-(A7)
            MOVE.B  #61,D0
            CLR.B   D1
            TRAP    #15
            AND.B   #%00000001,D0
            MOVE.B  D0,(MOUVAL)
            MOVE.L  D1,(MOUPOS)                     
            MOVEM.L (A7)+,D0-D1
            RTE
                   
; -----------------------------------------------------------------------------
SNDINIT
; SOUND SYSTEM INIT
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0-D2,-(A7)
            MOVE.L  #SNDPLAY,($80+SNDTRAP*4) ; INSTALL SNDTRAP
            MOVE.W #1,D2
            CLR.B   D1
            LEA     .SNDLIST,A2
            MOVE.L  (A2)+,A1                
            
.LOOP       MOVE.B  #71,D0
            TRAP    #15
            ADDQ.B  #1,D1
            MOVE.L  (A2)+,A1                ; NEXT SOUND
            DBRA    D2,.LOOP
            MOVEM.L (A7)+,D0-D2
            RTS
            
.SNDPLAY    DC.B    'PLAY.wav',0
.SNDVICT    DC.B    'END.wav',0
.SNDLIST    DC.L    .SNDPLAY,.SNDVICT,0
; -----------------------------------------------------------------------------
SNDPLAY
; SOUND PLAY TRAP
; INPUT     : D1.B  SOUND ID                D2.L SOUND PRESET
; OUTPUT    : NONE
; MODIFIES  : NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0,-(A7)
            MOVE.B  #76,D0
            TRAP    #15
                        
            MOVEM.L (A7)+,D0
            RTE







































*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~0~
*~Tab size~4~
