.data
m1:      .asciiz "Thang"
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
lp:      .asciiz " ("
rp:      .asciiz ")"
nl:      .asciiz "\n"
mb:      .asciiz "bac "
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
         
#reading: .word 1080, 1289, 1533, 1792, 2026, 2215, 2369
#         .word 2493, 2597, 2696, 2810, 2954, 3123
usage:   .space 48
cnt:     .word 0, 0, 0, 0
# Ma nguon 8 – dien nang tung thang
.text
.globl main
main:
  la   $s0, reading     # $s0 = dia chi nen reading
  la   $s1, usage       # $s1 = dia chi nen usage
  addi $s2, $zero, 0    # i = 0
  addi $s3, $zero, 12   # n = 12 thang
Loop:
  # >>> thoat neu i == n
  beq  $s2, $s3, Next
  # >>> tinh dia chi reading[i]
  sll  $t1, $s2, 2
  add  $t2, $t1, $s0
  # >>> $t3 = reading[i], $t4 = reading[i+1]
  lw   $t3, 0($t2)
  lw   $t4, 4($t2)
  # >>> $t5 = $t4 - $t3 (dien nang thang i+1)
  sub $t5, $t4, $t3
  # >>> tinh dia chi usage[i], luu $t5 vao usage[i]
  add  $t6, $t1, $s1
  sw   $t5, 0($t6)
  #Mo rong
  add  $s4, $s4, $t5
  slt  $t6, $s5, $t5
  beq  $t6, $zero, Skip
  addi $s5, $t5, 0
  addi $s6, $s2, 1
  Skip:
  # >>> in “Thang “, i+1, “: ", $t5, xuong dong
  li   $v0, 4
  la   $a0, m1
  syscall
  li   $v0, 1
  addi $a0, $s2, 1
  syscall
  li   $v0, 4
  la   $a0, m2
  syscall
  li   $v0, 1
  add  $a0, $t5, $zero
  syscall
  li   $v0, 4
  la   $a0, nl
  syscall
  # >>> i = i + 1, quay lai Loop
  addi $s2, $s2, 1
  j    Loop
 Next:
  la   $s1, usage
  la   $s4, cnt
  addi $s2, $zero, 0
  addi $s3, $zero, 12
 LoopNext:
  beq  $s2, $s3, DoneNext
  sll  $t0, $s2, 2
  add  $t1, $s1, $t0
  lw   $t2, 0($t1)
  # Kiem tra bac theo Bang 6
  slti $t3, $t2, 101
  bne  $t3, $zero, Bac1
  slti $t3, $t2, 151
  bne  $t3, $zero, Bac2
  slti $t3, $t2, 201
  bne  $t3, $zero, Bac3
  j    Bac4
Bac1:
  addi $t4, $zero, 0
  j    UpdateCnt
Bac2:
  addi $t4, $zero, 4
  j    UpdateCnt
Bac3:
  addi $t4, $zero, 8
  j    UpdateCnt
Bac4:
  addi $t4, $zero, 12
UpdateCnt:
  add  $t5, $s4, $t4
  lw   $t6, 0($t5)
  addi $t6, $t6, 1
  sw   $t6, 0($t5)
  addi $s2, $s2, 1
  j    LoopNext
DoneNext:
  addi $s2, $zero, 0
  addi $s3, $zero, 4
LoopDone:
  beq  $s2, $s3, Done
  # In chuoi "Bac "
  li   $v0, 4
  la   $a0, mb
  syscall
  # In so thu tu bac <k+1>
  li   $v0, 1
  addi $a0, $s2, 1
  syscall
  # In chuoi
  li   $v0, 4
  la   $a0, m2
  syscall
  sll  $t0, $s2, 2
  add  $t1, $s4, $t0
  lw   $a0, 0($t1)
  li   $v0, 1
  syscall
  li   $v0, 4
  la   $a0, nl
  syscall
  addi $s2, $s2, 1
  j    LoopDone
 Done:
  li   $v0, 10
  syscall
