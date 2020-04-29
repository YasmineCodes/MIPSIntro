#program multiplies 2 numbers by repeated addition 

.data

num1: .word 3
num2: .word 6
product: .word 0

.text 

lw $t0, num1
lw $t1, num2

la $t3, product
li $t4, 0

beqz $t1, exit

loop:
	
	add  $t4, $t4, $t0
	sub  $t1, $t1, 1

	bgtz $t1,  loop

exit: 
	sw $t4, ($t3)
	
