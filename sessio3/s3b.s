	# Sessio 3

	.data 
# Declara aqui les variables mat1, mat4 i col
	.align 2
mat1: 	.space 120
mat4: 	.word 2,3,1,2,4,3
col: 	.word 2

	.text 
	.globl main
main: 	
	la $t0, mat1
	la $a0, mat4
	la $a2, col
	
	lw $a2, 0($a2)
	lw $a1, 8($a0)
	
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	
	jal subr
	
	
	sw $v0, 108($t0)
	
	li $a1, 1
	li $a2, 1
	
	jal subr
	
	sw $v0, 0($t0)
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra

subr:	
	
	sll $t1, $a2, 2 # j*NB
	li $t2, 12 # NB*NC = 3*4
		
	mult $t2, $a1 # i*NB*NC
	mflo $t2
	addu $t2, $t2, $t1 # i*NB*NC +j*NB
	addu $t2, $t2, $a0 # mat1 + i*NB*NC + j*NB
	
	li $t1, 24
	
	mult $t1, $a2
	mflo $t1
	addiu $t1, $t1, 20
	addu $t1, $t0, $t1
	
	lw $t2, 0($t2)
	
	sw $t2, 0($t1)
	move $v0, $a1
	
	jr $ra
	
	

