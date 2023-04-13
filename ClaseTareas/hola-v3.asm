; este es el hola mundo version 3
; creador: Sjvn
; fecha: 3 de marzo del 2023
; Ejemplo no. 3 del ensamblador, calculo de longitud de cadena

SECTION .data
    msg db  'Hola Arquitectura I', 0AH ; msg = Hola arqu...
    ; msg es la etiqueta que usaremos para acceder al espacio en memoria

SECTION .text
global _start ; gloobal = ambito y _start el atributo

_start: ; declaramos el "metodo"
    ; GUARDAMOS LAS DIRECCIONES DE INICIO
    mov ebx, msg    ; mueve la direccion de memoria de la cadena a ebx
    mov eax, ebx    ; eax = ebx | ebx = direccion de memroia de msg

sigChar: ; yo decidi ponerle el nombre sigChar, puede tener cualquier nombre
    cmp byte[eax], 0    ; seria como decir en C msg[eax] == 0?
    ; saltamos si no es 0
    jz final        ; GOTO final si se cumple la condicion de arriba
    inc eax         ; increamenta eax si no ha terminado la cadena
    jmp sigChar   ; salta a la etiqueta siguiente


final:
    ; obtenemos la longitud de la cadena
    sub eax, ebx

    mov edx, eax     ; dx = longitud de cadena
    mov ecx, msg    ; cx = msg
    mov ebx, 1      ; STDOUT file
    mov eax, 4      ; funcion de sistema SYS_WRITE
    int 80h         ; llamada de sistema del kernel

mov     ebx, 0      ; return 0
mov     eax, 1      ; llama a SYS_EXIT (kernel.opcode 1)
int 80h             
