; =============================================================================
; GRAPHICS DATA IN THE FORMAT ACCEPTED BY GFX.X68
; PICTURES WERE CREATED IN OPEN OFFICE DRAW USING ONLY BASIC SHAPES AND THE
; COORDINATES WERE MANUALLY EXTRACTED.
; NOT THAT THE COMPLEX AND THE SIMPLIFIED VERSIONS OF TILES AND SPRITES ARE
; HERE AND CONDITIONALLY ASSEMBLED DEPENDING ON THE ASSEMBLER FLAGS IN
; CONST.X68
; =============================================================================

; --- LIST OF POINTERS TO PICTURES --------------------------------------------

; COLORED BLOCKS NAME GUIDE

; 0  - STANDARD BLOCK (DARK)
; 1  - CORNER IN UP LEFT 
; 2  - CORNER IN UP RIGHT 
; 3  - CORNER IN DOWN LEFT
; 4  - CORNER IN DOWN RIGHT
; 5  - STANDARD BLOCK (LIGHT)
; 6  - CORNER OUT UP LEFT 
; 7  - CORNER OUT UP RIGHT 
; 8  - CORNER OUT DOWN LEFT 
; 9  - CORNER OUT DOWN RIGHT 
; 10 - PLATFORM UP
; 11 - PLATFORM LEFT
; 12 - PLATFORM RIGHT
; 13 - PLATFORM DOWN

GFXLST      DC.L    .SPIKEU                 ; 0
            DC.L    .SPIKED                 ; 1
            DC.L    .FRABLKR0               ; 2
            DC.L    .FRABLKR1               ; 3
            DC.L    .FRABLKR2               ; 4
            DC.L    .FRABLKR3               ; 5
            DC.L    .CHECKU0                ; 6
            DC.L    .CHECKU1                ; 7
            DC.L    .AIR                    ; 8
            DC.L    .SPIKER                 ; 9
            DC.L    .SPIKEL                 ; 10
            DC.L    .FRABLKY0               ; 11
            DC.L    .FRABLKY1               ; 12
            DC.L    .FRABLKY2               ; 13
            DC.L    .FRABLKY3               ; 14
            DC.L    .CHECKU2                ; 15
            DC.L    .CHECKU3                ; 16
            DC.L    .AIR                    ; 17
            DC.L    .CHECKD0                ; 18
            DC.L    .CHECKD1                ; 19
            DC.L    .TRDMLL0                ; 20
            DC.L    .TRDMLL1                ; 21
            DC.L    .TRDMLL2                ; 22
            DC.L    .TRDMLL3                ; 23
            DC.L    .RED1                   ; 24
            DC.L    .RED2                   ; 25
            DC.L    .RED0                   ; 26
            DC.L    .CHECKD2                ; 27
            DC.L    .CHECKD3                ; 28
            DC.L    .TRDMLR0                ; 29
            DC.L    .TRDMLR1                ; 30
            DC.L    .TRDMLR2                ; 31
            DC.L    .TRDMLR3                ; 32
            DC.L    .RED3                   ; 33
            DC.L    .RED4                   ; 34
            DC.L    .BLU0                   ; 35
            DC.L    .BLU1                   ; 36
            DC.L    .BLU2                   ; 37
            DC.L    .PUR1                   ; 38
            DC.L    .PUR2                   ; 39
            DC.L    .PUR0                   ; 40
            DC.L    .GRN1                   ; 41
            DC.L    .GRN2                   ; 42
            DC.L    .CYN1                   ; 43
            DC.L    .CYN2                   ; 44
            DC.L    .BLU3                   ; 45
            DC.L    .BLU4                   ; 46
            DC.L    .PUR3                   ; 47
            DC.L    .PUR4                   ; 48
            DC.L    .CYN0                   ; 49
            DC.L    .GRN3                   ; 50
            DC.L    .GRN4                   ; 51
            DC.L    .CYN3                   ; 52
            DC.L    .CYN4                   ; 53
            DC.L    .BLU6                   ; 54
            DC.L    .BLU10                  ; 55
            DC.L    .BLU7                   ; 56
            DC.L    .PUR6                   ; 57
            DC.L    .PUR10                  ; 58
            DC.L    .PUR7                   ; 59
            DC.L    .RED6                   ; 60
            DC.L    .RED10                  ; 61
            DC.L    .RED7                   ; 62
            DC.L    .BLU11                  ; 63
            DC.L    .BLU5                   ; 64
            DC.L    .BLU12                  ; 65
            DC.L    .PUR11                  ; 66
            DC.L    .PUR5                   ; 67
            DC.L    .PUR12                  ; 68
            DC.L    .RED11                  ; 69
            DC.L    .RED5                   ; 70
            DC.L    .RED12                  ; 71
            DC.L    .BLU8                   ; 72
            DC.L    .BLU13                  ; 73
            DC.L    .BLU9                   ; 74
            DC.L    .PUR8                   ; 75
            DC.L    .PUR13                  ; 76
            DC.L    .PUR9                   ; 77
            DC.L    .RED8                   ; 78
            DC.L    .RED13                  ; 79
            DC.L    .RED9                   ; 80
            DC.L    .YEL6                   ; 81
            DC.L    .YEL10                  ; 82
            DC.L    .YEL7                   ; 83
            DC.L    .GRN6                   ; 84
            DC.L    .GRN10                  ; 85
            DC.L    .GRN7                   ; 86
            DC.L    .CYN6                   ; 87
            DC.L    .CYN10                  ; 88
            DC.L    .CYN7                   ; 89
            DC.L    .YEL11                  ; 90
            DC.L    .YEL5                   ; 91
            DC.L    .YEL12                  ; 92
            DC.L    .GRN11                  ; 93
            DC.L    .GRN5                   ; 94
            DC.L    .GRN12                  ; 95
            DC.L    .CYN11                  ; 96
            DC.L    .CYN5                   ; 97
            DC.L    .CYN12                  ; 98
            DC.L    .YEL8                   ; 99
            DC.L    .YEL13                  ; 100
            DC.L    .YEL9                   ; 101
            DC.L    .GRN8                   ; 102
            DC.L    .GRN13                  ; 103
            DC.L    .GRN9                   ; 104
            DC.L    .CYN8                   ; 105
            DC.L    .CYN13                  ; 106
            DC.L    .CYN9                   ; 107
            DC.L    .YEL1                   ; 108
            DC.L    .YEL2                   ; 109
            DC.L    .YEL3                   ; 110
            DC.L    .YEL4                   ; 111
            DC.L    .YEL0                   ; 112
            DC.L    .GRN0                   ; 113
            DC.L    .PYRR0                  ; 114
            DC.L    .LOGO                   ; 115
            
