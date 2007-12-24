;
; move a dot in x-axis according to preset table
;

  ldx #0
  stx $0
loop:
  inc $0
  ldy $0
  cpy #62
  bne notreset
  ldy #$0
  sty $0
notreset:
  lda #$0
  sta $400,x
  ldx sinus,y
  lda #1
  sta $400,x
  jmp loop

sinus:
  dcb 16,17,19,20,22,23,25,26,27,28,29,30,30
  dcb 31,31,31,31,31,31,31,30,29,28,27,26,25
  dcb 24,22,21,19,18,16,16,14,12,11,9,8,7,5
  dcb 4,3,3,2,1,1,1,1,1,1,1,2,2,3,4,5,6,8,9
  dcb 11,12,14,15
