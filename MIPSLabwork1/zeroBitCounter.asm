.data

input: .word 15


.text

main: 
	jal zeroBitCounter
	
	li   $v0, 10          # system call for exit
     	syscall               
		
	

zeroBitCounter: 
	lw $t0, input	#get input and store in $t0
	li $t1, 0	#variable for iteration through for loop
	li $t2, 1	#Track bit position with $t2
	li $v0, 0	#Keep count of 0 bits in $t3 
	
bitLoop:  
	beq $t1, 32, endofFunc		#go to the end of function if loop tracker is 32 
	
	and $t4, $t0, $t2		#t4 = positiong & input 
	bnez $t4, incrementTrackers 	#if and t4!=0 then bit at pos $t2 is not a 0 and we go to increment trackers 
	addi $v0, $v0, 1		#otherwise, we increment our counter of 0 bits by 1 
	
	
incrementTrackers: 
	addi $t1, $t1, 1		#Increment our loop variable by 1 
	sll  $t2, $t2, 1		#Shift bit position left by 1 for next iteration of loop 
	
	j    bitLoop
	
endofFunc: 
	jr $ra
	
	
multiply: 

