
; --------------Calculo de longitud de cadena-------------------
; srtLen(eax=cadena) -> eax int n = longitud
strLen:
	push	ebx		; ebx en la pila
	mov	ebx, eax	; mueve la direccion de la cadena ebx

sigChar:
	cmp	byte[eax], 0	; if msg(eax)== 0
	jz	finLen		; 	saltar al final
	inc 	eax 
	jmp	sigChar		; Len op

finLen:
	sub	eax, ebx
	pop	ebx
	ret
;------------------Impresion en pantalla-----------------
; void printStr(eax = cadena)
printStr:
	push	 edx
	push	 ecx
	push	 ebx	;guardar el contenido en la pila
	push	 eax
	; Llamada a calculo de longitud
	; eax <- strLen(eax = cadena)
	call	 strLen

	mov	edx, eax
	pop    	eax
	mov	ecx, eax
	mov	ebx, 1
	mov	eax, 4
	int	80h

	; sacar los datos a donde estaban
	pop	ebx
	pop	ecx
	pop	edx
	ret

;-------------------Imprimir cadena con salto de linea--------------
; void prinStrLn(eax = cadena)
; imprime la cadena en pantalla seguida por la impresion de un salto de linea
printStrLn:
	call	printStr
	push	eax
	mov	eax, 0Ah
	push	eax
	mov	eax, esp
	call	printStr
	pop	eax
	pop	eax
	ret
;-----------Imprimir entero----------
printInt:
	push	eax
	push	ecx
	push	edx
	push	esi
	mov	ecx, 0

divLoop:
	inc	ecx		; conteo de digitos
	mov	edx, 0		; limpiar parte alta del dividendo
	mov	esi, 10		; esi = 10 (divisor)
	idiv	esi		; <edx:eax> / esi
	add	edx, 48		; residuo edx y cociente en eax
	push	edx
	cmp	eax, 0
printLoop:
	dec	ecx
	mov	eax, esp
	call	printStr
	pop	eax
	cmp	ecx, 0
	jnz	printLoop
	pop	esi
	pop	edx
	pop	ecx
	pop	eax
	ret
	jnz	divLoop


;------------------Imprimir entero con salto de linea--------
printIntLn:
	call	printInt
	push	eax
	mov	eax, 0Ah
	push	eax
	mov	eax, esp
	call	printStr
	pop	eax
	pop	eax
	ret

;-------------Pasar string o caracter a un número-----------
no_es_numero          db      "El valor no contiene valores validos para numero", 0H
cadena_numero:
    .copia:
        push        edx
        push        ecx
        push        ebx
        push        esi

    mov         ebx,0               
    mov         esi, eax            

    .ciclo:
        movzx   edx, byte[esi]      
        cmp     dl, 0               
        je      .ok

        cmp     dl, 48              
        jl      .no_se_puede
        cmp     dl, 57              
        jg      .no_se_puede
    
        sub     dl, 48              
        imul    ebx, 10             
        add     ebx, edx            

        inc     esi                 
        jmp     .ciclo

    .no_se_puede:
        push        eax
        mov         eax, no_es_numero
        call        printStrLn
        pop         eax

    .ok:
        mov     eax, ebx
    
    .recuperar:
        pop     esi
        pop     ebx
        pop     ecx
        pop     edx
    ret

;-------------------FIn de codigo-------------------------
endP:
	mov	ebx, 0		; return 0
	mov	eax, 1		; llamar a SYS_EXIT 
	int	80h
