;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"labo1_B83712.c"
	list	p=12f675
	radix dec
	include "p12f675.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_TRISIO
	extern	_GPIO
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_delay

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_labo1_B83712_0	udata
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_labo1_B83712	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _delay
;   _delay
;4 compiler assigned registers:
;   r0x1008
;   r0x1009
;   r0x100A
;   STK00
;; Starting pCode block
S_labo1_B83712__main	code
_main:
; 2 exit points
;	.line	14; "labo1_B83712.c"	TRISIO = 0b00000000; // Poner todos los pines como salidas
	BANKSEL	_TRISIO
	CLRF	_TRISIO
;	.line	15; "labo1_B83712.c"	GPIO = 0x00;		 // Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
_00123_DS_:
;	.line	25; "labo1_B83712.c"	for (result = 1; result < 7; result++)
	MOVLW	0x01
	MOVWF	r0x1008
	CLRF	r0x1009
;;unsigned compare: left < lit(0x1=1), size=2
_00117_DS_:
;	.line	28; "labo1_B83712.c"	switch (result)
	MOVLW	0x00
	SUBWF	r0x1009,W
	BTFSS	STATUS,2
	GOTO	_00142_DS_
	MOVLW	0x01
	SUBWF	r0x1008,W
_00142_DS_:
	BTFSS	STATUS,0
	GOTO	_00111_DS_
;;genSkipc:3307: created from rifx:0x7fff26adfd50
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x7=7), size=2
	MOVLW	0x00
	SUBWF	r0x1009,W
	BTFSS	STATUS,2
	GOTO	_00143_DS_
	MOVLW	0x07
	SUBWF	r0x1008,W
_00143_DS_:
	BTFSC	STATUS,0
	GOTO	_00111_DS_
;;genSkipc:3307: created from rifx:0x7fff26adfd50
	DECF	r0x1008,W
	MOVWF	r0x100A
	MOVLW	HIGH(_00144_DS_)
	MOVWF	PCLATH
	MOVLW	_00144_DS_
	ADDWF	r0x100A,W
	BTFSC	STATUS,0
	INCF	PCLATH,F
	MOVWF	PCL
_00144_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
	GOTO	_00110_DS_
_00105_DS_:
;	.line	31; "labo1_B83712.c"	GPIO = 0x01;
	MOVLW	0x01
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	32; "labo1_B83712.c"	break;
	GOTO	_00112_DS_
_00106_DS_:
;	.line	34; "labo1_B83712.c"	GPIO = 0x02;
	MOVLW	0x02
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	35; "labo1_B83712.c"	break;
	GOTO	_00112_DS_
_00107_DS_:
;	.line	37; "labo1_B83712.c"	GPIO = 0x05;
	MOVLW	0x05
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	38; "labo1_B83712.c"	break;
	GOTO	_00112_DS_
_00108_DS_:
;	.line	41; "labo1_B83712.c"	GPIO = 0x06; // GPIO = 0x0110
	MOVLW	0x06
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	42; "labo1_B83712.c"	break;
	GOTO	_00112_DS_
_00109_DS_:
;	.line	45; "labo1_B83712.c"	GPIO = 0x07; // 0x0111
	MOVLW	0x07
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	46; "labo1_B83712.c"	break;
	GOTO	_00112_DS_
_00110_DS_:
;	.line	49; "labo1_B83712.c"	GPIO = 0x16;
	MOVLW	0x16
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	50; "labo1_B83712.c"	break;
	GOTO	_00112_DS_
_00111_DS_:
;	.line	52; "labo1_B83712.c"	GPIO = 0x04;
	MOVLW	0x04
	BANKSEL	_GPIO
	MOVWF	_GPIO
_00112_DS_:
;	.line	54; "labo1_B83712.c"	delay(time);
	MOVLW	0x78
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	55; "labo1_B83712.c"	GPIO = 0x00;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	25; "labo1_B83712.c"	for (result = 1; result < 7; result++)
	INCF	r0x1008,F
	BTFSC	STATUS,2
	INCF	r0x1009,F
;;unsigned compare: left < lit(0x7=7), size=2
	MOVLW	0x00
	SUBWF	r0x1009,W
	BTFSS	STATUS,2
	GOTO	_00145_DS_
	MOVLW	0x07
	SUBWF	r0x1008,W
_00145_DS_:
	BTFSS	STATUS,0
	GOTO	_00117_DS_
;;genSkipc:3307: created from rifx:0x7fff26adfd50
	GOTO	_00123_DS_
;	.line	58; "labo1_B83712.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_labo1_B83712__delay	code
_delay:
; 2 exit points
;	.line	60; "labo1_B83712.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	65; "labo1_B83712.c"	for (i = 0; i < tiempo; i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00156_DS_:
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00177_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00177_DS_:
	BTFSC	STATUS,0
	GOTO	_00158_DS_
;;genSkipc:3307: created from rifx:0x7fff26adfd50
;	.line	66; "labo1_B83712.c"	for (j = 0; j < 1275; j++)
	MOVLW	0xfb
	MOVWF	r0x1004
	MOVLW	0x04
	MOVWF	r0x1005
_00154_DS_:
	MOVLW	0xff
	ADDWF	r0x1004,W
	MOVWF	r0x1006
	MOVLW	0xff
	MOVWF	r0x1007
	MOVF	r0x1005,W
	BTFSC	STATUS,0
	INCFSZ	r0x1005,W
	ADDWF	r0x1007,F
	MOVF	r0x1006,W
	MOVWF	r0x1004
	MOVF	r0x1007,W
	MOVWF	r0x1005
	MOVF	r0x1007,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00154_DS_
;	.line	65; "labo1_B83712.c"	for (i = 0; i < tiempo; i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00156_DS_
_00158_DS_:
;	.line	68; "labo1_B83712.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  113+   12 =   125 instructions (  274 byte)

	end
