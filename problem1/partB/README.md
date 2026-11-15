Progress Report #2: IsOdd Computation

Teams Members
  1. Justin Skariah -> jskar@uic.edu
  2. Rithvik Uppugunduri -> ruppu@uic.edu
  3. Hamza Kittaneh -> hkitt2@uic.edu
  4. Niraj -> npate449@uic.edu

Contribution of Team Members
  - All team members helped with the assembly coding portion of part b for problem 1. We worked together to write the MIPS code to check if a number is odd or even. We had to fix some errors and make sure the program worked correctly.
    
  - Justin: Helped with coding, tested the program, and correcting errors.
  - Rithvik: Helped with coding and help organize the project documentation.
  - Hamza: Focused mainly writing the MIPS assembly code.
  - Niraj: Helped with debugging, testing the program, and writing the README file.

GitHub Repository Link: https://github.com/jskariah/ECE366-Project-2

How To Run the Program
  1. First have the MARS 4.5 Simulator
  2. Open IsOdd.asm in MARS
  3. Change m:.word 15 --> change the number 15 to a nonnegative integer 
  4. Save any changes
  5. Assemble (F3)
  6. Go (F5)
  7. View the calculated result. Execute Tab -> Data Segement (Unselect Hexademical values to make reading it easier)
  8. Input n is stored at 0x10010000
  9. The output result is stored at 0x10010004

Expected Results Input n -> Output
  - 0 -> 0
  - 1 -> 1
  - 2 -> 0
  - 7 -> 1
  - 14 -> 0
  - 15 -> 1
  - 20 -> 0
  - 21 -> 1
