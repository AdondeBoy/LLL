*------------------------------------------------------------------------------
* PLAYER MANAGEMENT
*------------------------------------------------------------------------------

; -----------------------------------------------------------------------------
PYRINIT
; INITIALIZE PLAYER
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVE.W  #PYRXINI,(PYRPOSX)      ; APLICAMOS POSICIÓN X INICIAL
            MOVE.W  #PYRYINI,(PYRPOSY)      ; APLICAMOS POSICIÓN Y INICIAL
            CLR.B   (PYRXSPD)               ; RESET X SPEED 
            CLR.B   (PYRGRV)                ; RESET A LA GRAVEDAD
            CLR.B   (PYRFACE)               ; MIRANDO A LA DERECHA
            CLR.B   (PYRFALL)
            CLR.B   (PYRCNT)                ; RESET COUNTER
            MOVE.B  #3,(PYRSPR)             ; MIRANDO A LA DERECHA CON GRAVEDAD
            MOVE.B  #PYRSPDX,(PYRXSPD)
            MOVE.W  #PYRXINI,(CHKPX)
            MOVE.W  #PYRYINI,(CHKPY)
            CLR.B   (CHKPGRV)
            RTS

; -----------------------------------------------------------------------------
PYRUPD
; UPDATE THE PLAYER
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            JSR     PYRMOVE
            TST.B   (PYRLIFE)
            BEQ     .ALIVE   
            RTS  

.ALIVE      MOVE.W  (PYRPOSY),D3
            MOVE.W  (PYRPOSX),D4
            TST.B   (PYRGRV)
            BEQ     .GRAV

.NOGRAV     JSR     PYROBSV                 ; CHECK VERTICAL OBSTACLE
            TST.B   D7
            BEQ     .ANTGRV                 ; IF AIR KEEP "FALLING"
            CMP.B   #1,D7
            BEQ     .DAMAGED
            AND.W   #~(MAPTILEH-1),D3       ; ALIGN IF SOLID
            MOVE.W  D3,(PYRPOSY)
            CLR.B   (PYRFALL)
            RTS
       
.ANTGRV     MOVE.B  #$FF,(PYRFALL)
            SUB.W   #PYRYSPD,D3
            MOVE.W  D3,(PYRPOSY)            
            RTS
            
.GRAV       JSR     PYROBSV                 ; CHECK VERTICAL OBSTACLE
            TST.B   D7
            BEQ     .FALLGRV                ; IF AIR KEEP FALLING
            
            
            ADD.W   #PYRHEIGH+PYRYSPD,D3
            AND.W   #~(MAPTILEH-1),D3       ; ALIGN IF SOLID
            SUB.W   #PYRHEIGH,D3
            MOVE.W  D3,(PYRPOSY)
            CLR.B   (PYRFALL)
            CMP.B   #1,D7                   ; CHECK IF DAMAGED
            BEQ     .DAMAGED
            RTS                   
            
.FALLGRV     MOVE.B  #$FF,(PYRFALL)
            ADD.W   #PYRYSPD,D3
            MOVE.W  D3,(PYRPOSY)
            RTS
            
.DAMAGED    MOVE.W  (CHKMPPX),(MAPPOSX)    ; RESTORE MAP X POSITION
            MOVE.W  (CHKMPPY),(MAPPOSY)    ; RESTORE MAP Y POSITION
            MOVE.W  (CHKPX),(PYRPOSX)      ; RESTORE PYR X POSITION
            MOVE.W  (CHKPY),(PYRPOSY)      ; RESTORE PYR Y POSITION
            MOVE.L  (CHKPSC),(MAPSCRPT)
            MOVE.B  (CHKPGRV),(PYRGRV)     ; RESTORE THE GRAVITY
            OR.B    #$FF,(PYRLIFE)         ; PLAYER IS DEAD
            RTS

            
            
            
