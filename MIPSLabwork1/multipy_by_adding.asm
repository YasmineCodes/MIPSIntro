#program multiplies 2 numbers by repeated addition 

.data

num1: .word 3				#number to be multiplied
num2: .word 6				#number to be multiplied by 
product: .word 0			#initializing product at 0 

.text 

lw $t0, num1				#load num to be multiplied into $t0
lw $t1, num2				#load num to be multiplied-by into $t1

la $t3, product				#store address of product where we can save final answer 
li $t4, 0				#running sum/product will be in $t4

beqz $t1, exit				#if we're multiplying by zero we exit, the answer will be zero 
beqz $t0, exit				#doing this check again because if either number is zero, the product will be zero

loop:
	
	add  $t4, $t4, $t0		#$t4 = $t4+num1
	sub  $t1, $t1, 1		#$t1--; 

	bgtz $t1,  loop			#if ($t1>0) continue looping 

exit: 	
	
	sw $t4, ($t3)			#store final product in product variable the address of which is stored at $t3
	move $a0, $t4			#move return product into $a0
	li $v0, 1			#load code for print int 
	syscall				#print zero_bit_counter result 
