; Abrir archivo
; creador: Sjvn
; fecha: 12/04/2023
; Apertura de archivo en modo lectura

%include 'stdio32.asm'

SECTION .data
	filename	db	'readme.txt', 0h

SECTION .text
	global _start

_start:
	mov	ecx, 0		; bandera para acceso en modo de solo lectura -o_rdonly-
	mov	ebx, filename
	mov	eax, 5		; invocar sys_open
	int	80h

	call	printIntLn
	call	endP