; -----------------------------------------------------------------------------
PYRPLOT
; PLOT THE PLAYER
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            MOVEM.L D0-D5/A1-A2,-(A7)
            LEA     SPRLST, A1              ; GET SPRITE DATA
            LEA     COLPL,A2                ; GET PALLET DATA
            CLR.W   D2
            ADD.B   (PYRSPR),D2
            ADD.B   (PYRFACE),D2
            ADD.B   (PYRGRV),D2
            ROL.W   #2,D2
            MOVE.L  (A1,D2.W),A1            ; GET SPRITE ADDRESS
            MOVE.W  #PYRHEIGH,D1
            SUBQ.B  #1,D1                   ; COLUMN ITERATOR
            MOVE.W  (PYRPOSY),D3            ; INITIAL Y
.YLOOP      MOVE.W  (PYRPOSX),D4            ; INITIAL X (REINIT AFTER EACH ROW)
            MOVE.W  #PYRWIDTH,D0
            SUBQ.B  #1,D0                   ; ROW ITERATOR
.XLOOP      MOVE.B  (A1)+,D2
.PLOT       JSR     GFXDRWCL
            ADDQ.W  #1,D4
            DBRA.W  D0,.XLOOP
            ADDQ.W  #1,D3
            DBRA.W  D1,.YLOOP
            
            MOVEM.L (A7)+,D0-D4/A0-A2
            RTS
            
; -----------------------------------------------------------------------------
PYRMOVE
; UPDATE THE PLAYER
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; -----------------------------------------------------------------------------
            CLR.L   D0
            MOVE.B  (KBDVAL),D0
            AND.B   #$F,D0
            TST.B   D0
            BNE     .CHKRF
            
            MOVE.B  #PYRSTTIC,(PYRSPR)
            BRA     .CHKSPC
            
.CHKRF      BTST.B  #KBDBITRT1,(KBDVAL)     ; CHECK IF PRESS MOVEMENT BUTTON
            BNE     .ISRIGHT
            BTST.B  #KBDBITRT2,(KBDVAL)
            BNE     .ISRIGHT
.CHKLF      BTST.B  #KBDBITLF1,(KBDVAL)
            BNE     .ISLEFT
            BTST.B  #KBDBITLF2,(KBDVAL)
            BNE     .ISLEFT
.CHKSPC     BTST.B  #KBDBITUP1,(KBDVAL)
            BNE     .ISSPACE
            BTST.B  #KBDBITUP2,(KBDVAL)
            BNE     .ISSPACE
            BTST.B  #KBDBITSPC,(KBDVAL)
            BNE     .ISSPACE
.END        
            RTS     
       
.ISRIGHT    MOVE.W  #2,(PYRSPR)             ; STORE RIGHT FRAME
            CLR.B   (PYRFACE)
            MOVE.W  (PYRPOSX),D2            ; GET POS X
            ADD.W   #PYRSPDX,D2             ; SET NEW POSITION X
            MOVE.W  D2,D4                   
            ADD.W   #PYRWIDTH,D4            ; SET POS X TO RIGHT SIDE
            
            JSR     PYROBSH
            TST.B   D7
            BEQ     .STR
            
            CMP.B   #1,D7
            BEQ     .DAMAGED
            AND.W   #~(MAPTILEW-1),D4
            SUB.W   #PYRWIDTH,D4
            MOVE.W  D4,D2
            
.STR        MOVE.W  D2,(PYRPOSX)
            BRA     .CHKLF

.ISLEFT     
            MOVE.W  #2,(PYRSPR)             ; STORE LEFT FRAME
            MOVE.B  #4,(PYRFACE)
            MOVE.W  (PYRPOSX),D2            ; GET POS X
            MOVE.W  (PYRPOSY),D3            ; GET POS Y
            SUB.W   #PYRSPDX,D2             ; SET NEW POSITION X
            MOVE.W  D2,D4                   

            JSR     PYROBSH                 ; CHECK OBSTACLES 
            TST.B   D7
            BEQ     .STL                    ; BRANCH IF NO OBSTACLES
            
            CMP.B   #1,D7
            BEQ     .DAMAGED                ; IS DAMAGED TILE?
            AND.W   #~(MAPTILEW-1),D4
            ADD.W   #MAPTILEW,D4
            MOVE.W  D4,D2

.STL        MOVE.W  D2,(PYRPOSX)
            BRA     .CHKSPC

