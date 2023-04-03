; Hola mundo con paso de argumentos por linea de comandos
; Creador: Sjvn
; Fecha: 15/03/2023
; Impresion de saludo en pantalla con argumentos enviados

%include 'stdio32.asm'

SECTION .text
	global _start
	
_start:
	pop	ecx		; ecx = primer valor en pila = numero de argumentos

nextArg:
	cmp	ecx, 0h 	; verificarsi aun hay argumentos
	jz	noHayArg	; si es 0 salta a noHayArg
	pop	eax		; eax = argumento en la pila
	call	printStrLn	
	dec	ecx		; ecx --
	jmp	nextArg

noHayArg:
	call	endP

