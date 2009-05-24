;Flame demo for the 6502. 
;;Jeremy English 22-May-2009 <jhe@jeremyenglish.org>

mainloop:
lda $fe

ldx #$20          ;; The number of columns


;; This setting controls the ferocity of the flame
lda #2            ;; The number of pixels to set in the bottom row
sta $1

;; The bottom row of a random column gets set to the maximum heat
;; value from the table

setBottomRow:
dec $1
ldy #6
lda heat,Y        ;; Get the maximum heat intensity
pha
lda $fe           ;; pick a random column
and #$1f          ;; make sure we are in range
tax
pla
sta $5df,x        ;; Store the color in bottom row of the offscreen buffer
lda $1
bne setBottomRow

;; For every pixel in the frame buffer we are going to take the
;; average of it's neighbors to the north, south, east and west.  This
;; average determines the heat of the current pixel. The new heat gets
;; stored to the off-screen buffer.

;; Load the frame buffer pointers
lda #0

sta $15
sta $17
sta $19
sta $1b

lda #2
sta $16
lda #3
sta $18
lda #4
sta $1a
lda #5
sta $1c

ldx #0
fillOffScreen:
lda #0
sta $1d           ;; init the move frame pointer boolean

;; east values
;; -----------------------------------------------------------------------------

stx $1            ;; Store the original value of x
stx $2            ;; Here is the working copy
inc $2            ;; Move to the east
ldx $2
txa
tay

lda $1
and #$1f          ;; Check to see if we hit the east wall
eor #$1f          ;; if so then return zero for everything
bne east
lda #0
sta $3
sta $7
sta $b
sta $f
jmp endeast

east:
;; 1.
lda ($15),y       ;; Get the east pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $3            ;; store it for later

;; 2.
lda ($17),y       ;; Get the east pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $7            ;; store it for later

;; 3.
lda ($19),y       ;; Get the east pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $b            ;; store it for later

;; 4.
lda ($1b),y        ; Get the east pixel
and #$f           ;; keep it in range
tay
lda index,x       ;; Get the heat intensity
sta $f            ;; store it for later
endeast:

;; west values
;; -----------------------------------------------------------------------------
dec $2            ;; move back to the original location
dec $2            ;; move to the west
ldx $2
txa
tay

and #$1f          ;; Check to see if we hit the west wall
eor #$1f          ;; if so then return zero for everything
bne west
lda #0
sta $3
sta $7
sta $b
sta $f
jmp endwest

west:
;; 1.
lda ($15),y       ;; Get the west pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $4            ;; store it for later

;; 2.
lda ($17),y       ;; Get the west pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $8            ;; store it for later

;; 3.
lda ($19),y       ;; Get the west pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $c            ;; store it for later

;; 4.
lda ($1b),y       ;; Get the west pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $10           ;; store it for later

endwest:

;; south values
;; -----------------------------------------------------------------------------
inc $2            ;; move back to the original location
clc
lda #$20
adc $2            ;; move to the south
bcs moveframe1
jmp south
moveframe1:       ;; South is in the next region so we need to move the 
inc $16           ;; pointers down to the next region
inc $18
inc $1a
inc $1c
pha
lda #1
sta $1d           ;; store a boolean so we can set the pointer back
pla

south:
tay

;; 1.
lda ($15),y       ;; Get the south pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $5            ;; store it for later

;; 2.
lda ($17),y       ;; Get the south pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $9            ;; store it for later

;; 3.
lda ($19),y       ;; Get the south pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $d            ;; store it for later

;; 4.
lda ($1b),y       ;; Get the south pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $11           ;; store it for later

lda $1d           ;; If we did not move the frame pointer then we are done
beq endsouth
dec $16           ;; move the frame pointers back to there original value
dec $18
dec $1a
dec $1c
endsouth:

;; north values
;; -----------------------------------------------------------------------------
sec
lda #$20          ;; The value in $2 is still the orignal location
sbc $2            ;; move to the north
bcc moveframe2
jmp north
moveframe2:       ;; North is in the previous region so we need to move the 
dec $16           ;; pointers up to the previous region
dec $18
dec $1a
dec $1c
pha
lda #1
sta $1d           ;; store a boolean so we can set the pointer back
pla

north:

tay

;; 1.
lda ($15),y       ;; Get the north pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $6            ;; store it for later

;; 2.
lda ($17),y       ;; Get the north pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $a            ;; store it for later

;; 3.
lda ($19),y       ;; Get the north pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $e            ;; store it for later

;; 4.
lda ($1b),y       ;; Get the north pixel
and #$f           ;; keep it in range
tax
lda index,x       ;; Get the heat intensity
sta $12           ;; store it for later

lda $1d           ;; If we did not move the frame pointer then we are done
beq endnorth
inc $16           ;; move the frame pointers back to there original value
inc $18
inc $1a
inc $1c
endnorth:


;; now we get the average of the four neighbors
;; -----------------------------------------------------------------------------
clc
lda #0
adc $3            ;; add the east
adc $4            ;; add the west
adc $5            ;; add the south
adc $6            ;; add the north
ror               ;; shift right twice to divide by four
;ror
and #$7           ;; keep the index in range
tay 
lda heat,y        ;; get the heat value
ldx $1            ;; get the original value of x
sta $800,x        ;; store the new color in the off screen buffer

clc
lda #0
adc $7            ;; add the east
adc $8            ;; add the west
adc $9            ;; add the south
adc $a            ;; add the north
ror               ;; shift right twice to divide by four
;ror
and #$7           ;; keep the index in range
tay 
lda heat,y        ;; get the heat value
ldx $1            ;; get the original value of x
sta $900,x        ;; store the new color in the off screen buffer

clc
lda #0
adc $b            ;; add the east
adc $c            ;; add the west
adc $d            ;; add the south
adc $e            ;; add the north
ror               ;; shift right twice to divide by four
;ror
and #$7           ;; keep the index in range
tay 
lda heat,y        ;; get the heat value
ldx $1            ;; get the original value of x
sta $1000,x       ;; store the new color in the off screen buffer

clc
lda #0
adc $f            ;; add the east
adc $10           ;; add the west
adc $11           ;; add the south
adc $12           ;; add the north
ror               ;; shift right twice to divide by four
;ror
and #$7           ;; keep the index in range
tay 
lda heat,y        ;; get the heat value
ldx $1            ;; get the original value of x
sta $1100,x       ;; store the new color in the off screen buffer

inx
bne jmpfos
jmp paint_section
jmpfos:
jmp fillOffScreen


paint_section:
ldx #0

;; This paint section copies the off-screen buffer to the frame buffer.

paint:
lda $800,X
sta $200,X

lda $900,X
sta $300,X	

lda $1000,X
sta $400,X

lda $1100,X
sta $500,X	
inx
bne paint
	
jmp mainloop

;;This is our palette of colors from the coolest to the hotest	

heat:
;    0,  1,  2,  3,  4,  5,  6
dcb $0, $b, $9, $2, $a, $8, $7

;; This is the index of the heat table.  If we pull the heats color
;; out of the screen buffer we want to be able to get the index of
;; that color.  The index of the color will correspond to the heat
;; intensity of that pixel.

index:
;    0   1   2   3   4   5   6   7   8   9   a   b   c   d   e   f 
dcb $0, $0, $3, $0, $0, $0, $0, $6, $5, $2, $4, $1, $0, $0, $0, $0