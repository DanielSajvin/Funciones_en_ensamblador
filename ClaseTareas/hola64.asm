; Hola mundo con arquitectura de 64 bits
; Creador: abemen
; Fecha: 19/04/2023

SECTION .data
    msg     db      'Hola mundo!', 10

SECTION .text
    global _start

_start:
    mov     rdx, 12
    mov     rsi, msg
    mov     rdi, 1          ; stdout
    mov     rax, 1
    syscall

    mov     rax, 60
    xor     rdi, rdi
    syscall 