sub $t0, $s0, $s1 #i-j
sll $t0, $t0, 2 #(i-j) * 4
add $t0, $t0, $s2 # address of A[i-j]

add $t1, $s0, $s1 #i+j
sll $t1, $t1, 2 #(i+j) * 4
add $t1, $t1, $s2 # address of A[i+j]

lw $t0, ($t0) #value of A[i-j]
lw $t1, ($t1) #value of A[i+j]

add $t2, $t0, $t1 # A[i-j] + A[i+j]

addi $t3, $t3, 3 # 3
sll $t3, $t3, 2 # 3 * 4
add $t3, $t3, $s3 #address of B[3]

sw $t2, ($t3)