.ISSPACE    TST.B   (PYRFALL)
            BNE     .END                    ; NOT ALLOWED IF IS ALREADY FALLING
            
            MOVE.B  #$FF,(PYRFALL)
            TST.B   (PYRGRV)
            BNE     .GRVNOW
            
            MOVE.B  #8,(PYRGRV)            ; CHANGE THE GRAVITY
            BRA     .END
            
.GRVNOW     CLR.B   (PYRGRV)
            BRA     .END
            
.DAMAGED    MOVE.W  (CHKMPPX),(MAPPOSX)    ; RESTORE MAP X POSITION
            MOVE.W  (CHKMPPY),(MAPPOSY)    ; RESTORE MAP Y POSITION
            MOVE.W  (CHKPX),(PYRPOSX)      ; RESTORE PYR X POSITION
            MOVE.W  (CHKPY),(PYRPOSY)      ; RESTORE PYR Y POSITION
            MOVE.B  (CHKPGRV),(PYRGRV)     ; RESTORE THE GRAVITY
            OR.B    #$FF,(PYRLIFE)         ; PLAYER IS DEAD
            BRA     .END
                          
           
; -----------------------------------------------------------------------------
PYROBSH
; CHECK HORIZONTAL OBSTACLES
; INPUT     : D4.W  X COORDINATE
;             D3.W  Y COORDINATE
; OUTPUT    : D7.B  COLLISION OUTPUT
; MODIFIES  :
; -----------------------------------------------------------------------------   
            MOVEM.L D2-D6/A0,-(A7)
            
            CLR.W   D6
            CLR.L   D2
            MOVE.W  #2,D6                   ; PREPARE LOOP
            CLR.L   D5
            MOVE.W  (PYRPOSY),D3            ; GET POS Y
            BTST    #15,D4                  ; CHECK IF NEGATIVE X
            BNE     .END
            
.TYPLOOP           
            ROL.L   #8,D5                   ; MAKE ROOM FOR NEXT TILE TYPE
            JSR     MAPGTYPE                ; D5 = TYPE            
            ADD.W   #MAPTILEH,D3
            DBRA    D6,.TYPLOOP
            
            CLR.B   D7
            MOVE.W  #2,D6
.COLLOOP    MOVE.B  D5,D2                   ; USE D2 AS INDEX
            ROR.L   #8,D5                   ; SET NEXT TILE TYPE
            MULU    #4,D2
            MOVE.L  D2,A0
            MOVE.L  .TYPINST(A0),A0
            JMP     (A0)
       
 
.SOLID      MOVE.B  #2,D7
            MOVEM.L (A7)+,D2-D6/A0
            RTS
            
.DAMAGE     MOVE.B  #1,D7
            BRA     .AIR

.CHCKP      AND.W   #~(MAPTILEW),D4
            
            MOVE.W  D4, (CHKPX)
            MOVE.W  (PYRPOSY),(CHKPY)
            MOVE.W  (MAPPOSX),(CHKMPPX)    ; SAVE MAP X POSITION
            MOVE.W  (MAPPOSY),(CHKMPPY)    ; SAVE MAP Y POSITION
            MOVE.L  (MAPSCRPT),(CHKPSC)
            MOVE.B  (PYRGRV),(CHKPGRV)
            BRA     .AIR
            
.INKLING    JSR     INKSAVED

.AIR        DBRA.W  D6,.COLLOOP
.END        MOVEM.L (A7)+,D2-D6/A0
            RTS


.TYPINST    DC.L    .AIR,.SOLID,.DAMAGE,.CHCKP
            DC.L    .SOLID,.SOLID,.INKLING  ; TREADMILLS ACT AS SOLID
            
            
; -----------------------------------------------------------------------------
PYROBSV
; CHECK VERTICAL OBSTACLES
; INPUT     : D4.W  X COORDINATE
;             D3.W  Y COORDINATE
; OUTPUT    : D7.B  COLLISION OUTPUT
; MODIFIES  :
; -----------------------------------------------------------------------------                          
            MOVEM.L D2-D6/A0,-(A7)
            CLR.W   D2                                    
            ADD.W   #PYRHEIGH+PYRYSPD,D3    ; ADD Y TO GET TILE
            TST.B   (PYRGRV)
            BEQ     .GRAV                   ; CHECK GRAVITY (0 = NORMAL)
            SUB.W   #PYRHEIGH+PYRYSPD*2,D3  ; SUB Y (TWICE) + HEIGHT TO GET TILE
            BTST    #15,D3                  ; CHECK IF NEGATIVE Y
            BNE     .END
            
