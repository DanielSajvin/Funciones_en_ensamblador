#nasm -f elf exdropsp.asm
#ld -m elf_i386 exdropsp.o -o exdropsp.exe
#./exdropsp.exe 

nasm -f elf64 exdropsp.asm
ld exdropsp.o -o exdropsp.exe
./exdropsp.exe 