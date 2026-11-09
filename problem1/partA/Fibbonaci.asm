
.data
n:          .word 7
fib_result: .word 0

.text
.globl main

main:
    # load input n from memory
    lw $t0, n

    # checks base cases -> n = 0 or n = 1
    beq $t0, $zero, base_case

    addi $t6, $zero, 1
    beq $t0, $t6, base_case

    # initialize the fibonacci variables
    addi $t1, $zero, 0    # a = 0
    addi $t2, $zero, 1    # b = 1
    addi $t3, $zero, 0    # i = 0

    addi $t4, $t0, -1     # n - 1

fib_loop:
    # stops after n-1 iterations
    beq $t3, $t4, done

    add $t5, $t2, $zero  # temp = b
    add $t2, $t1, $t2    # b = a + b
    add $t1, $t5, $zero  # a = temp

    addi $t3, $t3, 1     # i = i + 1
    j fib_loop

base_case:
    # return n
    add $t2, $t0, $zero  

done:
    # stores fibonacci result in memory
    sw $t2, fib_result

    # exit program
    addi $v0, $zero, 10
    syscall
