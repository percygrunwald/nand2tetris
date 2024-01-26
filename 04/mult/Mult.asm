// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.
(INIT)
  @R0
  D=M
  @a
  M=D

  @R1
  D=M
  @b
  M=D

  @R2
  M=0

(LOOP)
  // if b <= 0 jump to END
  @b
  D=M
  @END
  D ; JLE

  // R2 = R2 + a
  @a
  D=M
  @R2
  M=D+M

  // b--
  @b
  M=M-1

  @LOOP
  0 ; JMP

(END)
  @END
  0 ; JMP
