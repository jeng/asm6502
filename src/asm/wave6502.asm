;; Show "6502" on the screen waving up and down.
;; Jeremy English 29-December-2007
;;
;; Each digit is stored as a pattern of vertical bits.
;; For example:
;;
;;   111111     This is the digit six. We think of the digit 
;;   111111     by it's column pattern. The column patterns 
;;   110000     are labeled at the bottom of the example. 
;;   110000     Pattern B is 1100110011. The basic algorithm 
;;   111111     is that we get the pattern, paint the first
;;   111111     bit (1 foreground, 0 background) then dec y 
;;   110011     and get the next bit.
;;   110011     
;;   111111     The pattern for each digit is:
;;   111111     6 = AABBCC
;;   ------     5 = DDBBCC
;;   AABBCC     0 = AAEEAA
;;              2 = CCBBDD

;;Addresses $0 and $1 are used by the paint subroutine.

jsr dis_6
jsr dis_5
jsr dis_0
jsr dis_2
rts


;;Display the digit 6 on the screen
dis_6:
  lda #<pattern_a      ; Load the lsb of pattern a
  sta $2               ; store lsb
  lda #>pattern_a      ; Load the msb of pattern a
  sta $3               ; store msb
  lda #0               ; Load the current column
  sta $4               ; store the column
  jsr dis_pat          ; Jump to the display pattern subroutine.
  lda #1               ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw pattern a again
  lda #<pattern_b      ; load pattern B
  sta $2               ; store lsb
  lda #>pattern_b
  sta $3               ; store msb
  lda #2               ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first b pattern
  lda #3               ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second b pattern
  lda #<pattern_c      ; load pattern C
  sta $2               ; store lsb
  lda #>pattern_c
  sta $3               ; store msb
  lda #4               ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first c pattern
  lda #5               ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second c pattern
  lda #<pattern_null   ; load the null pattern 
  sta $2               ; store lsb
  lda #>pattern_null
  sta $3               ; store msb
  lda #6               ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first null pattern
  lda #7               ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second null pattern
  rts                  ; we are done with 6

;;Display the digit 5 on the screen
dis_5:
  lda #<pattern_d      ; Load the lsb of pattern d
  sta $2               ; store lsb
  lda #>pattern_d      ; Load the msb of pattern d
  sta $3               ; store msb
  lda #8               ; Load the current column
  sta $4               ; store the column
  jsr dis_pat          ; Jump to the display pattern subroutine.
  lda #9               ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw pattern d again
  lda #<pattern_b      ; load pattern B
  sta $2               ; store lsb
  lda #>pattern_b
  sta $3               ; store msb
  lda #10              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first b pattern
  lda #11              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second b pattern
  lda #<pattern_c      ; load pattern c
  sta $2               ; store lsb
  lda #>pattern_c
  sta $3               ; store msb
  lda #12              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first c pattern
  lda #13              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second c pattern
  lda #<pattern_null   ; load the null pattern 
  sta $2               ; store lsb
  lda #>pattern_null
  sta $3               ; store msb
  lda #14              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first null pattern
  lda #15              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second null pattern
  rts                  ; we are done with 5

;;Display the digit 0 on the screen
dis_0:
  lda #<pattern_a      ; Load the lsb of pattern a
  sta $2               ; store lsb
  lda #>pattern_a      ; Load the msb of pattern a
  sta $3               ; store msb
  lda #16              ; Load the current column
  sta $4               ; store the column
  jsr dis_pat          ; Jump to the display pattern subroutine.
  lda #17              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw pattern a again
  lda #<pattern_e      ; load pattern e
  sta $2               ; store lsb
  lda #>pattern_e
  sta $3               ; store msb
  lda #18              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first e pattern
  lda #19              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second e pattern
  lda #<pattern_a      ; load pattern a
  sta $2               ; store lsb
  lda #>pattern_a
  sta $3               ; store msb
  lda #20              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first a pattern
  lda #21              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second a pattern
  lda #<pattern_null   ; load the null pattern 
  sta $2               ; store lsb
  lda #>pattern_null
  sta $3               ; store msb
  lda #22              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first null pattern
  lda #23              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second null pattern
  rts                  ; we are done with 0

