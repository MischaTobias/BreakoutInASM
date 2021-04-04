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
@23823 //Ball initial position
D=A
@7
M=D
@16 //Number for screen painting
D=A
@8
M=D
// Ball Movement values
@9
M=-1
@10
M=-1

//BAR PROCESS
(BAR) //20 (12)
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

(NEXT)//32 (21)  // Value resetting for next bar row.
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

(LOOP)//53 (6)
    //TIMER
    @150
    D=A
    @6
    M=D
    @BALL_ERASE
    0;JMP

(PRESSED) //59 (24)
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

(LEFT) //83 (18)
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

(RIGHT) //101 (14)
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

(BARERASE) //115 (3)
    @4 //Bar address
    A=M
    M=0

(NEXTERASE) //118 (15)
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
(BALL) //133 (20)
    @7
    A=M
    M=-1
    @32
    D=A
    @7
    M=M+D
    @8
    M=M-1
    D=M
    @BALL
    D;JGT
    @512
    D=A
    @7
    M=M-D
    @16
    D=A 
    @8
    M=D
    
(TIMER) //153 (7)
    @6
    M=M-1
    D=M
    @CHECKIFPRESSED
    D;JEQ
    @TIMER
    0;JMP

(CHECKIFPRESSED) //160 (6)
    @KBD    
    D=M
    @PRESSED
    D;JGT
    @LOOP
    0;JMP

(BALL_ERASE) //170 (27)
    @7
    A=M
    M=0
    @32
    D=A
    @7
    M=M+D
    @8
    M=M-1
    D=M
    @BALL_ERASE
    D;JGT
    @512
    D=A
    @7
    M=M-D
    @16
    D=A 
    @8
    M=D
    //CHANGING POSITION
    @9
    D=M
    D=D+1
    @LEFTBALL
    D;JEQ
    @RIGHTBALL
    0;JMP

(LEFTBALL) //197 (4)
    @24544
    D=A
    @11
    M=D

(LEFTBALL_LOOP) //201 (18)
    @11
    D=M
    @7
    D=D-M
    @12
    M=D
    @32
    D=A
    @11
    M=M-D
    @12
    D=M
    @MOVE_LEFT
    D;JLT
    @BOUNCE_RIGHT
    D;JEQ
    @LEFTBALL_LOOP
    0;JMP

(MOVE_LEFT) //219 (4)
    @7
    M=M-1
    @CHECK_VERTICAL
    0;JMP

(BOUNCE_RIGHT) //223 (4)
    @9
    M=1
    @CHECK_VERTICAL
    0;JMP

(RIGHTBALL) //227 (4)
    @24575
    D=A
    @11
    M=D

(RIGHTBALL_LOOP) //231 (18)
    @11
    D=M
    @7
    D=D-M
    @12
    M=D
    @32
    D=A
    @11
    M=M-D
    @12
    D=M
    @MOVE_RIGHT
    D;JLT
    @BOUNCE_LEFT
    D;JEQ
    @RIGHTBALL_LOOP
    0;JMP

(MOVE_RIGHT) //249 (4)
    @7
    M=M+1
    @CHECK_VERTICAL
    0;JMP

(BOUNCE_LEFT) //253 (4)
    @9
    M=-1
    @CHECK_VERTICAL
    0;JMP

(CHECK_VERTICAL) //257 (7)
    @10
    D=M
    D=D+1
    @UPBALL
    D;JEQ
    @DOWNBALL
    0;JMP

(UPBALL) //264 (8)
    @16415
    D=A
    @7
    D=D-M
    @MOVE_UP
    D;JLT
    @BOUNCE_DOWN
    0;JMP

(MOVE_UP) //272 (6)
    @32
    D=A
    @7
    M=M-D
    @BALL
    0;JMP

(BOUNCE_DOWN) //278 (4)
    @10
    M=1
    @BALL
    0;JMP

(DOWNBALL) //282 (20)
    @23935
    D=A
    @7
    D=D-M
    @END
    D;JGT
    @512
    D=A
    @7
    D=D+M
    A=D
    D=M
    @BOUNCE_UP
    D;JLT
    @32
    D=A
    @7
    M=M+D
    @BALL
    0;JMP
    
(BOUNCE_UP) //302 (4)
    @10
    M=-1
    @BALL
    0;JMP

(END) //306 (2)
    @END
    0;JMP