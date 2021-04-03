@24397
D=A
@0 //Dirección guía barra
M=D
@3
D=A
@1 //Dato por línea a dibujar
M=D
@6
D=A
@2 //Dato por columna a dibujar
M=D
//Inicialización datos pelota
@24239 //Posición inicial pelota
D=A
@6
M=D
@24576 //Número a pintar
D=A
@8
M=D
@3 //Numero a pintar
D=A
@9
M=D
@3
D=A
@10
M=D

(BAR) //28
    @0 //Dirección guía barra
    A=M
    M=-1
    @0 //Dirección guía barra
    M=M+1
    @2 //Dato por columna a dibujar
    M=M-1
    D=M
    @NEXT
    D;JEQ
    @BAR
    0;JMP

(NEXT)//40  //Reiniciar datos para creación de siguiente línea
    @26 // 32-6
    D=A
    @0 //Dirección guía barra
    M=M+D
    @6
    D=A
    @2 //Dato por columna a dibujar
    M=D
    @1 //Dato por línea a dibujar
    M=M-1
    D=M
    @BAR
    D;JGT // Finalización del loop
    @96 //32+32+32
    D=A
    @0 //Dirección guía barra
    M=M-D
    // Restablecimiento de valores para creación de barra
    @3 //57
    D=A
    @1 //Dato por línea a dibujar
    M=D
    @6
    D=A
    @2 //Dato por columna a dibujar
    M=D
    @1
    D=A
    @11
    M=D
    @TIMER
    0;JMP

(LOOP)//71
    @KBD
    D=M
    @PRESSED
    D;JGT
    @BALL
    0;JMP

(PRESSED)//77
    //130 izquierda
    //132 derecha
    @KBD 
    D=M
    @3
    M=D
    @130
    D=A
    @3
    M=M-D
    D=M
    @0
    D=M
    @4
    M=D
    @3
    D=M
    @LEFT
    D;JEQ
    @2 //Dato por columna a dibujar
    D=A
    @3
    M=M-D
    D=M
    @RIGHT
    D;JEQ
    @LOOP
    0;JMP

(LEFT) //103
//BORRAR LAS 3 DE LA DERECHA Y AGREGAR 3 A LA IZQUIERDA, VERIFICAR QUE SEA MENOR A 32 (De esa línea en específico) PARA QUE SE QUEDE EN LA MISMA LÍNEA
    @24384
    D=A
    @0
    D=D-M
    @LOOP
    D;JEQ
    @5
    D=A
    @4
    M=M+D
    //Mover a la izquierda la posición
    @0
    M=M-1
    //Valores para borrar
    @3
    D=A
    @5
    M=D
    @BARERASE
    0;JMP

(RIGHT) //121
//BORRAR LAS 3 DE LA IZQUIERDA Y AGREGAR 3 A LA DERECHA, VERIFICAR QUE SEA MAYOR A 32 (De esa línea en específico) PARA QUE SE QUEDE EN LA MISMA LÍNEA
    @24410
    D=A
    @0
    D=D-M
    @LOOP
    D;JEQ
    //Mover a la derecha la posición
    @0
    M=M+1
    //Valores para borrar
    @6
    M=1
    @3
    D=A
    @5
    M=D
    @BARERASE
    0;JMP

(BARERASE) //137
    @4 //Dirección guía barra
    A=M
    M=0
    @4 //Dirección guía barra
    M=M+1
    @NEXTERASE
    0;JMP

(NEXTERASE) //144
    @31 // 32-1
    D=A
    @4 //Dirección guía barra
    M=M+D
    @6 //Dato por columna a borrar
    M=1
    @5 //Dato por línea a borrar
    M=M-1
    D=M
    @BARERASE
    D;JGT // Finalización del loop
    // Restablecimiento de valores para borrar la barra
    @3
    D=A
    @5 //Dato por línea a borrar
    M=D
    @6 //Dato por columna a borrar
    M=1
    @BAR
    0;JMP

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
    @96 // 32 + 32 + 32
    D=A
    @6
    M=M-D
    @3
    D=A
    @10
    M=D
    @LOOP
    0;JMP

(TIMER) //193
    @11
    M=M-1
    D=M
    @LOOP
    D;JEQ
    @TIMER
    0;JMP