.GRAV       
            CLR.W   D6
            MOVE.W  #2,D6                   ; PREPARE LOOP
            CLR.L   D5
            
.TYPLOOP    LSL.L   #8,D5                   ; MAKE ROOM FOR NEXT TILE TYPE
            JSR     MAPGTYPE                ; D5 = TYPE
            ADD.W   #PYRWIDTH/2-1,D4            
            DBRA.W  D6,.TYPLOOP             
            
            CLR.W   D6
            CLR.B   D7
            MOVE.W  #2,D6
.COLLOOP    MOVE.B  D5,D2                   ; USE D2 AS INDEX
            MULU    #4,D2
            ROR.L   #8,D5                   ; SET NEXT TILE TYPE
            MOVE.W  D2,A0
            MOVE.L  .TYPINST(A0),A0
            JMP     (A0)
                        
            
.TRDMLR     MOVE.W  (PYRPOSX),D4
            MOVE.W  (PYRPOSY),D3
            ADD.W   #PYRWIDTH+5,D4
            JSR     PYROBSH                 ; LOOK IF HORIZONTAL OBS
            TST.B   D7
            BNE     .SOLIDHR    
            SUB.W   #PYRWIDTH,D4            ; RESET PLAYER POINTER                
            MOVE.W  D4,(PYRPOSX)
            BRA     .SOLID

.SOLIDHR    CMP.B   #1,D7
            BEQ     .DAMAGEH
            AND.W   #~(MAPTILEW-1),D4
            SUB.W   #PYRWIDTH,D4
            MOVE.W  D4,(PYRPOSX)  
            BRA     .SOLID               

.TRDMLL     MOVE.W  (PYRPOSX),D4
            MOVE.W  (PYRPOSY),D3
            SUBQ.W  #5,D4
            JSR     PYROBSH                 ; LOOK IF HORIZONTAL OBS
            TST.B   D7
            BNE     .SOLIDHL                            
            MOVE.W  D4,(PYRPOSX)
            BRA     .SOLID
            
.DAMAGEH    MOVE.B  #1,D7                   ; EXECUTE WHEN DAMAGE HORIZONTAL     
            BRA     .END                    ; OBSTACLE WHEN THREADMILL


.SOLIDHL    CMP.B   #1,D7
            BEQ     .DAMAGEH
            AND.W   #~(MAPTILEW-1),D4
            ADD.W   #MAPTILEW,D4
            MOVE.W  D4,(PYRPOSX)
        
.SOLID      MOVE.B  #2,D7
            BRA     .END
            
.DAMAGE     MOVE.B  #1,D7
            BRA     .AIR
            
.CHCKP      TST.B   (PYRGRV)
            BEQ     .CHCKGRV
            
            AND.W   #~(MAPTILEH-1),D3
            SUB.W   #MAPTILEH,D3
            BRA     .SETCHCK
            
.CHCKGRV    
            AND.W   #~(MAPTILEH-1),D3
            SUB.W   #MAPTILEH,D3 
            
.SETCHCK    MOVE.W  (PYRPOSX), (CHKPX)
            MOVE.W  D3, (CHKPY)
            MOVE.W  (MAPPOSX),(CHKMPPX)     ; SAVE MAP X POSITION
            MOVE.W  (MAPPOSY),(CHKMPPY)     ; SAVE MAP Y POSITION
            MOVE.L  (MAPSCRPT),(CHKPSC)
            MOVE.B  (PYRGRV),(CHKPGRV)
            BRA     .END            
     
.INKLING    JSR     INKSAVED

.AIR        DBRA.W  D6,.COLLOOP
.END        MOVEM.L (A7)+,D2-D6/A0
            RTS

.TYPINST    DC.L    .AIR,.SOLID,.DAMAGE,.CHCKP
            DC.L    .TRDMLR,.TRDMLL,.INKLING 

            

            




































*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~0~
*~Tab size~4~