; --- LOGO --------------------------------------------------------------------

; 276x140

.LOGO       DC.W    4
            ;DC.B    0,85,0,43               ; DARK PURPLE
            ;DC.W    8,0,0,639,479
            DC.B    0,128,1,63              ; PURPLE
            DC.W    8,0,0,275,41            ; L "ROOF"
            DC.W    8,0,0,43,139            ; L FIRST "PILAR"
            DC.W    8,90,0,133,139          ; L SECOND "PILAR"
            DC.W    8,180,0,223,139         ; L THIRD "PILAR"
            DC.W    4
            DC.B    0,4,241,255             ; YELLOW
            DC.W    8,6,6,89,35             ; LOGO SIZE
            DC.W    8,6,36,37,133
            DC.W    8,96,6,179,35
            DC.W    8,96,36,127,133
            DC.W    8,186,6,269,35
            DC.W    8,186,36,217,133
            DC.W    0


; --- TILES -------------------------------------------------------------------

.SPIKEU     DC.W    4
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,46,12,216
            DC.W    8,0,11,13,15
            DC.W    8,2,8,11,11
            DC.W    8,4,4,9,7
            DC.W    8,6,0,7,3
            DC.W    0
            
.SPIKED     DC.W    4                       ; NEW
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,46,12,216
            DC.W    8,0,0,13,3
            DC.W    8,2,4,11,7
            DC.W    8,4,8,9,11
            DC.W    8,6,12,7,15
            DC.W    0
            
.FRABLKR0   DC.W    4
            DC.B    0,138,130,238
            DC.W    8,0,0,15,15  
            DC.W    0
 
