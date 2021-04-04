@23823 //Ball initial position
D=A
@7
M=D
@16 //Number for screen painting
D=A
@8
M=D

(BALL) //163
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

(END)
    @END
    0;JMP