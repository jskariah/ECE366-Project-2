# ECE 366 - Project 2
## Progress Report #3: IsFibonacciOdd Computation

**Team Members**
1. Justin Skariah -> jskar@uic.edu
2. Rithvik Uppugunduri -> ruppu@uic.edu
3. Hamza Kittaneh -> hkitt2@uic.edu
4. Niraj Patel -> npate449@uic.edu

**Contribution of Team Members**
- Justin: 
- Rithvik: 
- Hamza: 
- Niraj: 

**GitHub Repository Link**
https://github.com/jskariah/ECE366-Project-2

**How To Run The Program**
1. First have the MARS 4.5 Simulator
2. Open *IsFibonacciOdd.asm* in MARS
3. Change n: .word 7 --> change the number *7* to a nonnegative integer input
4. Save any changes
5. Assemble (F3)
6. Go (F5)
7. View the calculated result. *Execute Tab -> Data Segment (Unselect Hexadecimal Values to make reading it easier)*
8. Input n is stored at 0x10010000
9. The output result is stored at 0x10010004 (1 = odd, 0 = even)

**How It Works**
- main loads n and calls Fibonacci(n)
- Fibonacci returns the nth Fibonacci number in $v0
- main passes that number to IsOdd
- IsOdd calls division(m, 2) and returns 1 if the remainder is 1, else 0
- main stores the result in memory

**Expected Results**
*Input n -> Fib(n) -> Output*
- 0 -> 0 -> 0
- 1 -> 1 -> 1
- 2 -> 1 -> 1
- 3 -> 2 -> 0
- 6 -> 8 -> 0
- 7 -> 13 -> 1
- 10 -> 55 -> 1
- 15 -> 610 -> 0

**Limitations**
- Division by repeated subtraction is slow for large numbers. Keep n at 30 or below for fast results.
- n must be 46 or below. Fib(47) overflows a signed 32-bit register.