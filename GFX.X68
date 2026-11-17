; =============================================================================
; GRAPHICS LIBRARY.
; =============================================================================

; -----------------------------------------------------------------------------
GFXDRWID
; DRAWS A PICTURE BY ID
; INPUT    - A0 POINTER TO THE LIST OF POINTERS TO PICTURES
;            D3.W OBJECT ID
;            D5.W X OFFSET
;            D6.W Y OFFSET            
; OUTPUT   - NONE
; MODIFIES - A1
; -----------------------------------------------------------------------------  
            MOVEM.L D0-D4/A0-A1,-(A7)
            ROL.W   #2,D3                   ; PREPARE INDEX
            MOVE.L  (A0,D3.W),A1
            
            
; -----------------------------------------------------------------------------
GFXDRPIC
; DRAWS A PICTURE
; INPUT    - A1 POINTER TO THE PICTURE
;            D5.W X OFFSET
;            D6.W Y OFFSET
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------     
.LOOP       MOVE.W  (A1)+,D0                ; COMMAND ID
            BEQ     .END
            LEA     .JMPTBL,A0
            ROL.W   #2,D0                   ; TIMES 4 SINCE WE ACCESS LONG
            MOVE.L  (A0,D0.W),A0            ; GET THE JUMP ADDRESS
            ROR.W   #2,D0
            ADD.W   #79,D0
            JMP     (A0)                    ; JUMP!
.END        MOVEM.L (A7)+,D0-D4/A0-A1
            RTS
.JMPTBL     DC.L    .LOOP                   ; 00 UNUSED
            DC.L    .D1L                    ; 01 SET PEN
            DC.L    .D1L                    ; 02 SET FILL
            DC.L    .D1D2W                  ; 03 DRAW PIXEL
            DC.L    .D1L2                   ; 04 SET PEN AND FILL
            DC.L    .D1D4W                  ; 05 DRAW LINE FULL SPECS
            DC.L    .D1D2W                  ; 06 DRAW LINE POLYLINE VERSION
            DC.L    .D1D2W                  ; 07 MOVE TO
            DC.L    .D1D4W                  ; 08 DRAW FILLED RECTANGLE
            DC.L    .D1D4W                  ; 09 DRAW FILLED ELLIPSE
            DC.L    .D1D2W                  ; 10 FLOOD FILL
            DC.L    .D1D4W                  ; 11 DRAW UNFILLED RECTANGLE
            DC.L    .D1D4W                  ; 12 DRAW UNFILLED ELLIPSE
            DC.L    .D1W                    ; 13 SET DRAWING MODE
            DC.L    .D1W                    ; 14 SET PEN WIDTH
.D1W        MOVE.W  (A1)+,D1                ; GET WORD
            TRAP    #15
            JMP     .LOOP
.D1L        MOVE.L  (A1)+,D1                ; GET LONG
            TRAP    #15
            JMP     .LOOP
.D1L2       MOVE.L  (A1)+,D1                ; GET LONG AND DO SET PEN AND FILL
            MOVE.B  #80,D0
            TRAP    #15
            ADDQ.B  #1,D0
            TRAP    #15
            JMP     .LOOP
.D1D2W      MOVEM.W (A1)+,D1-D2             ; GET 2 WORDS
            ADD.W   D5,D1
            ADD.W   D6,D2
            TRAP    #15
            JMP     .LOOP
.D1D4W      MOVEM.W (A1)+,D1-D4             ; GET 4 WORDS
            ADD.W   D5,D1
            ADD.W   D6,D2
            ADD.W   D5,D3
            ADD.W   D6,D4
            TRAP    #15
            JMP     .LOOP

; -----------------------------------------------------------------------------
GFXDRWCL
; DRAWS A PICTURE BY ID
; INPUT    - A2 POINTER TO THE LIST OF POINTERS TO COLORS
;            D2.B COLOR ID
;            D3.W X OFFSET
;            D4.W Y OFFSET            
; OUTPUT   - NONE
; MODIFIES - A1
; -----------------------------------------------------------------------------  
            MOVEM.L D0-D7/A2,-(A7)
            ROL.W   #2,D2                   ; PREPARE INDEX
            MOVE.L  (A2,D2.W),A2      

; -----------------------------------------------------------------------------
GFXDRPXL
; DRAWS THE PIXEL OF A SPRITE
; INPUT    - A2 POINTER TO THE COLOR
;            D4.W X OFFSET
;            D3.W Y OFFSET
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVE.L  (A2),D1
            AND.L   #$FF000000,D1
            TST.L   D1                      ; COMPRUEBA SI ES AIRE
            BNE     .END                    ; SI LO ES, NO SE DIBUJA NADA

.PAINT      MOVE.B  #80,D0
            MOVE.L  (A2),D1
            TRAP    #15
            MOVE.B  #82,D0
            MOVE.W  D4,D1
            MOVE.W  D3,D2
            TRAP    #15
            
.END        MOVEM.L (A7)+,D0-D7/A2
            RTS
            
            
















*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
