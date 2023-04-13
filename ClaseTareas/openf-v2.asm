; Abrir archivo y mostrar contenido
; creador: Sjvn
; fecha: 12/04/2023
; Apertura de archivo en modo lectura

%include 'stdio32.asm'

SECTION .data
	filename	db	'readme.txt', 0h

SECTION .bss
	linea	resb 255

SECTION .text
	global _start

_start:
	mov	ecx, 0		; bandera para acceso en modo de solo lectura -o_rdonly-
	mov	ebx, filename
	mov	eax, 5		; invocar sys_open
	int	80h

	mov	edx, 12
	mov	ecx, linea
	mov	ebx, eax
	mov	eax, 3
	int 80h

	mov	eax, linea

	call	printLn

	mov	ebx, ebx
	mov	eax, 6
	int 80h

	call	endP
