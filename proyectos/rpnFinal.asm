; Programa: Hola mundo
; Autor: Triasic Ranger
; Fecha: 21/03/2022
; Bloque de rutinas de entrada y salida estandar de 32 bits - stdio32

SECTION .data
	msg1	db  	'Ingrese la operacion: ', 0h
	msg2	db	0Ah,0h
	res1	db  	'El resultado es: ', 0h
	err1	db  	'Math ERROR', 0h
	err2	db  	'ERROR', 0h

SECTION .bss
	cadena: resb	255	

SECTION .text
	global _start
	
_start:
    	pop     ecx
    	mov     eax, ecx
    	push    ecx
    	call    calculadora
    	call    exit

;------------------- Funcion longitud de cadena ------------------
; void strlen(cadena)
strlen:
	push	ebx     	;colocar ebx en la pila
	mov	ebx, eax 	;ebx=eax

siguiente:
	cmp	byte [eax], 0	;Si contenido(eax) == 0
	jz	finConteo	;	Entonces salta a finConteo
	inc	eax		;eax++
	jmp	siguiente	;Ir a siguiente

finConteo:
	sub	eax, ebx	;eax -= ebx
	pop	ebx      	;ebx = dato contenido al principio de pila
	ret             	;retornar a donde se hizo la llamada

;-------------------- Despliegue en pantalla --------------------
; void printStr(cadena)
printStr:
	push	edx
	push	ecx
	push	ebx
	push   eax

	call	strlen
	mov edx, eax
	pop eax
	mov	ecx, eax	;ecx = *cadena
	mov	ebx, 1		;ebx = 1 -> STDOUT
	mov	eax, 4		;eax = 4 -> SYS WRITE (kernel opcode 4)
	int	80h

	pop	ebx
	pop	ecx
	pop	edx
	ret

;-------------------- Despliegue en pantalla con salto de linea--
printStrln:
	call	printStr	
	push	eax		
	mov	eax, 0Ah	
	push	eax		
	mov	eax, esp	
	call	printStr
	pop	eax
	pop	eax
	ret

;-------------------- Peticion de datos en pantalla -------------
; inputStr(cadena)
inputStr:
   	push    ebx
   	push    ecx
   	push    edx

	;------------------- Input-----------------------
	mov	edx, 255	;edx = longitud cadena
	mov	ecx, cadena	;ecx = cadena
	mov	ebx, 0		;ebx = entrada teclado
	mov	eax, 3		;servicio SYS READ
	int	80h

	mov	eax, cadena

	pop    edx
   	pop    ecx
   	pop    ebx
	ret

;-------------------- Imprimir numeros enteros ------------------
; printInt(numero)
printInt:
	push eax
	push ecx
	push edx
	push esi

	mov	ecx, 0

ciclo:
	inc	ecx
	mov 	edx, 0
	mov 	esi, 10
	idiv 	esi
	
	add	edx, 48
	push	edx
	cmp	eax, 0
	jnz	ciclo
printciclo:
	dec	ecx
	mov	eax, esp
	call 	printStr
	pop 	eax
	cmp	ecx, 0
	jnz	printciclo

	pop     esi
	pop	edx
	pop	ecx
	pop 	eax
	ret
;--------------- Leer calculadora ------------------------
calculadora:
	mov    ebx, 1
	cmp    eax, ebx
	je     exit
	cmp    eax, ebx
	jg     calc

calc:
    	pop     edx
    	pop     ecx
    	pop     ebx
    	pop     eax
    	push    ebx
    	push    ecx
    	push    edx
	jmp    procesarNum
    

    
procesarNum:
    ;------ Comparar final de cadena ---------------------
    cmp     byte [eax], 0
	je     finalDig
    ;------ Comparar operaciones en cadena ---------------
	cmp     byte [eax], 43
	je     sumaCalc
	cmp     byte [eax], 45
	je     restaCalc
	cmp     byte [eax], 42
	je     mulCalc
	cmp     byte [eax], 47
	je     divCalc
    ;------ Comparar si no es un numero ---------------
	cmp    byte [eax], 48
	jl     sig
	cmp    byte [eax], 57
	jg     sig
	;mov    byte [eax], 48

    ;------ Comparar numeros en cadena ---------------
arreglarDig:
    	cmp     byte[eax],48
    	je	cero
    
    	cmp     byte[eax],49
    	je	uno
    
    	cmp     byte[eax],50
    	je	dos
    
    	cmp     byte[eax],51
    	je	tres
    
    	cmp     byte[eax],52
    	je	cuatro
    	
    	cmp     byte[eax],53
    	je	cinco
    
    	cmp     byte[eax],54
    	je 	seis
    
    	cmp     byte[eax],55
    	je	siete
    
    	cmp     byte[eax],56
    	je	ocho
    
    	cmp     byte[eax],57
    	je	nueve
	
cero:    
    	mov     ebx,0
    	push    ebx
    	jmp     verDig
    
uno:
    	mov     ebx,1
    	push    ebx
    	jmp     verDig
dos:
    	mov     ebx,2
    	push    ebx
    	jmp     verDig
tres:
    	mov     ebx,3
    	push    ebx
    	jmp     verDig
cuatro:
    	mov     ebx,4
    	push    ebx
    	jmp     verDig
cinco:
    	mov     ebx,5
    	push    ebx
    	jmp     verDig
seis:
    	mov     ebx,6
    	push    ebx
    	jmp     verDig
siete:
    	mov     ebx,7
    	push    ebx
    	jmp     verDig
ocho:
    	mov     ebx,8
    	push    ebx
    	jmp     verDig
nueve:
    	mov     ebx,9   
    	push    ebx
    	jmp     verDig

;------ Verificar si tiene mas digitos ---------------
verDig:
    	mov     ecx, eax
    	dec     ecx
    	cmp     byte [ecx], 48
	jl      sig
	cmp     byte [ecx], 57
	jg      sig
    	pop     edx
    	pop     ebx
    	push    eax
    	push    edx
    	mov     eax, ebx
    	mov     ecx, 10
    	mul     ecx
    	pop     edx
    	add     eax, edx
    	mov     ebx, eax
    	pop     eax
    	push    ebx
	
    ;------ Siguiente caracter de la cadena ---------------
sig:
	inc    eax
	jmp    procesarNum
	
    ;------ Realizar Operaciones matematicas con pila -----------
sumaCalc:
    	pop     edx
    	pop     ebx
    	add     ebx, edx
    	push    ebx
    	jmp     sig
	
restaCalc:
    	pop     edx
    	pop     ebx
    	sub     ebx, edx
    	push    ebx
    	jmp     sig

mulCalc:
    	pop     edx
    	pop     ebx
    	push    eax
    	mov     eax, ebx
    	mul     edx
    	mov     ebx, eax
    	pop     eax
    	push    ebx
    	jmp     sig
    

divCalc:
	pop     edx
    	pop     ebx
    	cmp     edx, 0
    	je      mathError
    	push    eax
    	mov     eax, ebx
    
    	mov     ebx, edx
    	mov     edx, 0
    	mov     ecx, 0
    	
    	div     ebx
    
    	mov     ebx, eax
    	pop     eax
    	push    ebx
    	jmp     sig
    
;------ Control de errores --------------
mathError:
    	mov     eax, err1
    	call    printStrln
	ret

;------ Imprimir resultado--------------
finalDig:
	mov     eax, res1
    	call    printStr
    	pop     eax
	call	printInt
	jmp     exit
	

;-------------------- Fin --------------------------
; void exit()
exit:
	mov	ebx, 0
	mov	eax, 1
	int	80h