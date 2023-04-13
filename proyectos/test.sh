nasm -f elf calculadora.asm
ld -m elf_i386 calculadora.o -o calculadora.exe
./calculadora.exe 10 - 3