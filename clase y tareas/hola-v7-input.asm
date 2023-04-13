; HOla mundo con ingreso de datos por peticion en patalla e ingreso por teclado 
; Creador: Sjvn
; Fecha: 15/03/2023
; Ingreso de datos y almacenamiento en memoria para impresion en pantalla

%include 'stdio32.asm'

SECTION .data
	msg1	db	'Por favor ingrese su nombre', 0h
	msg2	db	'Hola, ', 0h

SECTION .bss
	nombre: resb	255

SECTION .text
	global _start

_start:
	mov	eax, msg1
	call	printStr

	mov	edx, 255	; numero de bytes a leer
	mov	ecx, nombre	; nombre de variable a leer
	mov 	ebx, 0		; leer desde STDIN file
	mov	eax, 3		; invocacion de SYS_READ (kernel opcode 3)
	int 	80h

	mov	eax, msg2
	call	printStr

	mov	eax, nombre
	call	printStrLn

	call	endP
