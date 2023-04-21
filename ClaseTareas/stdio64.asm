;--------------Calculo de longitud de cadena-----------
strLen:
	push	rbx		; rbx en la pila
	mov	rbx, rax	; mueve la direccion de la cadena rbx

sigChar:
	cmp	byte[rax], 0	; if msg(rax)== 0
	jz	finLen		; 	saltar al final
	inc 	rax 
	jmp	sigChar		; Len op

finLen:
	sub	rax, rbx
	pop	rbx
	ret

;------------------Impresion en pantalla-----------------
; void printCadStr(rax = cadena)
printCad:
    ; se hace una copia a los valores de los registros
    .copia:
        push        rax             
        push        rdx
        push        rcx
        push        rbx
        push        rax             ;

    push        rax
    call        strLen          
    mov         rdx, rax       
    pop         rax             

    mov     rdx, rdx     
    mov     rsi, rax    
    mov     rdi, 1     
    mov     rax, 1     
    syscall             

    .regresar:
        pop        rax             
        pop        rbx
        pop        rcx
        pop        rdx
        pop        rax           

    ret