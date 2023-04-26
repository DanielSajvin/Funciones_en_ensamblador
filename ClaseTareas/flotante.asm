; Manejo de valores de coma flotante
; Creador: Sjvn
; Fecha: 21/04/2023

SECTION .data
    pi      dq      3.14159
    radio   dq      5.0
    buf     db      64
    format  db      "%f", 10, 0

SECTION .text
    extern  printf
    global _start

_start:
    fld     qword   [radio]     ;carga el radio al registro ST0
    fld     qword   [pi]        ;carga pi al registro ST1
    fmul                        ;multiplica los valores de st0 y st1
    fstp    qword   [radio]     ;guarda el resultado en el registro st0

    fistp   qword   [esp]       ;copia el valor de st0 a formato entero
    push    dword   format
    push    dword   buf
    call    printf

    add     esp, 8              ;limpiar la pila

    mov     eax, 1
    xor     ebx, ebx
    int     80h 