.FRABLKR1   DC.W    4
            DC.B    0,138,130,238
            DC.W    8,0,0,15,15  
            DC.W    4
            DC.B    0,21,21,21
            DC.W    8,4,0,11,15
            DC.W    8,2,2,13,13
            DC.W    8,0,4,15,11
            DC.W    4
            DC.B    0,138,130,238
            DC.W    8,6,0,9,15
            DC.W    8,4,2,11,13
            DC.W    8,2,4,13,11
            DC.W    8,0,6,15,9
            DC.W    0
            
.FRABLKR2   DC.W    4
            DC.B    0,138,130,238
            DC.W    8,0,0,15,15
            DC.W    4                       
            DC.B    0,21,21,21
            DC.W    8,4,0,11,15
            DC.W    8,2,2,13,13
            DC.W    8,0,4,15,11
            DC.W    4
            DC.B    0,138,130,238
            DC.W    8,6,0,9,1
            DC.W    8,0,6,1,9
            DC.W    8,6,4,9,11
            DC.W    8,4,6,11,9
            DC.W    8,14,6,15,9
            DC.W    8,6,14,9,15
            DC.W    0
            
.FRABLKR3   DC.W    4
            DC.B    0,138,130,238
            DC.W    8,0,0,15,15
            DC.W    4                       
            DC.B    0,21,21,21
            DC.W    8,4,0,11,15
            DC.W    8,0,4,15,11
            DC.W    8,2,2,13,13
            DC.W    4
            DC.B    0,138,130,238
            DC.W    8,6,0,9,1
            DC.W    8,0,6,1,9
            DC.W    8,6,6,9,9
            DC.W    8,14,6,15,9
            DC.W    8,6,14,9,15                       
            DC.W    0
            
.CHECKU0    DC.W    4                       ; NEW
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,217,164,1
            DC.W    8,10,0,15,1
            DC.W    8,8,2,11,3
            DC.W    8,6,4,9,5
            DC.W    8,6,6,7,15
            DC.W    8,12,6,15,9
            DC.W    8,10,8,13,15
            DC.W    0
            
.CHECKU1    DC.W    4                       
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,217,164,1
            DC.W    8,0,0,5,1
            DC.W    8,4,2,7,3
            DC.W    8,6,4,9,5
            DC.W    8,0,6,3,7
            DC.W    8,8,6,9,15
            DC.W    8,0,6,3,9
            DC.W    8,2,8,5,11
            DC.W    0

.AIR        DC.W    4
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    0
           
.SPIKER     DC.W    4                       
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,46,12,216
            DC.W    8,0,2,3,15
            DC.W    8,4,4,7,13
            DC.W    8,8,6,11,11
            DC.W    8,12,8,15,9
            DC.W    0
            
.SPIKEL     DC.W    4                       
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,46,12,216
            DC.W    8,0,8,3,9
            DC.W    8,4,6,7,11
            DC.W    8,8,4,11,13
            DC.W    8,12,2,15,15
            DC.W    0
            
.FRABLKY0   DC.W    4
            DC.B    0,127,247,229
            DC.W    8,0,0,15,15  
            DC.W    0
 
.FRABLKY1   DC.W    4
            DC.B    0,127,247,229
            DC.W    8,0,0,15,15  
            DC.W    4
            DC.B    0,21,21,21
            DC.W    8,4,0,11,15
            DC.W    8,2,2,13,13
            DC.W    8,0,4,15,11
            DC.W    4
            DC.B    0,127,247,229
            DC.W    8,6,0,9,15
            DC.W    8,4,2,11,13
            DC.W    8,2,4,13,11
            DC.W    8,0,6,15,9
            DC.W    0
            
.FRABLKY2   DC.W    4
            DC.B    0,127,247,229
            DC.W    8,0,0,15,15
            DC.W    4                       
            DC.B    0,21,21,21
            DC.W    8,4,0,11,15
            DC.W    8,2,2,13,13
            DC.W    8,0,4,15,11
            DC.W    4
            DC.B    0,127,247,229
            DC.W    8,6,0,9,1
            DC.W    8,0,6,1,9
            DC.W    8,6,4,9,11
            DC.W    8,4,6,11,9
            DC.W    8,14,6,15,9
            DC.W    8,6,14,9,15
            DC.W    0
            
