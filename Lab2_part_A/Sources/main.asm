;*****************************************************************
;* COE538 Lab 2 - Part 1 - Exercise 1                           *
;* Read switches SW1 and display their states on LED1            *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup
            ABSENTRY Entry

; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

ROMStart    EQU  $4000

;*****************************************************************
;* Code Section                                                  *
;*****************************************************************

            ORG   ROMStart

Entry:
_Startup:
            LDS   #RAMEnd+1       ; initialize stack pointer

            LDAA  #$FF            ; A = 11111111
            STAA  DDRH            ; configure Port H as output
            STAA  PERT            ; enable Port T pull-up resistors

Loop:
            LDAA  PTT             ; read switches from Port T
            STAA  PTH             ; send switch values to LED bar
            BRA   Loop            ; repeat forever

;*****************************************************************
;* Interrupt Vectors                                             *
;*****************************************************************

            ORG   $FFFE
            DC.W  Entry           ; Reset Vectorecpalin the code 