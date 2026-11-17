*------------------------------------------------------------------------------
* COLOR PALLET MANAGEMENT
*------------------------------------------------------------------------------

COLPL       DC.L    .AIR                    ; 0
            
; WALUIGI
            DC.L    .BLUE                   ; 1
            DC.L    .PURPLE                 ; 2
            DC.L    .WSKIN                  ; 3
            DC.L    .WHITE                  ; 4
            DC.L    .HAIR                   ; 5
            DC.L    .SHOES                  ; 6
            DC.L    .GOLD                   ; 7
            DC.L    .NOSE                   ; 8
            DC.L    .BLACK                  ; 9
            DC.L    .SKNSHAD                ; 10
            DC.L    .GREY                   ; 11
            DC.L    .EYERING                ; 12

; INKLINGS

; BLUE (INDEX + (6*0))
            DC.L    .INBLDKR                ; 13 (DARKER)
            DC.L    .INBLDK                 ; 14 (DARK)
            DC.L    .INBLUE                 ; 15 (STANDARD)
            DC.L    .EYEGREY                ; 16
            DC.L    .INBLLGH                ; 17 (LIGHT)
            DC.L    .WHITE                  ; 18
            
; GREEN (INDEX + (6*1))
            DC.L    .INGNDKR                ; 19 (DARKER)
            DC.L    .INGNDK                 ; 20 (DARK)
            DC.L    .INGREEN                ; 21 (STANDARD)
            DC.L    .EYEGREY                ; 22
            DC.L    .INGNLGH                ; 23 (LIGHT)
            DC.L    .WHITE                  ; 24
            
; ORANGE (INDEX + (6*2))
            DC.L    .INORDKR                ; 25 (DARKER)
            DC.L    .INORDK                 ; 26 (DARK)
            DC.L    .INORANG                ; 27 (STANDARD)
            DC.L    .EYEGREY                ; 28
            DC.L    .INORLGH                ; 29 (LIGHT)
            DC.L    .WHITE                  ; 30
            
; PURPLE (INDEX + (6*3))
            DC.L    .INPRDKR                ; 31 (DARKER)
            DC.L    .INPRDK                 ; 32 (DARK)
            DC.L    .INPURPL                ; 33 (STANDARD)
            DC.L    .EYEGREY                ; 34
            DC.L    .INPRLGH                ; 35 (LIGHT)
            DC.L    .WHITE                  ; 36
            
; YELLOW (INDEX + (6*4))
            DC.L    .INYLDKR                ; 37 (DARKER)
            DC.L    .INYLDK                 ; 38 (DARK)
            DC.L    .INYELLW                ; 39 (STANDARD)
            DC.L    .EYEGREY                ; 40
            DC.L    .INYLLGH                ; 41 (LIGHT)
            DC.L    .WHITE                  ; 42
            
            
.AIR        DC.L    $FF000000

; WALUIGI

.BLUE       DC.L    $007E383F

.PURPLE     DC.L    $007A237F

.WSKIN      DC.L    $007DBFF9

.WHITE      DC.L    $00FFFFFF               ; (ALSO USED ON INKLINGS)

.HAIR       DC.L    $00294A88

.SHOES      DC.L    $003D6DD4

.GOLD       DC.L    $0000D5FF

.NOSE       DC.L    $00A457FB

.BLACK      DC.L    $001F1F1F

.SKNSHAD    DC.L    $0071889C

.GREY       DC.L    $00B1B1B8

.EYERING    DC.L    $00F4C249


; INKLINGS

.EYEGREY    DC.L    $00404144               ; (COMMON IN EVERY INKLING)

; BLUE

.INBLDKR    DC.L    $00C95000

.INBLDK     DC.L    $00C95000

.INBLUE     DC.L    $00FF8001

.INBLLGH    DC.L    $00FFB27E

; GREEN

.INGNDKR    DC.L    $0001970A

.INGNDK     DC.L    $0003C50F

.INGREEN    DC.L    $0029F16B

.INGNLGH    DC.L    $00CDFFBC

; ORANGE

.INORDKR    DC.L    $000050DB

.INORDK     DC.L    $00016DE9

.INORANG    DC.L    $000492FF

.INORLGH    DC.L    $007BC6FF

; PURPLE

.INPRDKR    DC.L    $00990872

.INPRDK     DC.L    $00A449A2

.INPURPL    DC.L    $00CF55CD

.INPRLGH    DC.L    $00ED71E1

; YELLOW

.INYLDKR    DC.L    $0000B3FF

.INYLDK     DC.L    $000ECBFF

.INYELLW    DC.L    $0000F2FF

.INYLLGH    DC.L    $0087FFFF






*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
