# Ma nguon 6 - dien nang tieu thu giua hai chi so
.data
prompt: .asciiz "Nhap chi so (kWh): "
m1:     .asciiz "Thang 1: "
m2:     .asciiz "Thang 2: "
m3:     .asciiz "Thang 3: "
tot:    .asciiz "Tong:    "
nl:     .asciiz "\n" 
.text
.globl main
main:
	#bdau
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $t0, $v0, $zero
	#thg1
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $t1, $v0, $zero
 	#thg2
    li    $v0, 4
    la    $a0, prompt
    syscall
    li    $v0, 5
    syscall
    add   $t2, $v0, $zero
	#thg3
    li    $v0, 4
    la    $a0, prompt
    syscall
    li    $v0, 5
    syscall
    add   $t3, $v0, $zero
	#r1 
    sub   $t4, $t1, $t0
	#r2 
    sub   $t5, $t2, $t1
	#r3 
    sub   $t6, $t3, $t2
	#tong
    sub   $t7, $t3, $t0
	#out1
    li    $v0, 4
    la    $a0, m1
    syscall
    li    $v0, 1
    add   $a0, $t4, $zero
    syscall
    li    $v0, 4
    la    $a0, nl
    syscall
	#out2
    li    $v0, 4
    la    $a0, m2
    syscall
    li    $v0, 1
    add   $a0, $t5, $zero
    syscall
    li    $v0, 4
    la    $a0, nl
    syscall
	#out3
        li    $v0, 4
    la    $a0, m3
    syscall
    li    $v0, 1
    add   $a0, $t6, $zero
    syscall
    li    $v0, 4
    la    $a0, nl
    syscall
	#tot
    li    $v0, 4
    la    $a0, tot
    syscall
    li    $v0, 1
    add   $a0, $t7, $zero
    syscall
    li    $v0, 4
    la    $a0, nl
    syscall
	#end
    li   $v0, 10
    syscall
