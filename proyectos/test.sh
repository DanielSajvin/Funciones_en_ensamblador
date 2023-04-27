nasm -f elf calculadora_rpn_final.asm
ld -m elf_i386 calculadora_rpn_final.o -o calculadora_rpn_final.exe
./calculadora_rpn_final.exe 