.FRABLKY3   DC.W    4
            DC.B    0,127,247,229
            DC.W    8,0,0,15,15
            DC.W    4                       
            DC.B    0,21,21,21
            DC.W    8,4,0,11,15
            DC.W    8,0,4,15,11
            DC.W    8,2,2,13,13
            DC.W    4
            DC.B    0,127,247,229
            DC.W    8,6,0,9,1
            DC.W    8,0,6,1,9
            DC.W    8,6,6,9,9
            DC.W    8,14,6,15,9
            DC.W    8,6,14,9,15                       
            DC.W    0
            
.CHECKU2    DC.W    4                       ; NEW
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,217,164,1
            DC.W    8,6,0,7,7
            DC.W    8,10,0,13,3
            DC.W    8,12,2,15,5
            DC.W    8,8,6,9,9
            DC.W    8,10,8,11,11
            DC.W    8,12,10,15,11
            DC.W    8,4,12,7,13
            DC.W    8,2,14,15,15
            DC.W    0
            
.CHECKU3    DC.W    4                       ; NEW
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,217,164,1
            DC.W    8,2,0,5,3
            DC.W    8,0,2,3,5
            DC.W    8,8,0,9,7
            DC.W    8,6,6,7,9
            DC.W    8,4,8,5,11
            DC.W    8,0,10,3,11
            DC.W    8,8,12,11,13
            DC.W    8,0,14,13,15
            DC.W    0
            
.CHECKD0    DC.W    4                       ; NEW
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,217,164,1
            DC.W    8,2,0,15,1
            DC.W    8,4,2,7,3
            DC.W    8,10,4,15,5
            DC.W    8,8,6,11,7
            DC.W    8,6,8,9,9
            DC.W    8,6,10,7,15
            DC.W    8,12,10,15,13
            DC.W    8,10,12,13,15
            DC.W    0
           
.CHECKD1    DC.W    4                       ; NEW
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,217,164,1
            DC.W    8,0,0,13,1
            DC.W    8,8,2,11,3
            DC.W    8,0,4,5,5
            DC.W    8,4,6,7,7
            DC.W    8,6,8,9,9
            DC.W    8,0,10,3,13
            DC.W    8,2,12,5,15
            DC.W    8,8,10,9,15
            DC.W    0
            
.TRDMLL0    DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,1,1
            DC.W    8,0,14,1,15
            DC.W    8,12,0,15,3
            DC.W    8,10,2,13,5
            DC.W    8,8,4,11,11
            DC.W    8,10,10,13,13
            DC.W    8,12,12,15,15
            DC.W    8,6,6,7,9
            DC.W    0
                            
.TRDMLL1    DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,8,0,13,1
            DC.W    8,6,2,11,3
            DC.W    8,4,4,9,5
            DC.W    8,2,6,7,9
            DC.W    8,4,10,9,11
            DC.W    8,6,12,11,13
            DC.W    8,8,14,13,15
            DC.W    0
           
.TRDMLL2    DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,4,0,9,1
            DC.W    8,2,2,7,3
            DC.W    8,0,4,3,9              
            DC.W    8,0,10,5,11
            DC.W    8,2,12,7,13
            DC.W    8,4,14,9,15
            DC.W    8,14,6,16,10
            DC.W    0  
     
.TRDMLL3    DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191
            DC.W    8,6,0,15,1    
            DC.W    8,4,2,13,3
            DC.W    8,2,4,11,5
            DC.W    8,0,6,9,9
            DC.W    8,2,10,11,11
            DC.W    8,4,12,13,13
            DC.W    8,6,14,15,15
            DC.W    0
    
.RED1       DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,12,12,15,15
            DC.W    0
        
.RED2       DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,12,3,15
            DC.W    0
          
.RED0       DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    0   
      
.CHECKD2    DC.W    4                       
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,217,164,1
            DC.W    8,6,0,7,11
            DC.W    8,10,0,13,7
            DC.W    8,12,6,15,9
            DC.W    8,8,10,9,13
            DC.W    8,10,12,11,15
            DC.W    8,12,14,15,15
            DC.W    0
            
.CHECKD3    DC.W    4                       
            DC.B    0,21,21,21
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,217,164,1
            DC.W    8,8,0,9,11
            DC.W    8,2,4,5,7
            DC.W    8,0,6,3,9
            DC.W    8,6,10,9,11
            DC.W    8,4,12,7,13
            DC.W    8,0,14,5,15
            DC.W    0
             
