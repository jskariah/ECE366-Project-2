.data
    m:          .word 15        # Input non-negative integer m
    is_odd_res: .word 0         # Output location

.text
.globl main

main:
    lw   $a0, m                 # Load m from memory into $a0
    jal  IsOdd                  # Call IsOdd(m), returns result in $v0
    sw   $v0, is_odd_res        # Store result in memory

    # Exit program cleanly in MARS
    li   $v0, 10
    syscall

# -----------------------------------------------------------------
# Function: IsOdd(m)
# Input:  $a0 = m (non-negative integer)
# Output: $v0 = 1 if m is odd, 0 if m is even
# -----------------------------------------------------------------
IsOdd:
    addi $sp, $sp, -4           # Save return address on stack
    sw   $ra, 0($sp)

    li   $a1, 2                 # Second argument y = 2
    jal  division               # Calls division(m, 2); remainder returned in $v0

    beq  $v0, $zero, is_even    # If remainder == 0 then return False
    li   $v0, 1                 # Else return True
    j    end_is_odd

is_even:
    li   $v0, 0

end_is_odd:
    lw   $ra, 0($sp)            # Restore return
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
