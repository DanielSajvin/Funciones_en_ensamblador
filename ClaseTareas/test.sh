nasm -f elf conversiones.asm
ld -m elf_i386 conversiones.o -o conversiones.exe
./conversiones.exe