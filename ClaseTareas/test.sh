nasm -f elf hola-v3.1.asm
ld -m elf_i386 hola-v3.1.o -o hola-v3.1.exe
./hola-v3.1.exe