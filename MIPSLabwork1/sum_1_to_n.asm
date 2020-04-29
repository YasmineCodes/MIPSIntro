.data 
n: .word 20
sum: .word 0

.text

lw $t0, n	#$t0=n
la $t1, sum	#store address of sum in $t1

li $t2, 0 	#initialize temp register to store running sum 
li $t3, 1	#initialize value to be added at each iteration of loop, will refer to it as adder 

beqz $t0, exit	#if n==0 exit no need to loop and sum will be 0

sum_loop: 
	add $t2, $t2, $t3	#we know that loop variable is still < n, we add current value of $t3
	
	addi $t3, $t3, 1 	#increment adder by 1
	
	sgt $t4, $t3, $t0	#check if loop variable/adder > n 
	beq $t4, 0, sum_loop	#if not, loop again, once it is greater than n we'll stop looping
	
exit: 
	sw $t2, ($t1)	#store result into sum variable 
	move $a0, $t2			#store sum into $a0
	li $v0, 1			#store syscall code for print int 
	syscall				#print sum
	
	li $v0, 10 			#load syscall code for exit 
	syscall				#exit 
	

