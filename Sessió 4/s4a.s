	.data
signe:		.word 0
exponent:	.word 0
mantissa:	.word 0
cfixa:		.word 0x87D18A00
cflotant:	.float 0.0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)

	la	$t0, cfixa
	lw	$a0, 0($t0) # a0 cfixa
	la	$a1, signe # a1 signe
	la	$a2, exponent # a2 exponent
	la	$a3, mantissa # a3 mentissa
	jal	descompon

	la	$a0, signe
	lw	$a0,0($a0)
	la	$a1, exponent
	lw	$a1,0($a1)
	la	$a2, mantissa
	lw	$a2,0($a2)
	jal	compon

	la	$t0, cflotant
	swc1	$f0, 0($t0)

	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr	$ra


descompon:
	slt $t0, $a0, $zero
	sw $t0, 0($a1)

	sll $a0, $a0, 1 # eliminem el signe
	
if:	bne $a0, $zero, else # si cf != 0 saltem al else
	move $t2, $zero
	
	b fielse
	
else:	li $t2, 18
	
while:	blt $a0, $zero, fiwhile	# saltem si cf < 0
	sll $a0, $a0, 1
	addi $t2, $t2, -1
	b while
		
fiwhile:sra $a0, $a0, 8
	li $t0, 8388607
	and $a0, $a0, $t0
	
	addi $t2, $t2, 127
	
fielse:	sw $t2, 0($a2)
	sw $a0, 0($a3)
		
	jr $ra
	

compon: sll $a0, $a0, 31
	sll $a1, $a1, 23
	
	or $t0, $a0, $a1
	or $t0, $t0, $a2
	
	mtc1 $t0, $f0
	
	jr $ra
	
	

	
