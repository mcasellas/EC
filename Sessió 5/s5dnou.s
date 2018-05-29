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
        li $t0, 4 #fites
        li $t1, 16
        move $t2, $zero # k=0
fork:
        bge  $t2, $t0, end_fork # k>=4
        move $t3, $zero # i=0
        
fori:
        bge $t3, $t1, end_fori # i>=16
        move $t4, $zero # j = 0 
        move $t5, $zero # t6 -> temp
        
forj:	bge $t4, $t0, end_forj # j >= 4
	sll $t6, $t2, 2 
	addu $t6, $t6, $t4
	sll $t6, $t6, 2 # k*4+j
	la $t7, V2 
	addu $t8, $t7, $t6
	lw $t7, 0($t8) # t7 = V2[4k+j]
	sll $t8, $t3, 6
	la $t9, M
	addu $t8, $t9, $t8
	addu $t8, $t6, $t8
	lw $t6, 0($t8) #t6 = M[i][4k+j]
	mult $t6, $t7
	mflo $t6
	addu $t5, $t5, $t6
	addiu $t4, $t4, 1
	b forj
        
        
end_forj:
        la $t6, V1
        sll $t7, $t3, 2
        addu $t6, $t6, $t7
        lw $t7, 0($t6)
        addu $t5,$t5, $t7
        sw $t5, 0($t6)
        addiu $t3, $t3, 1
        b fori
        
end_fori:
	addiu $t2, $t2, 1
	b fork        
        
end_fork:
	jr	$ra

