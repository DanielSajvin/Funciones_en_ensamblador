; este es el hola mundo version 2
; creador: Sjvn
; fecha: 3 de marzo del 2023
; Ejemplo no. 1 del ensamblador

SECTION .data
    msg db  'Hola Arquitectura I', 0AH 

SECTION .text
global _start ; gloobal = ambito y _start el atributo

_start: ; declaramos el "metodo"
    ; agregamos 'e' porque es 32 bits
    mov edx, 20     ; dx = longitud de cadena
    mov ecx, msg    ; cx = msg
    mov ebx, 1      ; STDOUT file
    mov eax, 4      ; funcion de sistema SYS_WRITE
    int 80h         ; llamada de sistema del kernel

mov     ebx, 0      ; return 0
mov     eax, 1      ; llama a SYS_EXIT (kernel.opcode 1)
int 80h             