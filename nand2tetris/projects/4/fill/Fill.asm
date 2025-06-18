// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

@8191
D=A
@maxwords
M=D

(RESET)
  //Set the current word to 0
  @word
  M=0

  @SCREEN
  D=A
  @addr //reset ptr to SCREEN
  M=D

  //Check for input
  @CHECKINPUT
  0;JMP

(CHECKINPUT)
  @KBD
  D=M //store input in D

  @FILL //Fill if input
  D;JGT

  @EMPTY
  D;JLE //Fill if no input

(FILL)
  //Move to the current address in addr
  @addr
  A=M
  M=-1 //set to all 1s

  @addr //Move to next 16 bits
  M=M+1

  @word //increase word count
  M=M+1
  D=M

  //Check if we've written all words. If not, check input again. Else, reset our counters to the top.
  @maxwords
  D=M-D

  @CHECKINPUT
  D;JGT

  @RESET
  D;JLE

(EMPTY)
  //Move to the current address in addr
  @addr
  A=M
  M=0 //set to all 0s

  @addr //Move to next 16 bits
  M=M+1

  @word //increase word count
  M=M+1
  D=M

  //Check if we've written all words. If not, check input again. Else, reset our counters to the top.
  @maxwords
  D=M-D

  @CHECKINPUT
  D;JGT

  @RESET
  D;JLE