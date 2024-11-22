.data
array: .word 1, 2, 4, 8, 9, 11, 12, 16, 21, 24
.text

la $t0, array #base address of array
addi $s0, $s0, 0 #i = 0
addi $s1, $s1, 10 #length = 10
addi $s2, $s2, 0 #count = 0
addi $s3, $s3, 4 #set divisble value to 4

loop:
#if i is greater than length jump out of loop
slt $t1, $s0, $s1 
beqz $t1, print

#get address for array[i]
sll $t2, $s0, 2 #i * 4
add $t2, $t2, $t0 #base address + (i*4)

lw $t3, ($t2) #value of array[i]
div $t3, $s3 # array[i] / 4
mfhi $t3 #set $t2 to the remainder of the division done
addi $s0, $s0, 1 #i ++ before we loop
bnez $t3, loop #if array[i] % 4 != 0 start jump back to start of loop
addi $s2, $s2, 1 #count ++
j loop

print:
#print count
li $v0, 1
move $a0, $s2
syscall