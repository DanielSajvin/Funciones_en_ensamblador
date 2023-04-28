nasm -f elf rpnFinal.asm
ld -m elf_i386 rpnFinal.o -o rpnFinal.exe
./rpnFinal.exe (10 1 +)
