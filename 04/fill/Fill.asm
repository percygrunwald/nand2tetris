// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(INIT)
  // Store filled value
  @COLOR_FILLED
  M=-1

  // Store cleared value
  @COLOR_CLEARED
  M=0

(LOOP)
  @KBD
  D=M

  // If key is pressed jump to FILL
  @FILL
  D ; JNE // @KBD != 0

  // If key is not pressed jump to CLEAR
  @CLEAR
  D ; JEQ // @KBD == 0

(FILL)
  // Set the selected color to "filled"
  @COLOR_FILLED
  D=M
  @selected_color
  M=D

  // Fill the screen with the selected color
  @FILL_LOOP_INIT
  0 ; JMP


(CLEAR)
  // Set the selected color to "cleared"
  @COLOR_CLEARED
  D=M
  @selected_color
  M=D

  // Fill the screen with the selected color
  @FILL_LOOP_INIT
  0 ; JMP

(FILL_LOOP_INIT)
  // for i = SCREEN; i < KBD; i++
  @SCREEN
  D=A
  @i
  M=D

  @FILL_LOOP
  0 ; JMP

(FILL_LOOP)
  // Set the value of the memory location in `i` to selected_color
  @selected_color
  D=M
  @i
  A=M
  M=D

  // i++
  @i
  D=M+1 // Needed since we compare this later with @KBD
  M=D

  // i < KBD
  @KBD
  D=D-A
  // if i - KBD < 0, jump to FILL_LOOP
  @FILL_LOOP
  D ; JLT
  // else jump to LOOP
  @LOOP
  0 ; JMP

(END)
  @END
  0 ; JMP
