// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//Set R2=0
@0
D=A
@R2
M=D

//I check if R0 or R1 is 0. In that case, the multiplicacion is 0 and jump to endLoop
@R0
D=M
@endLoop
D;JEQ
@R1
D=M
@endLoop
D;JEQ

(loop)
  @R0
  D=M
  @R2
  D=D+M
  M=D

  //I use R1 as the iterator, but can be R0 too (conmutative law)
  @R1
  D=M
  D=D-1
  M=D
  @endLoop
  D;JEQ
  @loop
  D;JGT
(end)

(endLoop)
  @R2
  D=M
  M=D
(end)
