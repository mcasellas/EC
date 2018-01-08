###############################################################################
##### NOM I COGNOMS: Marc Casellas Muns
###############################################################################
.data


A: .word    1,  11, 12, 13,
            2,  -3, 14, 15,
            4,  -5,  6, 16,
           -7,   8, -9, 10

.text
.globl main

# ESCRIU AQUI EL TEU CODI
main: 	
	li $t0, 4
	la $t1, A # @a	
	move $t2, $zero
	move $t3, $zero
	
for1: 	beq $t2, $t0, fi_for1 # i = $t2 (fila)

for2:	bgt $t3, $t2, fi_for2 # j = $t3 (columna)
	
	sll $t5, $t3, 2
	addu $t5, $t5, $t2
	sll $t5, $t5, 2 
	addu $t5, $t5, $t1 # $t5 = @ A[j][i]
	
	sll $t4, $t2, 2 #i*NB
	addu $t4, $t4, $t3
	sll $t4, $t4, 2 
	addu $t4, $t4, $t1 # $t4 = @ A[i][j]
	lw $t4, 0($t4) # A[i][j]
	bgt $t4, $zero, else
	
	sw $t4, 0($t5)	
	b fi_cond	
	
else:	sw $zero, 0($t5) 

fi_cond:addiu $t3, $t3, 1	
	
fi_for2:addiu $t2, $t2, 1 
	b for2		

fi_for1: 

      jr  $ra 

