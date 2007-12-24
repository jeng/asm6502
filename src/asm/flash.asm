	
loop:      

	inc $200,x ; increment $d020
	inc $300,x
	inc $400,x
	lda $fe
	sta $500,x
	inx
	jmp loop  ; jump to label loop
