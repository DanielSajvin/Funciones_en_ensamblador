; Eliminar archivo
; Creador: Sjvn
; Fecha: 19/04/23

%include    'stdio32.asm'

SECTION .data
    nombre      db      'readme.txt', 0h

SECTION .text
    global _start

_start:
    mov     ebx, nombre 
    mov     eax, 10         ; sys_unlink
    int     80h

    call    endP