;*****************************************************************
;* COE538 Lab 2 - Part A.3                                      *
;* Generate a tone using the buzzer                              *
;*****************************************************************

            XDEF Entry, _Startup
            ABSENTRY Entry
            INCLUDE 'derivative.inc'

ROMStart    EQU  $4000

            ORG   ROMStart

Entry:
_Startup:
            LDS   #RAMEnd+1       ; initialize stack pointer

;*****************************************************************
;* LAB 2 PART A.3 CODE                                           *
;*****************************************************************

            BSET  DDRP,%11111111  ; Configure Port P for output
            LDAA  #%10000000      ; Prepare to drive PP7 high

MainLoop:
            STAA  PTP             ; Drive PP7
            LDX   #$1FFF          ; Initialize loop counter

Delay:
            DEX                   ; Decrement loop counter
            BNE   Delay           ; Continue until X reaches 0

            EORA  #%10000000      ; Toggle PP7 high/low
            BRA   MainLoop        ; Repeat forever

;*****************************************************************
;* Interrupt Vectors                                             *
;*****************************************************************

            ORG   $FFFE
            DC.W  Entry           ; Reset Vector