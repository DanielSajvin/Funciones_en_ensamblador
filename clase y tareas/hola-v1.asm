; este es el hola mundo version 1
; creador: Sjvn
; fecha: 1 de marzo del 2023
; Ejemplo no. 1 del ensamblador

SECTION .data
    ; db = data byte, pedazo de memoria de tamaño byte
    ; dw = dword...
    ; ddw = double word`
    ; usar ',' para concatenar caracteres`
    ; 0AH -> H de hexadecimal, caracter 10 (A)

    msg db  'Hola Arquitectura I', 0AH ; msg = Hola arqu...

SECTION .text
global _start		; global = ambito y _start el atributo

_start: 		; declaramos el "metodo"
    ; agregamos 'e' porque es 32 bits
    mov edx, 20     	; dx = longitud de cadena
    mov ecx, msg    	; cx = msg
    mov ebx, 1      	; STDOUT file
    mov eax, 4      	; funcion de sistema SYS_WRITE
    int 80h         	; llamada de sistema del kernel