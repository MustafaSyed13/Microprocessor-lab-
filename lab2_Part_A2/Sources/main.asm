;*****************************************************************
;* COE538 Lab 2 - Part A.2                                      *
;* Keypad Input -> Colour LED2                                  *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup
            ABSENTRY Entry

; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

ROMStart    EQU  $4000

; code section
            ORG   ROMStart

Entry:
_Startup:
            LDS   #RAMEnd+1       ; initialize stack pointer


;*****************************************************************
;* LAB 2 PART A.2 CODE                                           *
;*****************************************************************

            BSET  DDRP,%11111111  ; bit set  to data direction port; Configure Port P for output
            BSET  DDRE,%00010000  ; Configure PE4 for output
            BCLR  PORTE,%00010000 ; Enable keypad

Loop:
            LDAA  PTS             ; Read keypad code into AccA
            LSRA                  ; Shift right AccA
            LSRA
            LSRA
            LSRA
            STAA  PTP             ; Output AccA to LED2
            BRA   Loop            ; Repeat forever


;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************

            ORG   $FFFE
            DC.W  Entry           ; Reset Vector