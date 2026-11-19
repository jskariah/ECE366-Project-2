.data
n:              .word 7     # input n
is_fib_odd_res: .word 0     # output: 1 if Fib(n) is odd, 0 if even

.text
.globl main

main:
    
    lw $a0, n                       # Load n from memory                               

    
    jal Fibonacci                   # Call Fibonacci(n)

    # Pass Fibonacci result to IsOdd
    add $a0, $v0, $zero
    jal IsOdd

    sw $v0, is_fib_odd_res          # Store final result in memory

    # Exit program
    addi $v0, $zero, 10
    syscall

# Function: Fibonacci(n)
# Input:  $a0 = n (non-negative integer)
# Output: $v0 = nth Fibonacci number

Fibonacci:
    # Check base cases n = 0 and n = 1
    beq $a0, $zero, fib_base

    addi $t6, $zero, 1
    beq $a0, $t6, fib_base

    # Initialize Fibonacci variables
    addi $t1, $zero, 0      # a = 0
    addi $t2, $zero, 1      # b = 1
    addi $t3, $zero, 0      # i = 0

    addi $t4, $a0, -1       # n - 1

fib_loop:
    # Stop after n-1 iterations
    beq $t3, $t4, fib_done

    add $t5, $t2, $zero     # temp = b
    add $t2, $t1, $t2       # b = a + b
    add $t1, $t5, $zero     # a = temp

    addi $t3, $t3, 1        # i++
    j fib_loop

fib_base:
    add $t2, $a0, $zero  # return n


fib_done:
    add $v0, $t2, $zero  # return result
    jr $ra

# Function: IsOdd(m)
# Input:  $a0 = m (non-negative integer)
# Output: $v0 = 1 if m is odd, 0 if m is even

IsOdd:
    addi $sp, $sp, -4           # Save return address
    sw $ra, 0($sp)

    addi $a1, $zero, 2          # Set divisor to 2

    jal division                # Call division(m, 2)

    beq $v0, $zero, is_even     # Check remainder

    addi $v0, $zero, 1          # Remainder is 1 (odd)
    j end_is_odd

is_even:
    addi $v0, $zero, 0          # Remainder is 0 (even)


end_is_odd:
    lw $ra, 0($sp)              # Restore return address
    addi $sp, $sp, 4
    jr $ra

# Function: division(x, y) - Division by Repeated Subtraction (Fig 3)
# Input:  $a0 = x (dividend), $a1 = y (divisor)
# Output: $v0 = remainder (x % y)

division:
    addi $t0, $zero, 0          # Initialize quotient

div_loop:
    # Check if x < y
    slt $t6, $a0, $a1
    bne $t6, $zero, div_done

    sub $a0, $a0, $a1           # Subtract y from x

    addi $t0, $t0, 1            # Increment quotient

    j div_loop                  # Repeat loop


div_done:
    # Return remainder
    add $v0, $a0, $zero
    jr $ra