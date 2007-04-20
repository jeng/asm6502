;
;  a simple "snake" game.  Keys for up/down/left/right:
;
;      [W]
;       ^
;       |
;[A]<---+--->[D]
;       |
;       v
;      [S]

start:
  lda #15            ; initial ypos
  sta $2             ; store it at zp 2
  lda #15            ; initial xpos
  sta $3             ; store it at zp 3
  lda #100           ; set a default direction (right)
  sta $ff            ; store it in keyboard buffer (it's rw)

mainloop:
  jsr readKeys       ; call sub for reading keys
  jsr plotPixel      ; call sub for plotting pixel
  lda $4             ; load zp 4
  beq mainloop       ; loop while not game over
  rts

readKeys:
  lda $ff            ; get keydata
  cmp #97            ; 97 (a)?
  bne notLeft        ; no..
  dec $3             ; yes? decrease $3 (xpos)
  rts
notLeft:
  cmp #100           ; 100 (s)?
  bne notRight       ; no..
  inc $3             ; yes? increment $3 (xpos)
  rts
notRight:
  cmp #119           ; 119 (w)?
  bne notUp          ; no..
  dec $2             ; yes? decrease $2 (ypos)
  rts
notUp:
  cmp #115           ; 115 (s)?
  bne notDown        ; no..
  inc $2             ; yes? increase $2 (ypos)
notDown:
  rts                ; done, return

plotPixel:
  lda $2             ; load ypos
  and #$1f           ; "and" with 31
  asl                ; y = y * 2
  tax                ; x=a

  lda ypositions,x   ; load value from ypositions + x
  sta $0             ; store it at zp 0
  inx                ; increase x...
  lda ypositions,x   ; ..to get the next value
  sta $1             ; store it at zp 1

  lda $3             ; a=xpos
  and #$1f           ; "and" with 31
  tax                ; x=a
  lda ($0,x)         ; load value at cell
  cmp #0             ; is it 0?
  bne crash          ; yes

  lda #1             ; white color
  sta ($0,x)         ; store it on screen
  rts                ; return

crash:
  ldy #32            ; y=32
flash:
  lda $fe            ; get a random value
  sta ($0,x)         ; store it at current pos
  dey                ; y--
  bne flash          ; loop

  lda #1             ; a=1
  sta $4             ; set our "game over" trigger
  rts                ; return

ypositions:
  dcb $00,$02,$20,$02,$40,$02,$60,$02
  dcb $80,$02,$a0,$02,$c0,$02,$e0,$02
  dcb $00,$03,$20,$03,$40,$03,$60,$03
  dcb $80,$03,$a0,$03,$c0,$03,$e0,$03
  dcb $00,$04,$20,$04,$40,$04,$60,$04
  dcb $80,$04,$a0,$04,$c0,$04,$e0,$04
  dcb $00,$05,$20,$05,$40,$05,$60,$05
  dcb $80,$05,$a0,$05,$c0,$05,$e0,$05

