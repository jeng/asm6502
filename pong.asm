
; ping pong
; a = left
; d = right

  jsr init
  jsr setPos
  jsr rndObsticles

; - main loop

loop:

  jsr bounceBall
  jsr movePlayer

  lda $10
  cmp #31
  bne loop

gameOver:
  jmp gameOver
;  jmp loop

; - set initial positions

setPos:
  lda #11
  sta $10 ; xpos ball
  lda #5
  sta $11 ; ypos ball
  lda #$ff
  sta $12 ; xadd ball
  sta $13 ; yadd ball
  rts

; - draw screen

init:
  lda #0
  sta 0
  lda #2
  sta 1
  ldx #0
  ldy #31
d:tya
  tax
  lda #14
  sta $200,x
  sta $220,x
  ldx #0
  sta ($0,x)
  inx
  sta ($0,x)
  ldx #30
  sta ($0,x)
  inx
  sta ($0,x)

  lda $0
  cmp #$e0
  bne n
  inc $1
n:clc
  adc #$20
  sta $0
  dey
  bne d
  rts

; - move ball

bounceBall:
  lda $10
  sta $15
  lda $11
  sta $16

  ; update pos

  lda $10
  clc
  adc $12
  sta $10

  jsr checkPos

  cmp #0
  beq notBounceY

  lda $12
  cmp #1
  bne goUp
  lda #$ff
  sta $12
  dec $10
  jmp notBounceY
goUp:
  lda #1
  sta $12
  inc $10
notBounceY:


  lda $11
  clc
  adc $13
  sta $11

  jsr checkPos

  cmp #0
  beq notBounceX

  lda $13
  cmp #1
  bne goLeft

  lda #$ff
  sta $13
  dec $11
  jmp notBounceX
goLeft:
  lda #1
  sta $13
  inc $11

notBounceX:


  lda $10
  and #$1f
  asl
  tax
  lda ypos,x
  sta $0
  inx
  lda ypos,x
  sta $1
  lda $11
  and #$1f
  tax
  lda #$d
  sta ($0,x)



  ; erase previous pos

  lda $15
  and #$1f
  asl
  tax
  lda ypos,x
  sta $0
  inx
  lda ypos,x
  sta $1
  lda $16
  and #$1f
  tax
  lda #0
  sta ($0,x)

  rts

checkPos:
  lda $10
  asl
  tax
  lda ypos,x
  sta $0
  inx
  lda ypos,x
  sta $1
  lda $11
  and #$1f
  tax
  lda ($0,x)
  rts

; - move player

movePlayer:
  lda $ff
  cmp #97
  bne notLeft
  lda $20
  cmp #0
  beq notRight
  dec $20
notLeft:
  cmp #100
  bne notRight
  lda $20
  cmp #25
  beq notRight
  inc $20
notRight:
  ldx $20
  lda #0
  sta $5e0,x
  inx
  ldy #30
drawPlayer:
  lda #15
  sta $5e0,x
  inx
  dey
  bne drawPlayer
  lda #0
  sta $5e0,x
  rts

rndObsticles:
  lda #0
  sta $5
  lda #$2
  sta $6

obsticleLoop:
  inc $6

  lda $fe
  and #15
  clc
  adc #5
  tax
  lda $6
  asl
  tay
;  ldy #10
  lda #$c
row:
  sta ($5,x)
  inx
  dey
  bne row

  lda $6
  cmp #$5
  bne obsticleLoop
  rts

; - precalculated y-positions

ypos: 
  dcb $00,$02,$20,$02,$40,$02,$60,$02
  dcb $80,$02,$a0,$02,$c0,$02,$e0,$02
  dcb $00,$03,$20,$03,$40,$03,$60,$03
  dcb $80,$03,$a0,$03,$c0,$03,$e0,$03
  dcb $00,$04,$20,$04,$40,$04,$60,$04
  dcb $80,$04,$a0,$04,$c0,$04,$e0,$04
  dcb $00,$05,$20,$05,$40,$05,$60,$05
  dcb $80,$05,$a0,$05,$c0,$05,$e0,$05