
_main:

;MyProject.c,6 :: 		void main() {
;MyProject.c,7 :: 		ADCON1=0x0D;                  // Configure RE1 pin as input
	MOVLW       13
	MOVWF       ADCON1+0 
;MyProject.c,8 :: 		CMCON=7;
	MOVLW       7
	MOVWF       CMCON+0 
;MyProject.c,9 :: 		TRISB.F6=0;
	BCF         TRISB+0, 6 
;MyProject.c,10 :: 		ADC_Init();                        // Initialize ADC
	CALL        _ADC_Init+0, 0
;MyProject.c,12 :: 		while(1){
L_main0:
;MyProject.c,13 :: 		source=Adc_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _Word2Double+0, 0
	MOVF        R0, 0 
	MOVWF       _source+0 
	MOVF        R1, 0 
	MOVWF       _source+1 
	MOVF        R2, 0 
	MOVWF       _source+2 
	MOVF        R3, 0 
	MOVWF       _source+3 
;MyProject.c,14 :: 		PORTB.F6=0;
	BCF         PORTB+0, 6 
;MyProject.c,15 :: 		if(source>600){
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       22
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;MyProject.c,16 :: 		delay_ms(500);     // when temperature goes higher than 30 degree , fan turns on .
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;MyProject.c,17 :: 		PORTB.F6=1;
	BSF         PORTB+0, 6 
;MyProject.c,18 :: 		}
L_main2:
;MyProject.c,19 :: 		}
	GOTO        L_main0
;MyProject.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
