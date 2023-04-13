nasm -f elf calc_rpn.asm
ld -m elf_i386 calc_rpn.o -o calc_rpn.exe
./calc_rpn.exe 2 4 3 + 2 x -