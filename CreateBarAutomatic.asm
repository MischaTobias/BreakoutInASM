@24397
D=A
@0 // Bar address
M=D
@3
D=A
@1 // Row drawing
M=D
@6
D=A
@2 // Column Drawing
M=D

(BAR) //12
    @0 // Bar address
    A=M
    M=-1
    @0 // Bar address
    M=M+1
    @2 // Column Drawing
    M=M-1
    D=M
    @NEXT
    D;JEQ
    @BAR
    0;JMP

(NEXT)//24  // Value resetting for next bar row.
    @26 // 32-6
    D=A
    @0 // Bar address
    M=M+D
    @6
    D=A
    @2 // Column Drawing
    M=D
    @1 // Row drawing
    M=M-1
    D=M
    @BAR
    D;JGT // Loop ending
    @96 // 32 + 32 + 32
    D=A
    @0 // Bar address
    M=M-D
    // Value resetting for next bar drawing.
    @3 //41
    D=A
    @1 // Row drawing
    M=D
    @6
    D=A
    @2 // Column Drawing
    M=D
    //TIMER
    @10
    D=A
    @6
    M=D
    @TIMER
    0;JMP

(LOOP)//49
    @KBD
    D=M
    @PRESSED
    D;JGT
    @LOOP
    0;JMP

(PRESSED)
    //130 left
    //132 right
    @KBD //55
    D=M
    @3
    M=D
    @130
    D=A
    @3
    M=M-D
    @0
    D=M
    @4
    M=D
    @3
    D=M
    @LEFT
    D;JEQ
    @2 // Column Drawing
    D=A
    @3
    M=M-D
    D=M
    @RIGHT
    D;JEQ
    @LOOP
    0;JMP

(LEFT) //81
//Erase 3 columns to the right and add 3 to the left. Check row limits.
    //
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

(RIGHT) //93
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

(BARERASE) //105
    @4 // Bar address
    A=M
    M=0
    @NEXTERASE
    0;JMP

(NEXTERASE) //117
    @32
    D=A
    @4 // Bar address
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

(TIMER)
    @6
    M=M-1
    D=M
    @LOOP
    D;JEQ
    @TIMER
    0;JMP