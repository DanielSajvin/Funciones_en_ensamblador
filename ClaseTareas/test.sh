nasm -f elf busqueda.asm
ld -m elf_i386 busqueda.o -o busqueda.exe
./busqueda.exe

#nasm -f elf64 hola64.asm
#ld hola64.o -o hola64.exe
#./hola64.exe