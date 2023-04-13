; Calculadora operaciones aritmeticas de dos digitos
; fecha: 08/04/2023
; creador: Sjvn

%include '../ClaseTareas/stdio32.asm'
%include 'errores.asm'

SECTION .data

SECTION .bss
    numero1:     resb    4       ; se guardan 4 bytes para almacenar los valores y realizar las operaciones
    numero2:     resb    4      
    operador:   resb    4       

SECTION .text
    global      _start


_start:
    ; se recorren los parametros que recibe
    pop         ecx    
    
    .numeros_ciclo:
        cmp         ecx, 0H             
        jz          .numeros_ciclo_final      ;para romper o salir del ciclo
        pop         eax                 
        call        ejec_calcu
        dec         ecx                 ; a ecx se le resta 
        jmp         .numeros_ciclo          ; continuar con el ciclo o recorrido
    .numeros_ciclo_final:
        call        print_resultado
        call        endP


ejec_calcu:
    cmp         ecx, 5
    je          .error          ; verificacion en el caso de que se manden mas argumentos de los esperados
    cmp         ecx, 3         
    jle         .val           ; realizar calculo de los valores
    .no_permitido:                 
        ret
    .val:                      ; ejecutar como tal las operaciones
        cmp     ecx, 3
        je      .es_1
        cmp     ecx, 1
        je      .es_2
        cmp     ecx, 2
        je      .obtener_operador
        ret
        .es_1:
            call    cadena_numero             
            mov     ebx, numero1            
            mov     dword [ebx], eax        
            ret                            
        .es_2:
            call    cadena_numero             
            mov     ebx, numero2           
            mov     dword [ebx], eax        
            ret                             
        .obtener_operador:
            mov         esi, eax            
            mov         edi, operador        
            push        eax
            call        strLen				
            mov         ecx, eax            
            pop         eax 
            cld                         
            rep         movsb

            mov         ecx, 2

            ret
    .error:
        call        mostrar_error

print_resultado:
    mov     eax, [numero1]
    mov     ebx, [numero2]

    mov     edx, operador
    cmp     byte[edx], 43
    je      .suma
    cmp     byte[edx], 45
    je      .resta
    cmp     byte[edx], 47
    je      .division
    cmp     byte[edx], 120
    je      .multiplicacion
    call        sintaxis_mostrar
    .suma:
        add     eax, ebx
        jmp     .resultadof
    .resta:
        sub     eax, ebx
        jmp     .resultadof
    .multiplicacion:
        imul     eax, ebx
        jmp     .resultadof
    .division:
	; validacion de las divisiones por 0, es decir, no son permitidas
        cmp     ebx, 0
        je      .division_error
		;en el caso de que la division sea valida
        .division_ok:
            xor     edx, edx
            idiv     ebx
            jmp     .resultadof
        .division_error:
            call    aritmetico_mostrar
    .resultadof:
        call    printIntLn
    ret
			