.TRDMLR0    DC.W    4                       
            DC.B    0,151,126,242           
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191            
            DC.W    8,0,0,9,1
            DC.W    8,2,2,11,3
            DC.W    8,4,4,13,5
            DC.W    8,6,6,15,9
            DC.W    8,4,10,13,11
            DC.W    8,2,12,11,13
            DC.W    8,0,14,9,15
            DC.W    0
            
.TRDMLR1    DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,6,0,11,1
            DC.W    8,8,2,13,3
            DC.W    8,10,4,15,5
            DC.W    8,12,6,15,9
            DC.W    8,0,6,1,9
            DC.W    8,10,10,15,11
            DC.W    8,8,12,13,13
            DC.W    8,6,14,11,15
            DC.W    0
            
.TRDMLR2    DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,2,0,7,1
            DC.W    8,4,2,9,3
            DC.W    8,6,4,11,5
            DC.W    8,8,6,13,9
            DC.W    8,6,10,11,11
            DC.W    8,4,12,9,13
            DC.W    8,2,14,7,15
            DC.W    0
            
.TRDMLR3    DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,14,0,15,1
            DC.W    8,14,14,15,15
            DC.W    8,0,0,3,3
            DC.W    8,2,2,5,5
            DC.W    8,4,4,7,11
            DC.W    8,8,6,9,9
            DC.W    8,2,10,5,13
            DC.W    8,0,12,3,15
            DC.W    0
        
.RED3       DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,12,0,15,3
            DC.W    0
            
.RED4       DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,3,3
            DC.W    0
            
.BLU0       DC.W    4
            DC.B    0,171,95,87
            DC.W    8,0,0,15,15
            DC.W    0
            
.BLU1       DC.W    4
            DC.B    0,171,95,87
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,235,141,131
            DC.W    8,12,12,15,15
            DC.W    0   
         
.BLU2       DC.W    4
            DC.B    0,171,95,87
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,12,3,15
            DC.W    0 

.PUR1       DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,227,140,227
            DC.W    8,12,12,15,15
            DC.W    0 
           
.PUR2       DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,12,3,15
            DC.W    0  
          
.PUR0       DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,0,15,15   
            DC.W    0    
     
.GRN1       DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,145,234,131
            DC.W    8,12,12,15,15
            DC.W    0 
           
.GRN2       DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,12,3,15
            DC.W    0  
           
.CYN1       DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,247,205,125
            DC.W    8,12,12,15,15
            DC.W    0 
        
.CYN2       DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,247,205,125
            DC.W    8,0,12,3,15
            DC.W    0 
       
.BLU3       DC.W    4
            DC.B    0,171,95,87
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,235,141,131
            DC.W    8,12,0,15,3
            DC.W    0
            
.BLU4       DC.W    4
            DC.B    0,171,95,87
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,0,3,3
            DC.W    0 
                             
.PUR3       DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,227,140,227
            DC.W    8,12,0,15,3
            DC.W    0
          
.PUR4       DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,0,3,3
            DC.W    0
                      
.CYN0       DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,0,15,15
            DC.W    0
             
.GRN3       DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,145,234,131
            DC.W    8,12,0,15,3
            DC.W    0
        
.GRN4       DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,0,3,3
            DC.W    0
           
.CYN3       DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,247,205,125
            DC.W    8,12,0,15,3
            DC.W    0
            
.CYN4       DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,247,205,125
            
            DC.W    8,0,0,3,3
            DC.W    0
            
.BLU6       DC.W    4
            DC.B    0,235,141,131           ; CLARO
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,171,95,87             ; OSCURO
            DC.W    8,4,4,15,15
            DC.W    0
                      
.BLU10      DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,171,96,87
            DC.W    8,0,4,15,15
            DC.W    0
             
.BLU7       DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,171,96,87
            DC.W    8,0,4,11,15
            DC.W    0
               
.PUR6       DC.W    4
            DC.B    0,227,140,227           ; CLARO
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,179,101,177             ; OSCURO
            DC.W    8,4,4,15,15
            DC.W    0
          
.PUR10      DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,4,15,15
            DC.W    0
        
