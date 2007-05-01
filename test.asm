	LDX #$FF
	PHP
	SEC
	SEI
	CLC
	PLP
	INX
	INX
	LDA #$05
	AND #$04
	ROR 			; Should be two
	SEC
	ROR			; Should be $81
	ROR			; The carry flag should be set
	CLC
	LDA #$80	
	ROL
	ROL
	ROL
	ROL
	ROL
	LDA #$03
	ASL			; Accumulator Should be 6
	LDA #255
	ASL			; Accumulator should be 254
	ASL
	ASL	
	ASL		
	ASL
	ASL	
	ASL	
	ASL
	LDA #05
	EOR #07			;Accumulator should be 2
	ORA #01			;Accumulator should be 3
	CLC
	CMP #01
	CMP #05
	LDA #00
	CMP #$FF
	LDX #05
	CPX #05
	LDY #03
	CPY #03

	;; Test store procedures.
	LDA #1
	LDX #2
	LDY #3
	STA $00	
	STX $01
	STY $02
	LDY $00			; should be 1
	LDX $01			; should be 2
	LDA $02			; should be 3
	LDA #$FF
	STA $00
;loop:				
;	DEC $00
;	LDA $00
;	BMI loop

	LDA #$0
	STA $01
	JSR foo

	LDA #$ff
	
	JMP pow
foo:	LDA #$DD
	RTS
	
yow:
	INC $01
	LDX $01
	BPL yow
	RTS
	
pow:	
		