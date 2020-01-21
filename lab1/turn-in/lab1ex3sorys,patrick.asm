###################################
# HAMILTON - THE STORY OF TONIGHT #
###################################

# Store values into temporary reg
la $t1, duration 
la $t2, instrument
la $t3, volume 

# LOOP
li $t4, 0   # Initialize index with 0
Loop:
	bgt $t4, 19, Exit # Exit out of loop after 20 notes played
	lb $t0, pitch($t4) # Pull data from array
	# MIDI
	li $v0, 31 # initialize MIDI syscall
	move $a0, $t0 # Move value into MIDI reg
	move $a1, $t1 # Move value into MIDI reg
	move $a2, $t2 # Move value into MIDI reg
	move $a3, $t3 # Move value into MIDI reg
	syscall 
	# Increment 
	addi $t4, $t4, 1 #index by 1
	j Loop #jumps back to the top of loop

############
### END ####
############
Exit: 
	li $v0, 10 
	syscall

.data 
pitch: .byte 71, 71, 61, 63, 61, 61, 71, 71, 66, 71, 71, 61, 63, 61, 61, 71, 71, 71, 71, 71 # First 20 notes of "THE STORY OF TONIGHT"
duration: .byte 42 # in milliseconds
instrument: .byte 8 # PIANO: 1-8
volume: .byte 100
