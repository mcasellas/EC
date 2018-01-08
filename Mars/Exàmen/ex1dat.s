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
	la $t1, A
	move $t2, $zero #i = 0
	move $t3, $zero #j = 0
	
for1:	bge $t2, $t0, fi # i < 4
	
for2:	bge $t3, $t2, fi_for2 # j < i
	
	sll $t4, $t2, 2
	addu $t4, $t4, $t3
	sll $t4, $t4, 2
	addu $t4, $t4, $t1
	lw $t4, 0($t4)  
	
	sll $t5, $t3, 2
	addu $t5, $t5, $t2
	sll $t5, $t5, 2
	addu $t5, $t5, $t1

 	bge $zero, $t4, else
 	sw $t4, 0($t5)
 	b fi_for1
 	
else: 	sw $zero, 0($t5) 	  
	
fi_for1: addiu $t3, $t3, 1
	b for1
  
fi_for2: addiu $t2, $t2, 1
	b for1
      
fi:     jr  $ra 

