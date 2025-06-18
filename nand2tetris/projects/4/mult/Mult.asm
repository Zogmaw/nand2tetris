// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//initialize R2 to 0
@R2
M=0

//Get the number of times we'll interate through our loop
@R0
D=M

//Store that in i
@i
M=D

//Skip if i (R0) = 0
@END
D;JLE

//Define our loop
(LOOP)
  //Get R1
  @R1
  D=M

  //R2 = R2 + R1
  @R2
  M=M+D

  //Decrement i
  @i
  M=M-1
  D=M

  //if i > 0, loop again
  @LOOP
  D;JGT

(END)
  @END
  0;JMP