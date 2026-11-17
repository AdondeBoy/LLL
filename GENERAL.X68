; =============================================================================
; GENERAL SUBROUTINES
; =============================================================================

; -----------------------------------------------------------------------------
GENSTRLN
; GET THE STRING LENGTH
; INPUT    - A1 POINTER TO THE STRING
; OUTPUT   - D0.W STRING LENGTH
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVE.L  A1,-(A7)
            CLR.W   D0
.LOOP       TST.B   (A1)+                   ; COMPRUEBA SI QUEDAN LETRAS
            BEQ     .END
            ADDQ.W  #1,D0
            BRA     .LOOP
.END        MOVEA.L A1,A2
            MOVE.L  (A7)+,A1
            RTS

; -----------------------------------------------------------------------------
GENCENTX
; GIVEN A WIDTH (PIXELS), OUTPUTS THE X MARGINS TO HAVE IT CENTERED ON SCREEN.
; INPUT    - D3.W WIDTH
; OUTPUT   - D1.W XINI, D3.W XEND
; MODIFIES - ONLY OUTPUT
; -----------------------------------------------------------------------------
            MOVE.W  #SCRWIDTH,D1
            SUB.W   D3,D1
            ASR.W   #1,D1                   ; D1: XINI
            ADD.W   #SCRWIDTH,D3
            ASR.W   #1,D3                   ; D3: XEND
            RTS



*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