.PUR7       DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,4,11,15
            DC.W    0
        
.RED6       DC.W    4
            DC.B    0,151,126,242           ; CLARO
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191             ; OSCURO
            DC.W    8,4,4,15,15
            DC.W    0
          
.RED10      DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,4,15,15
            DC.W    0
        
.RED7       DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,4,11,15
            DC.W    0  
             
.BLU11      DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,171,95,87
            DC.W    8,4,0,15,15
            DC.W    0
            
.BLU5       DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,0,15,15
            DC.W    0
               
.BLU12      DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,171,95,87
            DC.W    8,0,0,11,15
            DC.W    0
             
.PUR11      DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,179,101,177
            DC.W    8,4,0,15,15
            DC.W    0
            
.PUR5       DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,0,15,15
            DC.W    0
               
.PUR12      DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,0,11,15
            DC.W    0
              
.RED11      DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191
            DC.W    8,4,0,15,15
            DC.W    0
            
.RED5       DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,15,15
            DC.W    0
               
.RED12      DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,11,15
            DC.W    0
              
.BLU8       DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,171,95,87
            DC.W    8,4,0,15,11
            DC.W    0 
               
.BLU13      DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,171,95,87
            DC.W    8,0,0,15,11
            DC.W    0
             
.BLU9       DC.W    4
            DC.B    0,235,141,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,171,95,87
            DC.W    8,0,0,11,11
            DC.W    0
               
.PUR8       DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,179,101,177
            DC.W    8,4,0,15,11
            DC.W    0 
               
.PUR13      DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,0,15,11
            DC.W    0
             
.PUR9       DC.W    4
            DC.B    0,227,140,227
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,179,101,177
            DC.W    8,0,0,11,11
            DC.W    0
            
.RED8       DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191
            DC.W    8,4,0,15,11
            DC.W    0 
               
.RED13      DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,15,11
            DC.W    0
             
.RED9       DC.W    4
            DC.B    0,151,126,242
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,111,89,191
            DC.W    8,0,0,11,11
            DC.W    0
               
.YEL6       DC.W    4
            DC.B    0,123,243,219           ; CLARO
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,80,178,161             ; OSCURO
            DC.W    8,4,4,15,15
            DC.W    0
               
.YEL10      DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,4,15,15
            DC.W    0
        
.YEL7       DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,4,11,15
            DC.W    0
         
.GRN6       DC.W    4
            DC.B    0,145,234,131           ; CLARO
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,99,170,87             ; OSCURO
            DC.W    8,4,4,15,15
            DC.W    0
          
.GRN10      DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,4,15,15
            DC.W    0
         
.GRN7       DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,4,11,15
            DC.W    0
         
.CYN6       DC.W    4
            DC.B    0,247,205,125           ; CLARO
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,186,148,88             ; OSCURO
            DC.W    8,4,4,15,15
            DC.W    0
        
.CYN10      DC.W    4
            DC.B    0,247,205,125
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,4,15,15
            DC.W    0
         
.CYN7       DC.W    4
            DC.B    0,247,205,125
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,4,11,15
            DC.W    0
        
.YEL11      DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,80,178,161
            DC.W    8,4,0,15,15
            DC.W    0
        
.YEL5       DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,0,15,15
            DC.W    0
        
.YEL12      DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,0,11,15
            DC.W    0
        
.GRN11      DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,99,170,87
            DC.W    8,4,0,15,15
            DC.W    0
            
.GRN5       DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,0,15,15
            DC.W    0

.GRN12      DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,0,11,15
            DC.W    0
        
.CYN11      DC.W    4
            DC.B    0,247,205,125
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,186,148,88
            DC.W    8,4,0,15,15
            DC.W    0
         
.CYN5       DC.W    4
            DC.B    0,247,205,125
            DC.W    8,0,0,15,15
            DC.W    0
      
.CYN12      DC.W    4
            DC.B    0,247,205,125
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,0,11,15
            DC.W    0
            
.YEL8       DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,80,178,161
            DC.W    8,4,0,15,11
            DC.W    0  
             
.YEL13      DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,0,15,11
            DC.W    0
         
.YEL9       DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,0,11,11
            DC.W    0
        
.GRN8       DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,99,170,87
            DC.W    8,4,0,15,11
            DC.W    0 
         
