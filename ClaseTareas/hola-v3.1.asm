; este es el hola mundo version 4
; creador: Sjvn
; fecha: 8 de marzo del 2023
; Ejemplo no. 4 del ensamblador, subrutinas

SECTION .data
    msg db  'Hola Arquitectura I', 0H     

SECTION .text
global _start           

_start:
    mov eax, msg        ; eax = msg
    call strLen
    mov edx, eax        ; edx = string lenght
    mov ecx, msg        ; ecx = msg
    mov ebx, 1         
    mov eax, 4          
    int 80h

    call endP

strLen:
    push ebx        
    mov ebx, eax    

sigChar:                
    cmp byte[eax], 0    
    jz  finLen           
    inc eax             
    jmp sigChar         

finLen:
    sub eax, ebx        
    pop ebx             
    ret                 


endP:
    mov ebx, 0          ; return 0
    mov eax, 1          ; llama a SYS_EXIT (kernel.opcode 1)
    int 80h             
