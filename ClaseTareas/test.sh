#nasm -f elf flotante.asm
#ld -m elf_i386 flotante.o -o flotante.exe
#./flotante.exe

nasm -f elf64 flotante.asm
ld flotante.o -o flotante.exe
./flotante.exe