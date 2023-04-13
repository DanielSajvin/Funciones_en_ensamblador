; metodo que se encarga de los errores posibles en una calculadora
; fecha: 08/04/10
; creador: Sjvn

SECTION .data
	limite		db	"Se ingresaron más parametros de los permitidos", 0h
	lexico		db	"Se ingreso un caracter no valido", 0h
	sintaxis	db	"El orden de los caracteres ingresados es incorrecto", 0h
	aritmetico	db	"No se puede dividir por 0", 0h

SECTION .text

mostrar_error:
	mov		eax, limite
	call	printError
	ret

lexico_mostrar:
	mov	eax, lexico
	call	printError
	ret

sintaxis_mostrar:
	mov		eax, sintaxis
	call	printError
	ret

aritmetico_mostrar:
	mov	eax, aritmetico
	call	printError
	ret

printError:
	call	printIntLn
	call	endP
