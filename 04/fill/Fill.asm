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

(start)
  //Set the iterator to -1
  @i
  M=-1
(end)


//infinite loop that read the input keyboard

(infiniteLoop)
  //Increment the iterator
  @i
  M=M+1  
  //If the iterator is 8191, then restart
  @i
  D=M
  @8192
  D=D-A
  @start
  D;JEQ
  @KBD
  D=M
  //If a key is not pressed, then D is 0, a key is pressed otherwise
  @blackLoop
  D;JGT
  @whiteLoop
  D;JEQ
(end)

//White screen
(whiteLoop)
  @i
  D=M
  @SCREEN
  A=A+D
  M=0
  @infiniteLoop
  0;JEQ
(end)

//Black screen
(blackLoop)
  @i
  D=M
  @SCREEN
  A=A+D
  M=-1
  @infiniteLoop
  0;JEQ
(end)