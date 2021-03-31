// A = Address
// M = RAM[A]
// D - dato guardado

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

(BAR)
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

(NEXT) //Reiniciar datos para creación de siguiente línea
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
    @70 //32+32+6
    D=A
    @0 //Dirección guía barra
    M=M-D
    /** Restablecimiento de valores para creación de barra */
    @3
    D=A
    @1 //Dato por línea a dibujar
    M=D
    @6
    D=A
    @2 //Dato por columna a dibujar
    M=D

(LOOP)
    @KBD
    D=M
    @PRESSED
    D;JGT
    @LOOP
    0;JMP

(PRESSED)
    //130 izquierda
    //132 derecha
    @KBD
    D=M
    @4
    M=D
    @130
    D=A
    @4
    M=M-D
    D=M
    @LEFT
    D;JEQ
    @2 //Dato por columna a dibujar
    D=A
    @4
    M=M-D
    D=M
    @RIGHT
    D;JEQ
    @LOOP
    0;JMP

(LEFT)
//BORRAR LAS 3 DE LA DERECHA Y AGREGAR 3 A LA IZQUIERDA
//VERIFICAR QUE SEA MENOR A 32 (De esa línea en específico) PARA QUE SE QUEDE EN LA MISMA LÍNEA
@LOOP
0;JMP


(RIGHT)
//BORRAR LAS 3 DE LA IZQUIERDA Y AGREGAR 3 A LA DERECHA
//VERIFICAR QUE SEA MAYOR A 32 (De esa línea en específico) PARA QUE SE QUEDE EN LA MISMA LÍNEA
@LOOP
0;JMP
