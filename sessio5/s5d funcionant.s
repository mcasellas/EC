	.data	
V1:     .space  64
M:      .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
        .word   1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
        .word   0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
V2:     .word   -5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10

	.text
	.globl main
main:
        li $s1, 4
        li $s2, 16
        move $s3, $zero
fork:
        bge  $s3, $s1, end_fork
        move $s4, $zero
        
fori:
        bge $s4, $s2, end_fori
        move $s6, $zero
        move $s5, $zero
        
forj:	bge $s5, $s1, end_forj
	sll $t0, $s3, 2
	addu $t0, $t0, $s5
	sll $t0, $t0, 2
	la $t4, V2
	addu $t1, $t4, $t0
	lw $t1, 0($t1)
	sll $t2, $s4, 6
	la $t4, M
	addu $t2, $t4, $t2
	addu $t2, $t2, $t0
	lw $t2, 0($t2)
	mult $t1, $t2
	mflo $t1
	addu $s6, $s6, $t1
	addiu $s5, $s5, 1
	b forj
        
        
end_forj:
        la $t4, V1
        sll $t3, $s4, 2
        addu $t3, $t4, $t3
        lw $t5, 0($t3)
        addu $s6,$s6, $t5
        sw $s6, 0($t3)
        addiu $s4, $s4, 1
        b fori
        
end_fori:
	addiu $s3, $s3, 1
	b fork        
        
end_fork:
	jr	$ra

