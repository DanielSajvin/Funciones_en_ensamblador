; Aplicacion que sirve para castear string a numero y vicebersa
; creador: Sjvn
; fecha: 10/03/2023

%include        'stdio32.asm'

SECTION         .data
    es_cadena      db          "Es una cadena: ", 0H
    es_numero      db          "Es un numero: ", 0H
    cad_num        db          "1016", 0H
    num            dd          28114
    num_invalido   db          "El numero ingresado no es valido", 0H

SECTION         .bss
    leer:             resb        8 ; max num 8 bytes

SECTION         .text
    global      _start


_start:
    call        convertir_a_cadena
    call        convertir_a_numero
    call        endP

convertir_a_numero:
    ; muestra el numero
    mov         eax, es_numero
    call        printStr
    mov         eax, [num]
    call        printIntLn
    ; muestra el convertido
    mov         eax, es_cadena
    call        printStr
    mov         eax, [num]
    call        entero_a_cadena
    call        printStrLn
    ret


convertir_a_cadena:
    ; imprime el string
    mov         eax, es_cadena
    call        printStr
    mov         eax, cad_num
    call        printStrLn
    ; castea el string
    mov         eax, es_numero
    call        printStr
    mov         eax, cad_num
    call        cadena_a_entero
    call        printIntLn

    ret