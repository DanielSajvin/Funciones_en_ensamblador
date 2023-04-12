; Calculadora operaciones aritmeticas de dos digitos
; fecha: 08/04/2023
; creador: Sjvn

%include 'stdio32.asm'
%include 'errores.asm'

SECTION .data
	tmp msg		db	"HOla",0h

SECTION .opp
; Se va a declarar -variables- con 4 bytes para almacenar los operadores y operando 
	operador1:	resb	4
	operador2:	resb	4
	operando:	resb	4

SECTION .text
	global		_start

;funcion principal que realiza las operaciones
_start:
;se tiene que recorrer los paramatros que hay en la pila, para despues obtener solo lo que nos interesa
	pop	ecx	;se toma el primer parametro que en este caso no nos interesa
	
	.bucle_recorrer:
		cmp	ecx, 0h		;por si hay algo en la pila
		jz	.recorrer_fin	;para salir del bucle o del -recorrido-
		pop	eax		;el siguiente valor se guarda en eax
		call	calculo
		dec	ecx		;se le resta 1 a ecx
		jmp	.bucle_recorrer	;para continuar en el recorrido

	.recorrer_fin:
		call	print_tmp
		call	sys_exit

;se analiza el contenido de eax, para que segun el operador realice la operacion correspondiente
calculo:
	cmp	ecx, 5
	je	.error		;vinieron mas parametros o argumentos de los permitidos
	cmp	ecx, 3		;se ignora el primer parametro
	jle	.valores	; se calcula los valores

	.invalido:
		ret
	.valores:
		cmp	ecx, 3
		je	.num1
		cmp	ecx, 1
		je	.num2
		cmp	ecx, 2
		je	.guardar_operador

; se ejecutan ya como tal todas las operaciones
		ret
		num1:
		   call		str_int
		   mov		ebx, operando1	;se pasa ebx al espacio en memoria que esta reservado
		   mov		dword [ebx], eax	; se hace push de dw a operando1
		   ret
		num2:
		   call		str_int
		   mov		ebx, operando2
		   mov		dword [ebx], eax
		   ret

	guardar_operador:
		mov	esi, eax
		mov	edi, operando
		push	eax
		call	strLen	;calcular la longitud del texto
		mov	ecx, eax
		pop	eax
		cld		;ver que el puntero si este avanzado a la siguiente posicion
		rep	movsb
		mov	ecx, 2
		ret
	.error:
		call	aviso_error
print_tmp:
	mov	eax, [operado1]
	mov	ebx, [operador2]
	mov	edx, operando
	cmp	byte[edx], 43
	je	.add
	cmp	byte[edx], 45
	je	.sub
	cmp	byte[edx], 47
	je	.div
	cmp	byte[edx], 120
	je	.mul



	.add:
		add	eax, ebx
		jmp	.res
	.sub:
		sub	eax, ebx
		jmp	.res
	.mul:
		imul	eax, ebx
		jmp	.res
	.div:
		;revisar que la division no se vaya a indefinir
		cmp	ebx, 0
		je	.div_error
		.div_val:
			xor	edx, edx
			idiv	ebx
			jmp	.res
		.div_error:
			call	aritmetico_mostrar
	.res:
		call	iPrintLn
	ret
			
