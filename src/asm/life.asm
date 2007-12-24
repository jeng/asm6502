	;; 1. The immediate neighbors of a cell are those cells occupying
	;;    the eight horizontally, vertically, and diagnoally adjacent
	;;    cells.
	;; 2. If a LIFE cell has fewer than two immediate neighbors, it
	;;    dies of loneliness. If a LIFE cell has more then three
	;;    immediate neighbors, it dies of overcrowding.
	;; 3. If an empty square has exactly three LIFE cells as immediate
	;;    neighbors, a new cell is born in the square.
	;; 4. Births and deaths all take place exactly at the change of
	;;    generations. Thus a dying cell may help birth a new one,
	;;    but a newborn cell may not resurrect a dying cell, nor may
	;;    one dying cell stave off death for another by lowering the
	;;    local population density.

	;; $0	LSB	video buffer
	;; $1	MSB	video buffer
	;; $2	background color
	;; $3	foreground color
	;; $4	neighboor count
	;; $5	LSB	working buffer
	;; $6	MSB	working buffer
	
	lda #0			; setup the video buffer
	sta $0
	lda #2
	sta $1
	lda #14			; light blue background
	sta $2
	lda #9			; brown foreground
	sta $3
	lda #0			; init neighboor count
	sta $4
	lda #0			; setup the working buffer
	sta $5
	lda #10
	sta $6

	jmp playlife
	
	;; we want to wrap around the grid so we need to check the
	;; boundaries.

check32:
	cmp #32			; A should contain the index to check
	beq min
	rts
min:				; Wrap the number
	lda #0
	rts

check255:
	cmp #255		; A should contain the index to check
	beq max
	rts
max:
	lda #31
	rts

	;; Check the number of neighbors a cell has.
	;; x and y should have the correct position.
checkn:
	txa			; Make sure the position is in range
	pha			; save x
	jsr check32
	jsr check255
	tax
	tya
	pha			; save y
	jsr check32
	jsr check255
	tay
	lda vyl,y
	sta $0
	lda vyh,y
	sta $1
	lda ($0,x)
	cmp $3			; is the cell alive
	beq countn
return:	
	pla
	tay
	pla
	tax
	rts
countn:
	inc $4			
	jmp return

	;; copy the working buffer to the video buffer
displayWork:
	ldy #$0
	ldx #$0
displayLoop:
	lda $1000,x
	sta $200,x
	lda $1100,x
	sta $300,x
	lda $1200,x
	sta $400,x
	lda $1300,x
	sta $500,x
	inx
	dey
	bne displayLoop
	lda $fe			; just debuggin shit
	sta $200
	rts

	;; Main section of the program
playlife:
	;; paint the initial background
	ldy #$0
	ldx #$0
backgroundLoop:
	lda $2			; background
	sta $1000,x
	sta $1100,x
	sta $1200,x
	sta $1300,x
	inx
	dey
	bne backgroundLoop
	
	ldx #10
	ldy #5	
setpos:	
	;; setup initial position
	lda #3			; Load foreground
	sta $1200,x
	inx
	dey
	bne setpos
nextgen:
	jsr displayWork
	ldx #0
	ldy #0
walk:
	lda #0
	sta $4			; set the count to zero
	txa
	pha
	tya
	pha
	dec x
	dec y
	jsr checkn		; (x-1, y-1)
	iny
	jsr checkn		; (x-1, y)
	iny
	jsr checkn		; (x-1,y+1)
	inx
	jsr checkn		; (x, y+1)
	dey
	dey
	jsr checkn		; (x, y - 1)
	inx
	jsr checkn		; (x+1, y-1)
	iny
	jsr checkn		; (x+1, y)
	iny
	jsr checkn		; (x+1, y+1)
	pla
	tay
	pla
	tax
	jmp paint
next:	
	inx
	txa
	sta $7			; debug x,y
	tya
	sta $8
	txa
	cmp #32
	beq moveline
	jmp walk
paint:	
	lda wyl,y
	sta $5
	lda wyh,y
	sta $6
	lda $2			; Load the background
	sta ($5,x)
	lda $4			; Load the count
	cmp #3
	beq newcell
	jmp next
newcell:
	lda $3			; Load the foreground
	sta ($5,x)
	jmp next
moveline:	
	ldx #0
	iny
	tya
	cmp #32
	beq nextGen
	jmp walk

	;; Precomputed video buffer y positions
	;; Y cord MSB
vyh:
       dcb $02, $02, $02, $02, $02, $02, $02, $02
       dcb $03, $03, $03, $03, $03, $03, $03, $03
       dcb $04, $04, $04, $04, $04, $04, $04, $04
       dcb $05, $05, $05, $05, $05, $05, $05, $05
       ;; Y cord LSB
vyl:
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
	;; Precomputed working buffer y positions
wyh:
       dcb $10, $10, $10, $10, $10, $10, $10, $10
       dcb $11, $11, $11, $11, $11, $11, $11, $11
       dcb $12, $12, $12, $12, $12, $12, $12, $12
       dcb $13, $13, $13, $13, $13, $13, $13, $13
       ;; Y cord LSB
wyl:
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
       dcb $00, $20, $40, $60, $80, $a0, $c0, $e0
	
