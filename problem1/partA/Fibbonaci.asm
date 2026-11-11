
.data
n:          .word 7
fib_result: .word 0

.text
.globl main

main:
    # loads input n from memory
    lw $t0, n

    # handles base cases: n = 0 or n = 1
    ble $t0, 1, base_case

    # initializes fibonacci variables
    li $t1, 0        # a = 0
    li $t2, 1        # b = 1
    li $t3, 0        # i = 0

    addi $t4, $t0, -1   # n - 1

fib_loop:
    # stops after n-1 iterations
    beq $t3, $t4, done

    move $t5, $t2       # temp = b
    addu $t2, $t1, $t2  # b = a + b
    move $t1, $t5       # a = temp

    addi $t3, $t3, 1    # i++
    j fib_loop

base_case:
    move $t2, $t0       # return n

done:
    # stores fibonacci result in memory
    sw $t2, fib_result

    # exit the program
    li $v0, 10
    syscall
