; Hola mundo, version 1
; creador: Sjvn
; fecha: 01/03/2023
; Ejemplo #1 de ensamblador

SECTION .data
	msg db 'Hola Arquitectura I', 0Ah	; msg es la cadena

SECTION .text
global _start

_start:
	mov	edx, 20		; edx = longitud de cadena 
	mov	ecx, msg	; ecx = cadena 
	mov	ebx, 1		; STDOUT file
	mov	eax, 4		; funcion del sistema SYS_WRITE
	int	80h
	
	mov ebx, 0		; return 0
	mov eax, 1		; llamar a SYS_EXIT (kernel opcode 1)
	int 80h
