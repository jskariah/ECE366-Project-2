# ECE 366 - Project 2
## Progress Report #1: Fibonacci Computation

**Team Members**
1. Justin Skariah -> jskar@uic.edu
2. Rithvik Uppugunduri -> ruppu@uic.edu
3. Hamza Kittaneh -> hkitt2@uic.edu
4. Niraj Patel -> npate449@uic.edu

**Contribution of Team Members**
- All team members helped with the assembly coding portion of part a for problem 1. It was a little tricky with the assembly syntax to get the code working and running, after *a lot* of trouble shooting, we all eventually got the code to work and the logic of the fibbonaci to work.

- We also had some trouble with the set up of the MARS workspace, but eventually we were able to figure it out

- Justin: Mainly coding
- Rithvik: Helped with coding and syntax errors
- Hamza: Helped with coding and README
- Niraj: Helped with coding and README

**GitHub Repository Link** 
https://github.com/jskariah/ECE366-Project-2


**How To Run The Program**
1. First have the MARS 4.5 Simulator
2. Open *Fiboonaci.asm* in MARS
3. Change n: .word 7 --> change the number *7* to a nonnegative integer input
4. Save any changes
5. Assemble (F3)
6. Go (F5)
7. View the calculated result. *Execute Tab -> Data Segement (Unselect Hexademical values to make reading it easier)*
8. Input n is stored at 0x10010000
9. The output result is stored at 0x10010004

**Expected Results**
*Input n -> Output*
- 0 -> 0
- 1 -> 1
- 2 -> 1
- 5 -> 5
- 6 -> 8
- 7 -> 13
- 10 -> 55
- 15 -> 610



