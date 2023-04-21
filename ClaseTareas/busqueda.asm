; Busqueda
; Creador: Sjvn
; Fecha: 19/04/2023
; Apertura de archivo y actualizacion de contenido en el final del archivo

%include	'stdio32.asm'

SECTION .data
	nombre		db	'readme.txt', 0h
	contenido	db	'-actualizado-', 0h

SECTION .text
	global _start

_start:
	mov	ecx, 1
	mov	ebx, nombre	;o_wronly
	mov	eax, 5		;sys_open
	int	80h

	mov	edx, 2		;seek_end
	mov	ecx, 0		;mueve el cursor 0 bytes
	mov	ebx, eax	;coloca el descriptor en ebx
	mov	eax, 19		;sys_lseek
	int	80h

	mov	edx, 13		;numero de bytes a escribir
	mov	ecx, contenido
	mov	ebx, ebx
	mov	eax, 4		;sys_write
	int	80h

	call	endP


