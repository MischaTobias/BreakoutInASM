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

(BAR) //12
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

(NEXT)//24  //Reiniciar datos para creación de siguiente línea
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
    @3 //41
    D=A
    @1 //Dato por línea a dibujar
    M=D
    @6
    D=A
    @2 //Dato por columna a dibujar
    M=D

(LOOP)//49
    @KBD
    D=M
    @PRESSED
    D;JGT
    @LOOP
    0;JMP

(PRESSED)
    //130 izquierda
    //132 derecha
    @KBD //55
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

(LEFT) //81
//BORRAR LAS 3 DE LA DERECHA Y AGREGAR 3 A LA IZQUIERDA, VERIFICAR QUE SEA MENOR A 32 (De esa línea en específico) PARA QUE SE QUEDE EN LA MISMA LÍNEA
    @24385
    D=A
    @0
    D=D-M
    @LOOP
    D;JEQ
    @3
    D=A
    @4
    M=M+D
    //Mover a la izquierda la posición
    @0
    M=M-D
    //Valores para borrar
    @5
    M=D
    @6
    M=D
    @BARERASE
    0;JMP

(RIGHT) //93
//BORRAR LAS 3 DE LA IZQUIERDA Y AGREGAR 3 A LA DERECHA, VERIFICAR QUE SEA MAYOR A 32 (De esa línea en específico) PARA QUE SE QUEDE EN LA MISMA LÍNEA
    @24409
    D=A
    @0
    D=D-M
    @LOOP
    D;JEQ
    @3
    D=A
    //Mover a la derecha la posición
    @0
    M=M+D
    //Valores para borrar
    @5
    M=D
    @6
    M=D
    @BARERASE
    0;JMP

(BARERASE) //105
    @4 //Dirección guía barra
    A=M
    M=0
    @4 //Dirección guía barra
    M=M+1
    @6 //Dato por columna a borrar
    M=M-1
    D=M
    @NEXTERASE
    D;JEQ
    @BARERASE
    0;JMP

(NEXTERASE) //117
    @29 // 32-3
    D=A
    @4 //Dirección guía barra
    M=M+D
    @3
    D=A
    @6 //Dato por columna a dibujar
    M=D
    @5 //Dato por línea a dibujar
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
    M=D
    @BAR
    0;JMP