*------------------------------------------------------------------------------
* MAP MANAGEMENT
*------------------------------------------------------------------------------



; -----------------------------------------------------------------------------
MAPINIT
; INITIALIZE MAP
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVE.W  #MAPSCRIX,(MAPPOSX)     ; SET X AND Y POSITIONS
            MOVE.W  #MAPSCRIY,(MAPPOSY)
            JSR     MAPGTSCA                ; GET INIT MAP ADDRESS
            CLR.B   (PYRLIFE)
            CLR.B   SCRCYCCT
            MOVE.W  #MAPSCRIX,(CHKMPPX)     ; SET SCREEN COORDINATES AS DEFAULT
            MOVE.W  #MAPSCRIY,(CHKMPPY)
            MOVE.L  (MAPSCRPT),(CHKPSC)
            RTS

; -----------------------------------------------------------------------------
MAPUPD
; UPDATE THE MAP
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D0-D1,-(A7)
            CLR.L   D0
            TST.B   (PYRLIFE)               ; CHECK IF PLAYER IS ALIVE
            BEQ     .CONT    

            MOVE.B  #$00,(PYRLIFE)          ; PLAYER NOW IS ALIVE
            BRA     .CHNG

.CONT       CMP.W   #MAPTILEW*MAPSCRW-PYRWIDTH-10,(PYRPOSX) ; CHECK IF PLAYER
            BGE     .CHNGR                                  ; CHANGE THE MAP
            CMP.W   #10,(PYRPOSX)
            BLE     .CHNGL
            CMP.W   #MAPTILEH*MAPSCRH-PYRHEIGH-10,(PYRPOSY)
            BGE     .CHNGD
            CMP.W   #10,(PYRPOSY)
            BGE     .END
            
.CHNGU      SUBQ.W  #1,(MAPPOSY)
            MOVE.W  #MAPTILEH*MAPSCRH-PYRHEIGH-10*2,(PYRPOSY)
            BRA     .CHNG
.CHNGD      ADDQ.W  #1,(MAPPOSY)
            MOVE.W  #10*2,(PYRPOSY)
            BRA     .CHNG
.CHNGR      ADDQ.W  #1,(MAPPOSX)
            MOVE.W  #10*2,(PYRPOSX)
            BRA     .CHNG
.CHNGL      SUBQ.W  #1,(MAPPOSX)
            MOVE.W  #MAPTILEW*MAPSCRW-PYRWIDTH-10*2,(PYRPOSX)

.CHNG       CLR.B   SCRCYCCT
            JSR     MAPMOVE
.END        MOVEM.L (A7)+,D0-D1
            RTS
            
; -----------------------------------------------------------------------------
MAPPLOT
; PLOT THE MAP
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D0-D7/A2,-(A7)
            
            MOVE.L  #-1,D7
            
            MOVEA.L (MAPSCRPT), A2          ; GET SCREEN ADDRESS
            LEA     GFXLST,A0               ; GET GRAPHICS DATA
            MOVE.W  #MAPSCRH-1,D0           ; ROW ITERATOR
            CLR.W   D6                      ; INITIAL Y
.YLOOP      CLR.W   D5                      ; INITIAL X (REINIT AFTER EACH ROW)
            MOVE.W  #MAPSCRW-1,D1           ; COLUMN ITERATOR
.XLOOP      MOVE.W  (A2)+,D3                ; STORE TILE ID IN D3
.PLOT       JSR     GFXDRWID
            CMP.B   #INKTILE,D3             ; CHECK FOR INKLING TILE
            BNE     .CONT                   ; CONTINUE IF NOT FOUND                
            
            JSR     INKMAPIN                ; CHECK IF ALREADY SAVED
            CLR.L   D7
            MOVE.B  (INKINDEX),D7
            BTST.B  D7,(INKSAVLS)
            BNE     .RESETD7                ; JUMP IF ALREADY SAVED
            
            MOVE.W  D5,D2           ; STORE COORDINATES FOR INKLING
            SWAP    D2
            MOVE.W  D6,D2
            MOVE.L  D2,(INKCOORD)
            BRA     .CONT
            
.RESETD7    MOVE.L  #-1,D7
            
.CONT       ADD.W   #MAPTILEW,D5
            DBRA.W  D1,.XLOOP
            ADD.W   #MAPTILEH,D6
            ADD.L   #MAPSCRW*(MAPWIDTH*2-2),A2
            DBRA.W  D0,.YLOOP
            
            ; PLOT INKLING
            CMP     #-1,D7
            BEQ     .END
            JSR     INKPLOT
            
.END        MOVEM.L (A7)+,D0-D7/A2
            RTS
            
            
; -----------------------------------------------------------------------------
MAPMOVE
; CHANGE SCREEN
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            CMP.W   #MAPWIDTH,(MAPPOSX)
            BGE     .WIN                    ; PLAYER FINISH THE GAME
            JSR     MAPGTSCA                ; GET SCREEN ADDRESS

.END        RTS
            
.WIN        MOVE.W  #STAVICT,(STANEXT)      
            BRA     .END

            
; -----------------------------------------------------------------------------
MAPGTSCA
; GETS THE ADDRESS OF THE CURRENT SCREEN
; INPUT     :
; OUTPUT    :
; MODIFIES  : UPDATES MAPSCPTR
; -----------------------------------------------------------------------------
            MOVEM.L A0/D0,-(A7)
            LEA     MAPDATA,A0              ; GET MAPA DATA
            MOVE.W  (MAPPOSY),D0
            MULU    #MAPSCRH*MAPSCRW*MAPWIDTH*2,D0
            ADD.L   D0,A0                   ; ADD Y OFFSET
            CLR.L   D0
            MOVE.W  (MAPPOSX),D0
            MULU    #MAPSCRW*2,D0           ; ADD X OFFSET
            ADD.L   D0,A0
            MOVE.L  A0,(MAPSCRPT)
            MOVEM.L (A7)+,A0/D0
            RTS            

; -----------------------------------------------------------------------------
MAPGTYPE
; GETS THE TYPE OF TILE
; INPUT     : D4.W  X COORDINATE
;             D3.W  Y COORDINATE
; OUTPUT    : D5.W  TILE TYPE
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D7/A0,-(A7)
            
            JSR MAPGTTIL
            
            LEA     TILETYPE,A0
            MOVE.B  (A0,D7.W),D5            ; ADD TILE ID
            MOVEM.L (A7)+,D7/A0
            
            RTS
            
; -----------------------------------------------------------------------------
MAPGTTIL
; GETS THE CODE OF THE TILE
; INPUT     : D4.W  X COORDINATE
;             D3.W  Y COORDINATE

; OUTPUT    : D7.W  TILE ID
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D3-D4/A0,-(A7)          ; STORE REGISTERS
            ASR.W   #4,D3                   ; Y=Y/MAPTILEH
            ASR.W   #3,D4                   ; X=2*(X/MAPTILEW). YA QUE USAMOS
                                            ; BYTES
            AND.L   #$0000FFFE,D4           ; CONSERVAMOS LO NECESARIO
            MULU    #MAPSCRW*MAPWIDTH*2,D3    ; ADAPTAMOS A MAPDATA
            ADD.L   D4,D3                   
            MOVE.L  (MAPSCRPT), A0
            ADD.L   D3,A0
            MOVE.W  (A0),D7                 ; RECOGEMOS EL ID
            MOVEM.L (A7)+,D3-D4/A0
            
            RTS
            
            
            
            
            

































*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
