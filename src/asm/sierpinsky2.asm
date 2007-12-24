; sierpinski

  lda #$10   ; initial xpos+ypos
  sta $20
  sta $21

  ; Change these to give the triangle another "angle":

  lda #0
  sta $10   ; y0
  lda #15
  sta $11   ; x0

  lda #0
  sta $13   ; y1
  lda #31
  sta $14   ; x1

  lda #32
  sta $12   ; y2
  sta $15   ; x2


draw:
  lda $fe
  and #3
  cmp #3
  beq draw
  asl
  tax
  lda $10,x
  clc
  adc $20
  lsr
  sta $20
  lda $11,x
  clc
  adc $21
  lsr
  sta $21

  lda $20
  and #$1f
  asl
  tax
  lda ypos,x
  sta $0
  inx
  lda ypos,x
  sta $1
  lda $21
  and #$1f
  tax
  lda #$5
  sta ($0,x)

  jmp draw

ypos:
  dcb $00,$02,$20,$02,$40,$02,$60,$02
  dcb $80,$02,$a0,$02,$c0,$02,$e0,$02
  dcb $00,$03,$20,$03,$40,$03,$60,$03
  dcb $80,$03,$a0,$03,$c0,$03,$e0,$03
  dcb $00,$04,$20,$04,$40,$04,$60,$04
  dcb $80,$04,$a0,$04,$c0,$04,$e0,$04
  dcb $00,$05,$20,$05,$40,$05,$60,$05
  dcb $80,$05,$a0,$05,$c0,$05,$e0,$05
