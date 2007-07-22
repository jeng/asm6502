	;; Random walk
	lda #16
	sta $0			; The current x pos
	sta $1			; The current y pos
	lda #15
	sta $4			; last pixel x
	lda #16
	sta $5			; last pixel y
	lda #14
	sta $6			; older pixel x
	lda #16
	sta $7			; older pixel y
	lda #13
	sta $8			; still older pixel x
	lda #16
	sta $9			; still older pixel y
	lda #12
	sta $A			; oldest pixel x
	lda #16
	sta $B			; oldest pixel y
	
	
	

loop:
	ldx $0
	ldy $1
	lda #$1			;white
	jsr paint
	ldx $4
	ldy $5
	lda #$7			;yellow
	jsr paint
	ldx $6
	ldy $7
	lda #$9			;light red
	jsr paint	
	ldx $8
	ldy $9
	lda #$8			;orange
	jsr paint	
	ldx $a
	ldy $b
	lda #$2			;red	
	jsr paint
	jsr walk
	jmp loop

walk:
	;; save old pixel
	jsr saveold
	lda $fe
	and #3
	cmp #0
	beq right
	cmp #1
	beq left
	cmp #2
	beq up
	jmp down

right:
	inc $0
	jmp done
left:
	dec $0
	jmp done
up:
	dec $1
	jmp done
down:
	inc $1
	jmp done
done:
	lda $0
	and #31
	sta $0
	lda $1
	and #31
	sta $1
	rts

paint:
	pha
	lda yl,y
	sta $2
	lda yh,y
	sta $3
	pla
	sta ($2,x)
	rts

saveold:
	lda $8			;replace oldest with still older
	sta $a
	lda $9
	sta $b
	lda $6			;replace still older with older
	sta $8
	lda $7
	sta $9
	lda $4			;replace older with last
	sta $6
	lda $5
	sta $7	
	lda $0			;replace last with new
	sta $4
	lda $1
	sta $5
	rts
	
yh:
       dcb $02, $02, $02, $02, $02, $02, $02, $02
       dcb $03, $03, $03, $03, $03, $03, $03, $03
       dcb $04, $04, $04, $04, $04, $04, $04, $04
       dcb $05, $05, $05, $05, $05, $05, $05, $05
       ;; Y cord LSB
yl:
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
        ;; Precomputed working buffer y positions
