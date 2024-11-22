.data
array: .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 0
text: .asciiz "Count: "
.text

addi $s0, $s0, 0 # i = 0
la $s1, array # base address of array

loop:
sll $t0, $s0, 2 # i *4
add $t0, $t0, $s1 #address of array[i]
lw $t1, ($t0) # value of array[i]
beqz $t1, done 
addi $s0, $s0, 1 # i++
j loop

done:
#print text
li $v0, 4
la $a0, text
syscall

#print count
li $v0, 1
move $a0, $s0
syscall
