; Contdor de 0 a 10 con impresion en pantalla
; creador: Sjvn
; fecha = 22/03/2023

%include	'stdio32.asm'

SECTION: .text
global _start

_start:
	mov	ecx, 0

nextNum:
	mov	eax, ecx
	call	printIntLn
	inc	ecx
	cmp	ecx, 10
	jne	nextNum
	call	endP
