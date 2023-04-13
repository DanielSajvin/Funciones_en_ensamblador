; Contador hasta 10
; Creador: Sjvn
; Fecha: 17/03/2023
; Programa que realiza impresion de valores del 0 al 9 en pantalla

%include	'stdio32.asm'

SECTION .text
	global	_start

_start:
	mov	ecx, 0		; ecx = 0

nextNum:
	mov	eax, ecx	; eax = ecx
	add	eax, 48		; eax = ecx + 48 = chr(eax)
	push	eax		; coloca el contenido de eax en pila
	mov	eax, esp	; eax = posicion actual de la pila
	call	printStrLn

	pop	eax
	inc	ecx
	cmp	ecx, 11		; if(ecx == 9)
	jne	nextNum

	call	endP
