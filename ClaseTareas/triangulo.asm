extern  printf

SECTION .data
    base:       dq  5.0
    altura:     dq  10.0
    medio:      dq  0.50
    format:     db  "Area = %f", 10, 0

SECTION .bss
    area:       resq    1

SECTION .text

global  main

main:
    push    rbp
    fld     qword [base]     ; carga la base en el registro ST0
    fld     qword [altura]   ; carga la altura en el registro ST1
    fld     qword [medio]

    ;fmul                    ; ST0 = base * altura
    fld     qword [altura]   ; carga la altura en el registro ST1
    fmul    qword [medio]
    fmul    qword [base]
    ;fmul
    fstp    qword [area]     ; guarda el resultado en el registro ST0

    mov     rdi, format      ; cadena con formato de impresion
    movq    xmm0, qword [area]  ; parametro de coma flotante area
    mov     rax, 1          ; numero de parametros de coma flotante

    call    printf

    pop     rbp
    mov     rax, 60         ; syscall para salir del programa
    xor     rbx, rbx        ; codigo de retorno 0
    syscall