;;Display the digit 2 on the screen
dis_2:
  lda #<pattern_c      ; Load the lsb of pattern c
  sta $2               ; store lsb
  lda #>pattern_c      ; Load the msb of pattern c
  sta $3               ; store msb
  lda #24              ; Load the current column
  sta $4               ; store the column
  jsr dis_pat          ; Jump to the display pattern subroutine.
  lda #25              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw pattern c again
  lda #<pattern_b      ; load pattern b
  sta $2               ; store lsb
  lda #>pattern_b
  sta $3               ; store msb
  lda #26              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first b pattern
  lda #27              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second b pattern
  lda #<pattern_d      ; load pattern d
  sta $2               ; store lsb
  lda #>pattern_d
  sta $3               ; store msb
  lda #28              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the first d pattern
  lda #29              ; move to the next column
  sta $4               ; store the column
  jsr dis_pat          ; draw the second d pattern
  rts                  ; we are done with 2



;; Display a pattern on the screen. The pattern to use is 
;; stored at $2 and $3. The current column is stored at $4.
dis_pat:
  ldy $4             ; Load the current column into y
  lda y_start_pos,y  ; Get the start position for y
  tay
  sty $5             ; Store the starting position in memory
  ldy #0             ; We have 12 bits that need to be painted
dis_pat_loop:
  lda ($2),y         ; get a bit from the pattern
  beq black          ; is the bit off? if so paint it black
  lda #1             ; set the foreground to white XXX 
  jmp white          ; jump past setting the foreground black
black:
  lda #0             ; set the foreground to black
white:
  pha                ; save the color on the stack
  tya                ; move the index into the accumulator
  clc                ; clear the carry 
  adc $5             ; add the starting position to the index
  sty $6             ; store the index 
  tay                ; The calculated y position
  ldx $4             ; The x position is the current column
  pla                ; pop the color off of the stack
  jsr paint          ; paint the pixel on the screen
  ldy $6             ; get the index out of memory
  iny                ; increment the index
  tya
  cmp #12            ; Have we looked at all of the bits?
  bne dis_pat_loop   ; if not then continue looking
  rts                ; else return from the subroutine

;; Paint - Put a pixel on the screen by using the x registry for 
;;         the x position, the y registry for the y position and 
;;         the accumulator for the color.
paint:
   pha           ; Save the color
   lda yl,y      ; Get the LSB of the memory address for y
   sta $0        ; Store it first
   lda yh,y      ; Get the MSB of the memory address for y
   sta $1        ; Store it next
   txa           ; We want x in the y registry so we transfer it to A
   tay           ; and then A into y.
   pla           ; Pop the color off of the stack
   sta ($0),y    ; Store the color at the correct y + x address.
   rts           ; return from the subroutine.

;; Paint uses the following two tables to look up the 
;; correct address for a y coordinate between 
;; 0 and 31.

;; Y cord MSB
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

;; A zero is on the end of each pattern to clean up 
;; residue left by waving.
pattern_a:
  dcb 0,1,1,1,1,1,1,1,1,1,1,0

pattern_b:
  dcb 0,1,1,0,0,1,1,0,0,1,1,0

pattern_c:
  dcb 0,1,1,0,0,1,1,1,1,1,1,0

pattern_d:
  dcb 0,1,1,1,1,1,1,0,0,1,1,0

pattern_e:
  dcb 0,1,1,0,0,0,0,0,0,1,1,0

pattern_null:
  dcb 0,0,0,0,0,0,0,0,0,0,0,0

;; Table that store the current start position 
;; of each y column.
y_start_pos:
  dcb 10,10,9,9,8,8,7,7,6,6,7,7,8,8,9,9,10,10,9,9,8,8,7,7
  dcb 6,6,7,7,8,8