.GRN13      DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,0,15,11
            DC.W    0
         
.GRN9       DC.W    4
            DC.B    0,145,234,131
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,0,11,11
            DC.W    0
           
.CYN8       DC.W    4
            DC.B    0,247,205,125
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,186,148,88
            DC.W    8,4,0,15,11
            DC.W    0
         
.CYN13      DC.W    4
            DC.B    0,247,205,125
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,0,15,11
            DC.W    0
         
.CYN9       DC.W    4
            DC.B    0,247,205,125
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,186,148,88
            DC.W    8,0,0,11,11
            DC.W    0
         
.YEL1       DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,123,243,219
            DC.W    8,12,12,15,15
            DC.W    0 
        
.YEL2       DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,12,3,15
            DC.W    0 
       
.YEL3       DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,123,243,219
            DC.W    8,12,0,15,3
            DC.W    0
            
.YEL4       DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,0,15,15
            DC.W    4
            DC.B    0,123,243,219
            DC.W    8,0,0,3,3
            DC.W    0
               
.YEL0       DC.W    4
            DC.B    0,80,178,161
            DC.W    8,0,0,15,15        
            DC.W    0
            
.GRN0       DC.W    4
            DC.B    0,99,170,87
            DC.W    8,0,0,15,15        
            DC.W    0

.PYRR0      DC.W    4
            DC.B    0,122,35,127            ; PURPLE
            ; DC.B    0,0,213,255             ; GOLD BUTTONS
            DC.W    8,7,2,10,2
            DC.W    8,6,3,9,3
            DC.W    8,5,4,9,4
            DC.W    8,5,5,12,5
            DC.W    8,7,10,7,10
            DC.W    8,6,11,9,11
            DC.W    8,5,12,9,12
            DC.W    8,4,13,8,14
            DC.W    8,7,15,9,16
            DC.W    4
            DC.B    0,125,191,249           ; SKIN
            DC.W    8,3,6,7,6
            DC.W    8,4,7,10,7
            DC.W    8,5,8,8,8
            DC.W    8,6,9,8,9
            DC.W    8,8,10,11,10
            DC.W    3,11,11
            DC.W    4
            DC.B    0,41,73,136             ; HAIR
            DC.W    8,5,6,6,6
            DC.W    8,6,6,6,8
            DC.W    8,4,9,5,9
            DC.W    4
            DC.B    0,31,31,31              ; BLACK (EYES AND MUSTACHE)
            DC.W    3,10,6
            DC.W    3,10,8
            DC.W    3,8,7
            DC.W    8,9,8,10,8
            DC.W    4
            DC.B    0,244,193,73            ; LIGHT BLUE (EYE RING)
            DC.W    3,8,6
            DC.W    4
            DC.B    0,113,136,156           ; SKIN SHADE
            DC.W    3,8,8
            DC.W    4
            DC.B    0,255,255,255           ; WHITE
            DC.W    8,10,3,10,4
            DC.W    3,9,6
            DC.W    8,9,9,11,9
            DC.W    3,3,14
            DC.W    8,10,14,11,16
            DC.W    8,12,15,12,16
            DC.W    4
            DC.B    0,177,177,184           ; GREY TOOTH
            DC.W    3,10,9
            DC.W    4
            DC.B    0,163,87,251            ; NOSE
            DC.W    8,11,6,11,8
            DC.W    8,12,7,12,8
            DC.W    3,13,8
            DC.W    4
            DC.B    0,61,109,212            ; SHOES
            DC.W    8,1,17,1,19
            DC.W    8,2,15,3,17
            DC.W    8,6,19,7,20
            DC.W    8,8,20,9,20
            DC.W    4
            DC.B    0,126,56,63             ; DARK PURPLE/BLUE
            DC.W    8,7,11,7,12
            DC.W    8,8,12,8,13
            DC.W    8,3,16,3,18
            DC.W    8,4,15,4,17
            DC.W    8,5,13,5,16
            DC.W    8,6,15,6,18
            DC.W    8,7,16,8,18
            DC.W    3,9,18
            DC.W    0
            



            
            
            
  
            













*~Font name~Courier New~
*~Font size~10~
*~Tab type~0~
*~Tab size~4~
