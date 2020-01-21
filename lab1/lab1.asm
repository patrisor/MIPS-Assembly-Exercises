#Lab 1 Program

# PRINT PROMPT
li $v0,4 #load integer constant (li) 4(service number) for string print in $v0 (return value from function)
la $a0, prompt_string # load address (la) of string to be printed into $a0 (argument to function)
syscall # ask the operating system to perform a service

# ENTERING FIRST NUMBER
li $v0,5 # read an integer
syscall # read value goes into v0

# Move FIRST NUMBER into another variable, then PRINT PROMPT
move $t1,$v0 # save integer in temp 1 (t1)
li $v0,4 #load service number for string print in $v0
syscall

# ENTERING SECOND NUMBER
li $v0,5 # read an integer
syscall # read value goes into v0

# Move SECOND NUMBER into another variable, ADD VALUES, then PRINT NEW PROMPT
move $t2,$v0 # save integer in temp 2 (t2)
add $t3,$t1,$t2 #$t3 <- contents of $t1 + contents of $t2
li $v0,4 #load service number for string print in $v0
la $a0, result_string # load address of string to be printed into $a0
syscall

# Syscall to stack integer on top of string, the print
li $v0,1 # print an integer
move $a0,$t3 # integer to print goes in a0
syscall

# STRINGS
# the null-terminated string must be defined in data segment
.data
prompt_string: .asciiz "Enter a value: "
result_string: .asciiz "The sum is: "