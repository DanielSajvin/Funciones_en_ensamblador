; Hola mundo utilizando archivos de cabecera con funciones de impresion en pantalla
; creador: Sjvn
; fecha: 10/mar/2023
; Ejemplo de impresion en pantalla con uso de archivos de cabecera

%include	'stdio32.asm'

SECTION .data
	msg1	db	'Hola arquitectura II', 0Ah, 0h
	msg2	db	'Reutilizando funciones...', 0Ah, 0h

SECTION .text
	global _start

_start:
	mov	eax, msg1
	call	printStr
	mov	eax, msg2
	call	printStr
	call	endP
