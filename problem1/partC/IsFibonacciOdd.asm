.data
n:              .word 7     # input n
is_fib_odd_res: .word 0     # output: 1 if Fib(n) is odd, 0 if even

.text
.globl main
main:
    lw   $a0, n                 # load n from memory into $a0
    jal  Fibonacci              # call Fibonacci(n), result in $v0

    move $a0, $v0               # pass Fib(n) as the input to IsOdd
    jal  IsOdd                  # call IsOdd(Fib(n)), result in $v0

    sw   $v0, is_fib_odd_res    # store 1 or 0 in memory

    li   $v0, 10                # exit program
    syscall

# -----------------------------------------------------------------
# Function: Fibonacci(n)
# Input:  $a0 = n (non-negative integer)
# Output: $v0 = nth Fibonacci number
# -----------------------------------------------------------------
Fibonacci:
    ble  $a0, 1, fib_base       # if n <= 1, return n

    li   $t1, 0                 # a = 0
    li   $t2, 1                 # b = 1
    li   $t3, 0                 # i = 0
    addi $t4, $a0, -1           # loop runs n - 1 times

fib_loop:
    beq  $t3, $t4, fib_done     # stop after n - 1 iterations
    move $t5, $t2               # temp = b
    addu $t2, $t1, $t2          # b = a + b
    move $t1, $t5               # a = temp
    addi $t3, $t3, 1            # i++
    j    fib_loop

fib_base:
    move $t2, $a0               # b = n so it returns n

fib_done:
    move $v0, $t2               # return b
    jr   $ra                    # return to main

# -----------------------------------------------------------------
# Function: IsOdd(m)
# Input:  $a0 = m (non-negative integer)
# Output: $v0 = 1 if m is odd, 0 if m is even
# -----------------------------------------------------------------
IsOdd:
    addi $sp, $sp, -4           # save return address on stack
    sw   $ra, 0($sp)

    li   $a1, 2                 # second argument y = 2
    jal  division               # call division(m, 2), remainder in $v0

    beq  $v0, $zero, is_even    # if remainder == 0, return False
    li   $v0, 1                 # else return True
    j    end_is_odd

is_even:
    li   $v0, 0

end_is_odd:
    lw   $ra, 0($sp)            # restore return address
    addi $sp, $sp, 4
    jr   $ra

# -----------------------------------------------------------------
# Function: division(x, y) - Division by Repeated Subtraction (Fig 3)
# Input:  $a0 = x (dividend), $a1 = y (divisor)
# Output: $v0 = remainder (x % y)
# -----------------------------------------------------------------
division:
    li   $t0, 0                 # quotient = 0

div_loop:
    blt  $a0, $a1, div_done     # while (x >= y): exit if x < y
    sub  $a0, $a0, $a1          # x = x - y
    addi $t0, $t0, 1            # quotient = quotient + 1
    j    div_loop

div_done:
    move $v0, $a0               # return remaining x (remainder)
    jr   $ra