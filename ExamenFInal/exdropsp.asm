; Evaluacion final, primer ejercicio
; creador: Sjvn

%include	'stdio32.asm'

SECTION .data
    cadena1            db 'esta cadena',0
    cadena2            db 'es ejemplo',0
    cadena_concatenada db 50 dup(0)

SECTION .text
    global _start
    
_start:
    ; Mover la dirección de la cadena1 al registro edi
    mov edi, cadena1
    ; Mover la dirección de la cadena2 al registro esi
    mov esi, cadena2
    ; Mover la dirección de la cadena concatenada al registro ebx
    mov ebx, cadena_concatenada
    
    ; Copiar cadena1 a la cadena concatenada
    mov ecx, 0
    cadena1_loop:
        mov al, [edi+ecx]
        cmp al, 0
        je cadena2_loop
        mov [ebx+ecx], al
        inc ecx
        jmp cadena1_loop
        
    ; Agregar un punto en cada espacio en blanco de la cadena concatenada
    cadena2_loop:
        mov al, [esi]
        cmp al, 0
        je imprimir_cadena
        cmp al, 32
        jne concatenar_caracter
        mov byte [ebx+ecx], '.'
        inc ecx
        jmp siguiente_caracter
        
    concatenar_caracter:
        mov byte [ebx+ecx], al
        inc ecx
        
    siguiente_caracter:
        inc esi
        jmp cadena2_loop
        
    imprimir_cadena:
        ; Imprimir la cadena concatenada
        mov edx, ecx
        mov ecx, cadena_concatenada
        mov ebx, 1
        mov eax, 4
        int 80h
        
        ; Salir del programa
        mov eax, 1
        xor ebx, ebx
        int 80h
