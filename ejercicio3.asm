SECTION .data
	msg db 'Hola Arquitectura I', 0Ah	; msg es la cadena 

SECTION .text
global _start

_start:
	mov	eax, msg	; mueve la direccion de la cadena ebx
	call	strLen

	mov	edx, eax	; edx = longitud cadena
	mov	ecx, msg	; ecx = cadena
	mov	ebx, 1		; STDOUT file
	mov	eax, 4		; funcion de sistema SYS_WRITE
	int	80h

	call	endP

; --------------Calculo de longitud de cadena-------------------
; srtLen(eax=cadena) -> eax int n = longitud
	push	ebx		; ebx en la pila
	mov	ebx, eax	; mueve la direccion de la cadena ebx

sigChar:
	cmp	byte[eax], 0	; if msg(eax)== 0
	jz	finLen		; 	saltar al final
	inc 	eax 
	jmp	sigChar

finLen:
	sub	eax, bx
	pop	ebx
	ret

;-------------------FIn de codigo-------------------------
endP:
	mov	ebx, 0		; return 0
	mov	eax, 1		; llamar a SYS_EXIT 
	int	80h
