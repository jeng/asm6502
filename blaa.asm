	;; Trying to break shit

DCB	$ffffffffff,$00
	lda	#$ff
	ldx	sinus,y
sinus:	
	jmp	sinus	  	  	