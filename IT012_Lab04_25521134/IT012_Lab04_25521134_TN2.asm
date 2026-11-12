# Ma nguon 5 – phan bac dien nang
.data
prompt: .asciiz “Nhap dien nang (kWh): “
msg:    .asciiz “Bac: “
nl:     .asciiz “\n”
 
.text
.globl main
main:
  li  $v0, 4
  la  $a0, prompt
  syscall
  li  $v0, 5            # doc kWh, ket qua o $v0
  syscall
  add $s0, $v0, $zero   # $s0 = dien nang (kWh)
  # >>> xac dinh bac (1..4) theo Bang 6, dat vao $s1
  slti $t0, $s0, 101
    bne  $t0, $zero, bac1


    slti $t0, $s0, 151
    bne  $t0, $zero, bac2


    slti $t0, $s0, 201
    bne  $t0, $zero, bac3

    j    bac4

    bac1:
    li   $s1, 1
    j    in_kq
    bac2:
    li   $s1, 2
    j    in_kq
    bac3:
    li   $s1, 3
    j    in_kq
    bac4:
    li   $s1, 4

in_kq:
  # >>> in “Bac: “, roi $s1, roi xuong dong
  li   $v0, 4
    la   $a0, msg
    syscall

    li   $v0, 1
    add  $a0, $s1, $zero
    syscall

    li   $v0, 4
    la   $a0, nl
    syscall
  
  li  $v0, 10
  syscall
