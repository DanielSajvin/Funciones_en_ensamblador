; Clase para que contiene funciones que permiten hacer conversiones de cadenas
; creador: Sjvn

SECTION .data

SECTION .bss
    cadena1:        resb        125         
    cadena2:        resb        130         
    concatenar:     resb        255         

SECTION .text

;------------PASAR A MAYUSCULAS--------------------            
;toUpperCase
aMayuscula:
    push        eax                     
    push        ebx                  
    mov         ebx, eax                
    mayusBucle:
        cmp         byte[ebx], 0           
        jz          mayusBucleFin         

        ;Verifica si el byte realmente pertenece a un caracter de la a-z
        cmp         byte[ebx], 97         
        jl          mayusBucleSigue     
        cmp         byte[ebx], 122          
        jg          mayusBucleSigue     
        mov         al, [ebx]               
        sub         al, 32                  ; pasa de (a-z) a (A-Z) por medio de ASCII
        mov         byte[ebx], al           
        
        mayusBucleSigue:
        inc         ebx                     ; ebx ++
        jmp         mayusBucle             
    
    mayusBucleFin:
    ;Regresar valores
    pop ebx
    pop eax
    
    ret

;------------------PASAR A MINUSCULA-------------------------             

;toLoweCase
aMinuscula:
    push        eax
    push        ebx
    mov         ebx, eax                

    minusBucle:
        cmp         byte[ebx], 0            
        jz          minusBucleFin
    
        ;Verifica si el byte realmente pertenece a un caracter de la A-Z
        cmp         byte[ebx], 65           
        jl          minusBucleSigue
        cmp         byte[ebx], 90          
        jg          minusBucleSigue
    
        ; cumple con el rango [A,Z]
        mov         al, [ebx]
        add         al, 32
        mov         byte[ebx], al
    
        minusBucleSigue:
        inc         ebx                     ; ebx ++
        jmp         minusBucle

    minusBucleFin:
    pop ebx
    pop eax
    
    ret

;---------------CONCATENAR CADENA------------------------                
;concarstr_
concatenarCad:
    push        ecx
    push        esi
    push        edi

    concatenarCad_copy_data:                
                                        ; Se copia el contenido a cadena2
        mov         esi, eax            
        mov         edi, cadena1        ; edi -> cadena1
        push        eax
        call        strLen              ; se calcula a longitud de texto
        mov         ecx, eax            ; ecx = longitud cadena
        pop         eax 
        cld                             ; se verifica y asegura que el puntero avance
        rep         movsb
                                        ; Se copia el contenido de eax a cadena2
        mov         esi, ebx            
        mov         edi, cadena2    
        push        eax
        call        strLen              ; se calcula la longitud de texto
        mov         ecx, eax            
        pop         eax 
        cld                             ; se verifica y asegura que el puntero avance
        rep         movsb

    ; Se procede a concatenar
    ; se mueve la primera cadena a la posicion de la cadena concatenada
    mov         esi, cadena1           
    mov         edi, concatenar             
    cld

    mov         eax, cadena1            
    call        strLen                      
    mov         ecx, eax                    
    rep         movsb                     

    mov         esi, cadena2           

    mov         eax, cadena2            
    call        strLen                     
    mov         ecx, concatenar            
    add         ecx, eax                  
    mov         edi, ecx       ; La seguna cadena empezará desde el offset de cadena1 
    
    mov         eax, cadena2           
    call        strLen                      
    inc         eax                         ; eax ++ por null
    mov         ecx, eax                    
    rep         movsb
    
    mov         eax, concatenar

    ;regresar valores
    pop         edi
    pop         esi
    pop         ecx
    ret
    