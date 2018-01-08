###############################################################################
##### NOM I COGNOMS: Marc Casellas Muns
###############################################################################
	.data
vec:  	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
vec_c: 	.asciiz "Doppelganger"
VarEnt:	.word 0
frase1: .asciiz "Caracter retornat per examen: "
frase2: .asciiz "Valor de la variable VarEnt: "


	.text
	.globl main
	

# ESCRIU AQUI EL TEU CODI
examen:	
	addiu $sp, $sp, -46
	
	move $s0, $ra
	move $s1, $a0
	move $s2, $a1
	
	addiu $a0, $sp, 16
	move $a1, $s2
	b fa_quelcom
	sw $v0, 0($sp)
	
	addiu $a0, $sp, 26
	move $a1, $s2
	sw $a2, 0($sp)
	
	b fa_quelcom2
	sw $v0, 4($sp)
	
	move $t1, $zero #loc3
	
	li $t2, 0	
	li $t3, 4
	
	bge $t2, $t4, fi_for
	
	addiu $t5, $sp, 26
	addiu $t5, $t5, $t2
	lw $t5, 0($t5)
	addi $t1, $t1, t5
	
	addiu $t1, $t1, 
	addiu $t2, $t2, 1
	
	

# NO CANVIEU RES DEL CODI A APRTIR D'ADQUESTA LINIA	 	

main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$v0, 4
	la	$a0, frase1
	syscall 
	jal	nofares
	la	$a0, vec
	la 	$a1, vec_c
	la	$a2, VarEnt
	jal	examen
	move	$a0, $v0
	li	$v0, 11
	syscall
	li	$a0, 10
	li	$v0, 11
	syscall
	la	$a0, frase2
	li	$v0, 4
	syscall
	la	$t0, VarEnt
	lw	$a0, 0($t0)
	li	$v0, 1
	syscall
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra

fa_quelcom:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$t1, 0
	li 	$t3, 10
bucfq:	lb	$t2, 0($a1)
	sb	$t2, 0($a0)
	addiu	$a0, $a0, 1
	addiu	$a1, $a1, 1
	addiu	$t1, $t1, 1
	bne	$t1, $t3, bucfq
	jal	nofares
	li	$v0, 3
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

fa_quelcom2:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$t0, -1
	li	$t1, 2
	li	$t2, 5
	sw	$t1, 0($a0)
	sw	$t0, 0($a1)
	sw	$t2, 4($a0)
	sw	$t0, 4($a1)
	sw	$t1, 8($a0)
	sw	$t0, 8($a1)
	sw	$t1, 12($a0)
	sw	$t0, 12($a1)	
	jal	nofares
	li	$v0, 1
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra
	



