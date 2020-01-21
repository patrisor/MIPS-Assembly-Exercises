# T0: Our Ascii String / Temporary Array value holder
# T1: Loop Counter
# T2: Temp Integer
# T4: Byte Counter

# Prompt user
li $v0, 4
la $a0, prompt #Load and print string asking for string
syscall

# Inputs a 1x8 vector of single-digit ASCII integers (space included)
li $v0, 8 #take in input
la $a0, buffer #load byte space into address
li $a1, 16 # allot the byte space for string
move $t0, $a0 #save string to t0
syscall

# LOOP STRING TO SCRAPE ONLY THE INDIVIDUAL ASCII NUMBERS
li $t1, 0
li $t4, 0
loop1:
	# LOOP BODY
	beq $t1, 15, end # TODO: Fix this so to not have a fixed number to check
	# Convert Pointer to Ascii Char
	lbu $t2, ($t0)
	#Convert from ASCII to digit
	addi $t2, $t2, -48 
	# CHECK CHARACTER TO SEE IF IT IS WHITESPACE
	beq $t2, -16, else #checks if char is an empty string, if so, continues loop
	j endif
	else: 
		# ITERATE LOOP
		addu $t0, $t0, 1 # Iterate Pointer
		addi $t1, $t1, 1 #add 1 to t1 counter
		j loop1
	endif:
		# TODO: Check if there are numbers or not (End the program with message, if so)
	
	
		# TESTING: Print Digit
		#li $v0, 1
		#move $a0, $t2
		#syscall
	
		# TODO: Store Digit into Digit Array
		#sw $t2, $t4($a2)
		#addi $t4, $t4, 4 
		
		# TESTING: 
		#li $v0, 11 # Print Character located at Pointer
		#lbu $a0, ($t0) 
		#syscall
	
		# ITERATE LOOP
		addu $t0, $t0, 1 # Iterate Pointer
		addi $t1, $t1, 1 #add 1 to t1 counter
		j loop1
# TODO: 
# Read the same values using Read Integer and store them in a 32-bit integer array, “VPrime”.
end:
li $t4, 0
loop2:
	beq $t4, 32, end2
	lb $t0, V($t4) # Pull Data from array
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	addi $t4, $t4, 4
	j loop2
end2:

# TODO:
# Subtract the two arrays integer by integer and put the results into a third 32-bit integer array, “VCheck”.

# TODO:
# Sum all the values in VCheck and using Write Integer, display the result.
	
# END PROGRAM
li $v0, 10
syscall

.data
prompt: .asciiz "Input V: "
buffer: .space 16
V: .space 32