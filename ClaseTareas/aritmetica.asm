; Operaciones aritméticas entre dos valores enteros 
; crador: Sjvn
; fecha: 24/03/2023

%include	'stdio32.asm'

SECTION .data
	suma	db	'Suma: ', 0h
	resta	db	'Resta: ', 0h
	multi	db	'Multiplicacion: ', 0h
	divi		db	'Division: ', 0h

SECTION .text
	global _start

_start:
; -----Suma------
	mov	eax, suma
	call	printStr

	mov	eax, 90
	mov	ebx, 9
	add	eax, ebx
	call	printIntLn

; -----Resta-----
	push	eax

	mov	eax, resta
	call	printStr

	pop	eax
	mov	ebx, 81
	sub	eax, ebx
	call	printIntLn


	call	endP
