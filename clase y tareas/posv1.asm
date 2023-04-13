; Posicion x,y de texto en patalla
; creador: Sjvn
; fecha: 29/03/2023
; Imprime el mensaje centrado en pantalla

%include 'stdio32.asm'

SECTION .data
	msg	db	'Arquitectura I!', 0h
	posxy	db	1Bh, '[12;32H', 0h
	strCls	db	1Bh, '[2J', 1Bh, '[3J', 0h
	strFin	db	1Bh, '[24; 1H', 0h

SECTION .text
	global _start

_start:
	mov	eax, strCls
	call	printStr
	mov	eax, posxy
	call	printStr
	mov 	eax, msg
	call	printStr
	mov	eax, strFin
	call	printStr
	call	endP
