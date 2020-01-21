############
#PRINT NAME#
############
li $v0, 4 #load integer constant (li) 4(service number) for string print in $v0 (return value from function)
la $a0, prompt_name # load address (la) of string to be printed into $a0 (argument to function)
syscall # ask the operating system to perform a service

############
# READ NAME#
############
li $v0, 8
la $a0, answer #put address of answer string in $a0 (#load byte space into address)
lw $a1, alength #put length of string in $a1
move $t0, $a0 #save string to t0
syscall

############
# PRINT AGE#
############
li $v0, 4 
la $a0, prompt_age
syscall 

############
# READ AGE #
############
li $v0, 5
syscall

############
## OUTPUT ##
############
# YOUR NAME#
############
move $t2, $v0 # save integer in temp 2 (t2)
la $a0, greeting 
li $v0, 4
syscall

move $a0, $t0 # Append your name onto the greeting
li $v0, 4 # print whole string
syscall

############
# YOUR AGE #
############
li $v0, 4 
la $a0, str1
syscall 

addi $t2, $t2, 4
li $v0, 1 # print an integer
move $a0, $t2 # integer to print goes in a0
syscall

li $v0, 4 
la $a0, str2
syscall 

############
### END ####
############
li $v0, 10 #end program
syscall

############
### DATA ###
############
.data
answer: .space 51  #will hold up to 50 characters, so the name must be 50 characters or less
prompt_name: .asciiz "What is your name? "
prompt_age: .asciiz "What is your age? "
greeting: .asciiz "Hello, "
str1: .asciiz "You will be "
str2: .asciiz " years old in four years"
alength: .word 50