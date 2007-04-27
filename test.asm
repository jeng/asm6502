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
	LDA $03
				