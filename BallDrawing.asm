@24239 //Ball initial position
D=A
@6
M=D
@32767 //Number for screen painting
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

(BALL) //163
    @8
    D=M
    @6
    A=M
    M=D
    @9
    D=M
    @6
    M=M+1
    A=M
    M=D
    @31 //32-1
    D=A
    @6
    M=M+D
    @10
    M=M-1
    D=M
    @BALL
    D;JGT
    @192 // 32 * 6
    D=A
    @6
    M=M-D
    @6
    D=A
    @10
    M=D

(END)
    @END
    0;JMP