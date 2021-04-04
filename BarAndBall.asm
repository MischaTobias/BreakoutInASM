//INITIAL VALUES
// BAR
@24397
D=A
@0 //Bar address
M=D
@3
D=A
@1 //Row drawing
M=D
@6
D=A
@2 //Column Drawing
M=D
// BALL
@24175 //Ball initial position
D=A
@7
M=D
@32767 //Number for drawing
D=A
@8
M=D
@24577 //32767 + 24577 = 57344 
D=A
@8
M=M+D
@7 //Number for drawing
D=A
@9
M=D
@6
D=A
@10
M=D

//BAR PROCESS
(BAR) //32 (12)
    @0 //Bar address
    A=M
    M=-1
    @0 //Bar address
    M=M+1
    @2 //Column Drawing
    M=M-1
    D=M
    @NEXT
    D;JEQ
    @BAR
    0;JMP

(NEXT)//44 (21)  // Value resetting for next bar row.
    @26 // 32-6
    D=A
    @0 //Bar address
    M=M+D
    @6
    D=A
    @2 //Column Drawing
    M=D
    @1 //Row drawing
    M=M-1
    D=M
    @BAR
    D;JGT // Loop ending
    @96 // 32 + 32 + 32
    D=A
    @0 //Bar address
    M=M-D
    // Value resetting for next bar drawing.
    @3
    D=A
    @1 //Row drawing
    M=D

(LOOP)//65 (6)
    //TIMER
    @10
    D=A
    @6
    M=D
    @BALL
    0;JMP

(PRESSED) //71 (24)
    //130 left
    //132 right
    @KBD //55
    D=M
    @3
    M=D
    @0
    D=M
    @4
    M=D
    @130
    D=A
    @3
    M=M-D
    D=M
    @LEFT
    D;JEQ
    @2 //Column Drawing
    D=A
    @3
    M=M-D
    D=M
    @RIGHT
    D;JEQ
    @LOOP
    0;JMP

(LEFT) //95 (18)
//Erase 3 columns to the right and add 3 to the left. Check row limits.
    @24384 
    D=A
    @0
    D=D-M
    @LOOP
    D;JEQ
    // Erasing position
    @5
    D=A
    @4
    M=M+D
    // Moving position to the left
    @0
    M=M-1
    // Values for erasing
    @3
    D=A
    @5
    M=D
    @BARERASE
    0;JMP

(RIGHT) //113 (14)
//Erase 3 columns to the left and add 3 to the right. Check row limits.
    @24410
    D=A
    @0
    D=D-M
    @LOOP
    D;JEQ
    // Moving position to the right
    @0
    M=M+1
    // Values for erasing
    @3
    D=A
    @5
    M=D
    @BARERASE
    0;JMP

(BARERASE) //127 (3)
    @4 //Bar address
    A=M
    M=0

(NEXTERASE) //130 (15)
    @32
    D=A
    @4 //Bar address
    M=M+D
    @5 // Row for erasing
    M=M-1
    D=M
    @BARERASE
    D;JGT // Loop ending
    // Resetting values for next bar erase.
    @3
    D=A
    @5 // Row for erasing
    M=D
    @BAR
    0;JMP

//BALL PROCESS
(BALL) //145 (30)
    @8 //Left drawing value
    D=M
    @7 //Ball position
    A=M
    M=D
    @9 //Right drawing value
    D=M
    @7 //Moving position to the right
    M=M+1
    A=M
    M=D
    @31 //32-1 Next ball row position
    D=A
    @7 
    M=M+D
    @10 //Ball rows quantity
    M=M-1
    D=M
    @BALL
    D;JGT
    @192 // 32 * 6 Resetting ball position
    D=A
    @7
    M=M-D
    @6
    D=A
    @10
    M=D
    @TIMER
    0;JMP
    
(TIMER) //175 (7)
    @6
    M=M-1
    D=M
    @CHECKIFPRESSED
    D;JEQ
    @TIMER
    0;JMP

(CHECKIFPRESSED) //182 (6)
    @KBD    
    D=M
    @PRESSED
    D;JGT
    @LOOP
    0;JMP
