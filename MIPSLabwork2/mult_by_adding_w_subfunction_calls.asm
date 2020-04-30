.data

num1: .word 3
num2: .word 6 

.text
main: 
	lw $a0, num1			#a0 will store number to be multiplied
	lw $a1, num2			#a1 will store number we're multiplying by 
	
	jal mult_by_add 		#call mult_by_adding to multiply the two arguments 
	
	move $a0, $v0			#store product into $a0
	li $v0, 1			#store syscall code for print int in $v0
	syscall				#print product 
	
	li $v0, 10 			#load syscall code for exit 
	syscall				#exit 



mult_by_add: 
	sub $sp, $sp, 4			#make room on stack to save $ra in order to return to calling function 
	sw  $ra, 0($sp)			#save $ra to stack 
	
	li $a2, 0			#initialize sum for argument that will be passed to adder 
	loop: 
		jal  adder		#go to adder where sum/product will be incremented by num1 
		move $a2, $v0		#move what adder returns to $a2
		sub  $a1, $a1, 1  	#decriment $a1 by 1 
		bgtz $a1, loop		#if $a1>0 loop again
	
	move $v0, $a2 			#move running sum to return value 
	lw $ra, 0($sp)			#restore $ra from the stack 
	jr $ra				#return to main 


adder: 
	add  $v0, $a2, $a0		#add num1 to running sum 
	jr $ra 				#return to mult_by_add
